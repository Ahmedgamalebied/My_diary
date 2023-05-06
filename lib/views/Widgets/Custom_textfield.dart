import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: KprimaryColor,
      decoration: InputDecoration(
        hintText: 'Title',
        hintStyle: TextStyle(color: KprimaryColor, fontSize: 16),
        enabledBorder: BuildBorder(),
        focusedBorder:
            BuildBorder(Color: const Color.fromARGB(255, 117, 185, 43)),
        border: BuildBorder(),
      ),
    );
  }
}

OutlineInputBorder BuildBorder({Color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Color ?? KprimaryColor),
  );
}
