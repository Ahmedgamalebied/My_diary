part of 'read_notes_cubit.dart';

@immutable
abstract class ReadNotesState {}

class ReadNotesInitial extends ReadNotesState {}

class ReadNotesSucess extends ReadNotesState {
  final List<NoteModel> notes;

  ReadNotesSucess(this.notes);
}

class ReadNotesLoading extends ReadNotesState {}
