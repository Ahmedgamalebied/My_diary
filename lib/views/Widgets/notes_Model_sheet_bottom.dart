import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_diary/cubits/add_notes/add_notes_cubit.dart';
import 'package:my_diary/cubits/read_notes/read_notes_cubit.dart';

import 'addFormButtomSheet.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        builder: (context, state) {
          return SingleChildScrollView(
              child: AbsorbPointer(
                  absorbing: state is AddNotesLoading ? true : false,
                  child: const AddFormButtomSheet()));
        },
        listener: (context, state) {
          if (state is AddNotesSuccess) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
