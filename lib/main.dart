import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/notesProvider.dart';
import 'views/notesScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: MaterialApp(
        title: 'Notes App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NotesScreen(),
      ),
    );
  }
}
