import 'package:connectinno_case_mobile/core/router/routes.dart';
import 'package:connectinno_case_mobile/core/shared/presentation/widgets/app_scaffold.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_bloc.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_state.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/selection_cubit.dart';
import 'package:connectinno_case_mobile/features/home/presentation/widgets/home_app_bar.dart';
import 'package:connectinno_case_mobile/features/home/presentation/widgets/no_notes_view.dart';
import 'package:connectinno_case_mobile/features/home/presentation/widgets/notes_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Home page for the app.
///
/// Displays notes in a grid view.
/// Supports selection mode for multi-note operations.
/// Navigates to the note editor page when a note is tapped.
/// Navigates to the note editor page when a note is long-pressed.
/// Navigates to the note editor page when the floating action button is tapped.
class HomePage extends StatelessWidget {
  /// The [HomePage] constructor.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SelectionCubit(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: AppScaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: HomeAppBar(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              NoteEditorPageRoute().push<void>(context);
            },
            child: const Icon(Icons.add),
          ),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (notes) => notes.isEmpty
                    ? const NoNotesView()
                    : NotesGrid(notes: notes),
                orElse: () => const NoNotesView(),
              );
            },
          ),
        ),
      ),
    );
  }
}
