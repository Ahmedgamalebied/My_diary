import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_diary/views/Notes_view.dart';

import 'constants.dart';
import 'models/note_model.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const DailyApp());
}

class DailyApp extends StatelessWidget {
  const DailyApp({super.key});

  //root widget error
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const NotesView(),
    );
  }
}
