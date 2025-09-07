import 'package:connectinno_case_mobile/core/clients/auth/auth_client.dart';
import 'package:connectinno_case_mobile/core/clients/network/api_path.dart';
import 'package:connectinno_case_mobile/core/clients/network/network_client.dart';
import 'package:connectinno_case_mobile/core/error/exceptions.dart';
import 'package:connectinno_case_mobile/features/home/data/models/note_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDatasource {
  Future<void> createNote(NoteModel note);
  Future<void> updateNote(NoteModel note);
  Future<void> deleteNote(NoteModel note);
  Future<List<NoteModel>> getNotes();
}

@LazySingleton(as: HomeRemoteDatasource)
final class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  HomeRemoteDatasourceImpl(this.networkClient, this.authClient);

  final NetworkClient networkClient;
  final AuthClient authClient;

  @override
  Future<void> createNote(NoteModel note) async {
    final token = await authClient.getToken();
    if (token == null) {
      throw AuthException(message: 'No token found');
    }
    await networkClient.post<void>(
      ApiPath.notes,
      data: note.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  @override
  Future<void> deleteNote(NoteModel note) async {
    final token = await authClient.getToken();
    if (token == null) {
      throw AuthException(message: 'No token found');
    }
    await networkClient.delete<void>(
      ApiPath.notes,
      pathParams: {'id': note.uid},
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    final token = await authClient.getToken();
    if (token == null) {
      throw AuthException(message: 'No token found');
    }
    final notes = await networkClient.get<List<Map<String, dynamic>>>(
      ApiPath.notes,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return notes.map(NoteModel.fromJson).toList();
  }

  @override
  Future<void> updateNote(NoteModel note) async {
    final token = await authClient.getToken();
    if (token == null) {
      throw AuthException(message: 'No token found');
    }
    await networkClient.put<void>(
      ApiPath.notes,
      pathParams: {'id': note.uid},
      data: note.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }
}
