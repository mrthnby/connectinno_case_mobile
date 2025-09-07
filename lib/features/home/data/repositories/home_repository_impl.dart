import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/home/data/datasources/home_local_datasource.dart';
import 'package:connectinno_case_mobile/features/home/data/models/note_model.dart';
import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:connectinno_case_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Implementation of the [HomeRepository] using local datasource.
@LazySingleton(as: HomeRepository)
final class HomeRepositoryImpl implements HomeRepository {
  /// Constructs the repository with a required local datasource.
  HomeRepositoryImpl(this.homeLocalDatasource);

  /// The local datasource for the repository.
  final HomeLocalDatasource homeLocalDatasource;

  @override
  Future<Either<Failure, NoteEntity>> createNote(NoteEntity note) async {
    try {
      final noteModel = NoteModel.fromEntity(note);
      final localId = await homeLocalDatasource.createNote(noteModel);
      note.localId = localId;
      return Right(note);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote(NoteEntity note) async {
    try {
      await homeLocalDatasource.deleteNote(NoteModel.fromEntity(note));
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
      await homeLocalDatasource.updateNote(NoteModel.fromEntity(note));
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
