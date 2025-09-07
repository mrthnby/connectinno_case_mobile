import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/home/data/datasources/home_local_datasource.dart';
import 'package:connectinno_case_mobile/features/home/data/datasources/home_remote_datasource.dart';
import 'package:connectinno_case_mobile/features/home/data/models/note_model.dart';
import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:connectinno_case_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Implementation of the [HomeRepository] using local datasource.
@LazySingleton(as: HomeRepository)
final class HomeRepositoryImpl implements HomeRepository {
  /// Constructs the repository with a required local datasource.
  HomeRepositoryImpl(this.homeLocalDatasource, this.homeRemoteDatasource);

  /// The local datasource for the repository.
  final HomeLocalDatasource homeLocalDatasource;
  final HomeRemoteDatasource homeRemoteDatasource;

  @override
  Future<Either<Failure, NoteEntity>> createNote(NoteEntity note) async {
    try {
      final noteModel = NoteModel.fromEntity(note);
      final localId = await homeLocalDatasource.createNote(noteModel);
      note.localId = localId;
      // Try to upload to remote. If it fails (e.g., offline), we'll sync later.
      try {
        await homeRemoteDatasource.createNote(noteModel);
      } catch (_) {
        // Intentionally ignore remote errors here; will be handled in sync.
      }
      return Right(note);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote(NoteEntity note) async {
    try {
      final model = NoteModel.fromEntity(note);
      await homeLocalDatasource.deleteNote(model);
      // Best-effort remote delete
      try {
        await homeRemoteDatasource.deleteNote(model);
      } catch (_) {}
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> getNotes() async {
    try {
      final notes = await homeLocalDatasource.getNotes();
      return Right(notes.map((note) => note.toEntity()).toList());
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateNote(NoteEntity note) async {
    try {
      final model = NoteModel.fromEntity(note);
      await homeLocalDatasource.updateNote(model);
      // Best-effort remote update
      try {
        await homeRemoteDatasource.updateNote(model);
      } catch (_) {}
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> syncNotes() async {
    try {
      // Fetch both local and remote
      final localNotes = await homeLocalDatasource.getNotes();

      List<NoteModel> remoteNotes = <NoteModel>[];
      try {
        remoteNotes = await homeRemoteDatasource.getNotes();
      } catch (_) {
        // If offline or remote fails, nothing to sync now
        return const Right(null);
      }

      // Build maps by uid for quick lookup
      final Map<String, NoteModel> localByUid = {
        for (final n in localNotes) n.uid: n,
      };
      final Map<String, NoteModel> remoteByUid = {
        for (final n in remoteNotes) n.uid: n,
      };

      // 1) Pull: apply remote changes to local when remote is newer or missing locally
      for (final remote in remoteNotes) {
        final local = localByUid[remote.uid];
        if (local == null) {
          // Create locally
          await homeLocalDatasource.createNote(remote);
        } else if (remote.updatedAt.isAfter(local.updatedAt)) {
          // Update locally, preserve localId
          final updated = remote.copyWith(localId: local.localId);
          await homeLocalDatasource.updateNote(updated);
        }
      }

      // 2) Push: send local changes that are missing or newer than remote
      for (final local in localNotes) {
        final remote = remoteByUid[local.uid];
        if (remote == null) {
          try {
            await homeRemoteDatasource.createNote(local);
          } catch (_) {}
        } else if (local.updatedAt.isAfter(remote.updatedAt)) {
          try {
            await homeRemoteDatasource.updateNote(local);
          } catch (_) {}
        }
      }

      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
