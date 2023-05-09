import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_diary/constants.dart';
import 'package:my_diary/models/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  addNotes(NoteModel note) async {
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      emit(AddNotesSuccess());
      await notesBox.add(note);
    } on Exception catch (e) {
      AddNotesFailure(e.toString());
    }
  }
}
