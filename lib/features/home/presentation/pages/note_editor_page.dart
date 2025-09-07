import 'package:connectinno_case_mobile/core/extensions/context_extensions.dart';
import 'package:connectinno_case_mobile/core/shared/presentation/widgets/app_scaffold.dart';
import 'package:connectinno_case_mobile/core/shared/presentation/widgets/app_snackbar.dart';
import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_bloc.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_event.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

/// Page for creating or editing a note.
///
/// Supports rich text editing using `flutter_quill`, title editing,
/// and saving/updating notes via `HomeBloc`.
class NoteEditorPage extends StatefulWidget {
  /// Optional note to edit. If null, a new note will be created.
  const NoteEditorPage({super.key, this.note});

  /// The note to edit. If null, a new note will be created.
  final NoteEntity? note;

  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  late final QuillController _controller;
  final ScrollController _toolbarScrollController = ScrollController();
  final TextEditingController _titleController = TextEditingController();
  String? _currentNoteUid;

  @override
  void initState() {
    super.initState();

    _controller = QuillController.basic();

    if (widget.note != null) {
      _controller.document = Document.fromDelta(widget.note!.content);
      _titleController.text = widget.note!.title;
      _currentNoteUid = widget.note!.uid;
    }

    // Toolbar peek animation on first frame to indicate the editor is scrollable
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(milliseconds: 500), () async {
        await _toolbarScrollController.animateTo(
          50,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        await _toolbarScrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.bounceOut,
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _toolbarScrollController.dispose();
    super.dispose();
  }

  /// Saves a new note or updates an existing one.
  ///
  /// Uses `_currentNoteUid` to determine whether to update or create.
  void _saveOrUpdateNote() {
    final content = _controller.document.toDelta();
    final now = DateTime.now();

    if (_currentNoteUid != null) {
      NoteEntity? existingNote;
      context.read<HomeBloc>().state.maybeWhen(
        orElse: () {},
        loaded: (notes) {
          for (final n in notes) {
            if (n.uid == _currentNoteUid) {
              existingNote = n;
              break;
            }
          }
        },
      );

      existingNote ??= widget.note;

      if (existingNote != null) {
        final updatedNote = existingNote!.copyWith(
          title: _titleController.text.isEmpty
              ? existingNote!.title
              : _titleController.text,
          content: content,
          updatedAt: now,
        );
        context.read<HomeBloc>().add(HomeUpdateNoteEvent(updatedNote));
        return;
      }
    }

    final newNote = NoteEntity(
      title: _titleController.text.isEmpty
          ? 'Note ${now.toIso8601String()}'
          : _titleController.text,
      content: content,
      createdAt: now,
      updatedAt: now,
    );
    _currentNoteUid = newNote.uid;
    context.read<HomeBloc>().add(HomeCreateNoteEvent(newNote));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => null,
          error: (message) => AppSnackBar.show(
            context,
            message,
            type: SnackBarType.error,
          ),
        );
      },
      child: AppScaffold(
        appBar: AppBar(
          title: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Text(
                state.maybeWhen(
                  orElse: () => _titleController.text.isNotEmpty
                      ? _titleController.text
                      : 'Untitled',
                  loaded: (notes) {
                    final targetUid = _currentNoteUid ?? widget.note?.uid;
                    if (targetUid != null) {
                      for (final n in notes) {
                        if (n.uid == targetUid) {
                          return n.title;
                        }
                      }
                    }
                    return _titleController.text.isNotEmpty
                        ? _titleController.text
                        : 'Untitled';
                  },
                ),
              );
            },
          ),
          backgroundColor: context.colors.background,
          foregroundColor: context.colors.primary,
          elevation: 0,
          scrolledUnderElevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Edit Title'),
                    content: TextField(
                      controller: _titleController,
                      autofocus: true,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          _saveOrUpdateNote();
                          Navigator.of(context).pop();
                        },
                        child: Text('Save'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _saveOrUpdateNote,
          backgroundColor: context.colors.primary,
          child: const Icon(Icons.save, color: Colors.white),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.colors.background.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                controller: _toolbarScrollController,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: QuillSimpleToolbar(
                  controller: _controller,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.colors.background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: QuillEditor(
                  controller: _controller,
                  scrollController: ScrollController(),
                  focusNode: FocusNode(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
