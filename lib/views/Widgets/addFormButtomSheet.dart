import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_diary/models/note_model.dart';

import '../../cubits/add_notes/add_notes_cubit.dart';
import 'Custom_buttom.dart';
import 'Custom_textfield.dart';

class AddFormButtomSheet extends StatefulWidget {
  const AddFormButtomSheet({
    super.key,
  });

  @override
  State<AddFormButtomSheet> createState() => _AddFormButtomSheetState();
}

class _AddFormButtomSheetState extends State<AddFormButtomSheet> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 36,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            hintText: 'content',
            maxLines: 8,
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddNotesCubit, AddNotesState>(builder: (context, state) {
            return CustomButtom(
              isloading: state is AddNotesLoading ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var noteModel = NoteModel(
                      title: title!,
                      subtitle: subtitle!,
                      date: DateTime.now().toString(),
                      color: Colors.blueAccent.value);
                  BlocProvider.of<AddNotesCubit>(context).addNotes(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            );
          }),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
