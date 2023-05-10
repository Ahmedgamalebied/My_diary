import 'package:flutter/material.dart';
import 'package:my_diary/models/note_model.dart';

import 'Widgets/Edit_View_Body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.notes});
  final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditViewBody(
        notes: notes,
      ),
    );
  }
}
