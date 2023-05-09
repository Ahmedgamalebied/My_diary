import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_diary/cubits/add_notes/add_notes_cubit.dart';

import 'addFormButtomSheet.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNotesCubit(),
        ),
      ],
      child: Padding(
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
