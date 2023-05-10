import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_diary/cubits/read_notes/read_notes_cubit.dart';
import 'package:my_diary/models/note_model.dart';
import 'package:my_diary/views/Widgets/Custom_textfield.dart';
import 'package:my_diary/views/Widgets/Cutom_appBar.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.notes});
  final NoteModel notes;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.notes.title = title ?? widget.notes.title;
              widget.notes.subtitle = content ?? widget.notes.subtitle;
              widget.notes.save();
              BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            text: 'Edit Notes',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            hintText: 'Title',
            onChanged: (p0) {
              title = p0;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (p0) {
              content = p0;
            },
            hintText: 'content',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
