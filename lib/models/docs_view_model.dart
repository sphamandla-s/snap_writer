import 'package:docs/repository/doc_pro_repository.dart';
import 'package:flutter/cupertino.dart';

class DocsProViewModel extends ChangeNotifier {

  final DocProRepository _docProRepository = DocProRepository();

  Future<List<Map<String, Object?>>> get getAllAllNotes =>
      _docProRepository.retrieveAllNotes();

  addNote(String id, String tittle, String note, DateTime createdOn) async {
    await _docProRepository.createDoc(
        id, tittle, note, createdOn,);
    notifyListeners();
  }

  deleteNote(String id) {
    _docProRepository.deleteNote(id);
    notifyListeners();
  }

  updateNote(String id, String tittle, String note, DateTime createdOn) async {
    await _docProRepository.updateNote(id, tittle, note, createdOn);
  }

  closeDatabase() {
    _docProRepository.closeDB();
    notifyListeners();
  }
}
