import 'package:flutter/material.dart';

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
          CustomButtom(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
