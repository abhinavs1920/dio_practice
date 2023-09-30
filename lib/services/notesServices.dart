import 'package:dio/dio.dart';
import '../model/notesModel.dart';

class NotesApiService {
  final Dio _dio = Dio();

  Future<List<Note>> fetchNotes() async {
    final response = await _dio.get('https://apiURL/notes');
    final List<dynamic> data = response.data;
    return data.map((json) => Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    )).toList();
  }

  Future<Note> createNote(Note note) async {
    final response = await _dio.post('https://apiURL/notes', data: {
      'title': note.title,
      'content': note.content,
    });
    final dynamic data = response.data;
    return Note(
      id: data['id'],
      title: data['title'],
      content: data['content'],
    );
  }

  Future<void> deleteNote(String noteId) async {
    await _dio.delete('https://apiURL/notes/$noteId');
  }

  Future<Note> updateNote(Note note) async {
    final response = await _dio.put('https://apiURL/notes/${note.id}', data: {
      'title': note.title,
      'content': note.content,
    });
    final dynamic data = response.data;
    return Note(
      id: data['id'],
      title: data['title'],
      content: data['content'],
    );
  }
}
