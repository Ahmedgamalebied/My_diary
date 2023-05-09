import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_diary/cubits/add_notes/add_notes_cubit.dart';
import 'package:my_diary/simple_bloc_observer.dart';
import 'package:my_diary/views/Notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants.dart';
import 'models/note_model.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const DailyApp());
}

class DailyApp extends StatelessWidget {
  const DailyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const NotesView(),
    );
  }
}
