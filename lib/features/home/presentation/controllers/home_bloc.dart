import 'package:connectinno_case_mobile/core/clients/logger/logger_service.dart';
import 'package:connectinno_case_mobile/core/di/injection.dart';
import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:connectinno_case_mobile/features/home/domain/usecases/create_note_usecase.dart';
import 'package:connectinno_case_mobile/features/home/domain/usecases/delete_note_usecase.dart';
import 'package:connectinno_case_mobile/features/home/domain/usecases/get_notes_usecase.dart';
import 'package:connectinno_case_mobile/features/home/domain/usecases/update_note_usecase.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_event.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this.getNotesUsecase,
    this.createNoteUsecase,
    this.updateNoteUsecase,
    this.deleteNoteUsecase,
  ) : super(const HomeInitialState()) {
    on<HomeGetNotesEvent>(_onHomeGetNotesEvent);
    on<HomeCreateNoteEvent>(_onHomeCreateNoteEvent);
    on<HomeUpdateNoteEvent>(_onHomeUpdateNoteEvent);
    on<HomeDeleteNoteEvent>(_onHomeDeleteNoteEvent);
  }

  final GetNotesUsecase getNotesUsecase;
  final CreateNoteUsecase createNoteUsecase;
  final UpdateNoteUsecase updateNoteUsecase;
  final DeleteNoteUsecase deleteNoteUsecase;

  Future<void> _onHomeGetNotesEvent(
    HomeGetNotesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState());
    final result = await getNotesUsecase();
    result.fold(
      (failure) => emit(HomeErrorState(message: failure.message)),
      (notes) {
        sl<LoggerService>().info('Notes loaded: ${notes.length}');
        notes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
        emit(HomeLoadedState(notes: notes));
      },
    );
  }

  Future<void> _onHomeCreateNoteEvent(
    HomeCreateNoteEvent event,
    Emitter<HomeState> emit,
  ) async {
    final currentNotes = state.maybeWhen(
      orElse: () => <NoteEntity>[],
      loaded: (notes) => notes,
    );
    emit(const HomeLoadingState());
    final result = await createNoteUsecase(event.note);
    result.fold(
      (failure) => emit(HomeErrorState(message: failure.message)),
      (note) => emit(HomeLoadedState(notes: [note, ...currentNotes])),
    );
  }

  Future<void> _onHomeUpdateNoteEvent(
    HomeUpdateNoteEvent event,
    Emitter<HomeState> emit,
  ) async {
    final currentNotes = state.maybeWhen(
      orElse: () => <NoteEntity>[],
      loaded: (notes) => notes,
    );

    emit(const HomeLoadingState());

    final result = await updateNoteUsecase(event.note);

    result.fold(
      (failure) => emit(HomeErrorState(message: failure.message)),
      (success) {
        final updatedNotes = currentNotes.map((n) {
          if (n.uid == event.note.uid) {
            return event.note;
          }
          return n;
        }).toList()..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
        emit(HomeLoadedState(notes: updatedNotes));
      },
    );
  }

  Future<void> _onHomeDeleteNoteEvent(
    HomeDeleteNoteEvent event,
    Emitter<HomeState> emit,
  ) async {
    final currentNotes = state.maybeWhen(
      orElse: () => <NoteEntity>[],
      loaded: (notes) => notes,
    );

    final updatedNotes = currentNotes
        .where((n) => n.uid != event.note.uid)
        .toList();
    emit(HomeLoadedState(notes: updatedNotes));

    final result = await deleteNoteUsecase(event.note);
    await result.fold(
      (failure) async {
        if (emit.isDone) return;
        emit(HomeErrorState(message: failure.message));
      },
      (success) async {
        if (emit.isDone) return;
        // Ensure we reflect any persisted changes order
        final refresh = await getNotesUsecase();
        if (emit.isDone) return;
        refresh.fold(
          (f) => emit(HomeErrorState(message: f.message)),
          (notes) {
            notes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
            emit(HomeLoadedState(notes: notes));
          },
        );
      },
    );
  }
}
