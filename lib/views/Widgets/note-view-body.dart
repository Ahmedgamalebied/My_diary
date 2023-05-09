import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_diary/cubits/read_notes/read_notes_cubit.dart';
import 'package:my_diary/models/note_model.dart';
import 'package:my_diary/views/Widgets/Cutom_appBar.dart';

import 'NoteItems.dart';

class NotesviewBody extends StatelessWidget {
  const NotesviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            icon: Icons.search,
          ),
          Expanded(child: NotesListview()),
        ],
      ),
    );
  }
}

class NotesListview extends StatelessWidget {
  const NotesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<ReadNotesCubit>(context).notes!;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length,
              padding: const EdgeInsets.symmetric(vertical: 0),
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: NoteItems(),
                );
              }),
        );
      },
    );
  }
}
