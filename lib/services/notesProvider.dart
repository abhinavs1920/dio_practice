import 'package:flutter/material.dart';
import '../model/notesModel.dart';
import 'notesServices.dart';

class NotesProvider with ChangeNotifier {
  final NotesApiService apiService = NotesApiService();
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> fetchNotes() async {
    _notes = await apiService.fetchNotes();
    notifyListeners();
  }

  Future<void> createNote(Note note) async {
    final createdNote = await apiService.createNote(note);
    _notes.add(createdNote);
    notifyListeners();
  }

  Future<void> deleteNote(String noteId) async {
    await apiService.deleteNote(noteId);
    _notes.removeWhere((note) => note.id == noteId);
    notifyListeners();
  }

  Future<void> updateNote(Note updatedNote) async {
    final index = _notes.indexWhere((note) => note.id == updatedNote.id);
    if (index != -1) {
      _notes[index] = await apiService.updateNote(updatedNote);
      notifyListeners();
    }
  }
}
