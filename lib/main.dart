import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_diary/views/Notes_view.dart';

import 'constants.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp(const DailyApp());
}

class DailyApp extends StatelessWidget {
  const DailyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const NotesView(),
    );
  }
}
