import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_diary/views/Widgets/Cutom_appBar.dart';
import 'package:my_diary/views/Widgets/note-view-body.dart';
import 'package:my_diary/views/Widgets/notes_Model_sheet_bottom.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddNoteButtomSheet();
              });
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: const NotesviewBody(),
    );
  }
}
