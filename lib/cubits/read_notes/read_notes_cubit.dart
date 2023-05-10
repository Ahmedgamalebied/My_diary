import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:my_diary/models/note_model.dart';

import '../../constants.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(ReadNotesSucess(notes!));
  }
}
