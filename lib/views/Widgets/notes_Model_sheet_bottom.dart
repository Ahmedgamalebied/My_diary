import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:my_diary/cubits/add_notes/add_notes_cubit.dart';

import 'addFormButtomSheet.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: BlocConsumer<AddNotesCubit, AddNotesState>(
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNotesLoading ? true : false,
                child: const AddFormButtomSheet());
          },
          listener: (context, state) {
            if (state is AddNotesFailure) {
              print('error${state.errMessage}');
            }

            if (state is AddNotesSuccess) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
