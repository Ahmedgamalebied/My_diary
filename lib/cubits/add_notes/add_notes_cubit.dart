import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_diary/constants.dart';
import 'package:my_diary/models/note_model.dart';
import 'package:my_diary/views/Widgets/colorItems.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  Color color = const Color(0xff011627);
  addNotes(NoteModel note) async {
    note.color = color.value;
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNotesSuccess());
    } on Exception catch (e) {
      emit(AddNotesFailure(e.toString()));
    }
  }
}
