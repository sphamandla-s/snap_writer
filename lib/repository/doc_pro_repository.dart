import 'package:docs/database/docs_database.dart';
import 'package:docs/models/docs_pro.dart';

class DocProRepository {
      DocProFields docProFields = DocProFields();



  createDoc(String id, String title, String content, DateTime createdOn) async {
    final db = await DocsDatabase.instance.database;
    await db.insert(
        docProFields.notesTableName,
        DocsPro(id: id, title: title, content: content, createdOn: createdOn)
            .toJson());
  }

  Future<List<Map<String, Object?>>> retrieveAllNotes() async {
    DocProFields docProFields = DocProFields();
    final db = await DocsDatabase.instance.database;
    final queryResult = await db.query(docProFields.notesTableName, orderBy: 'createdOn DESC');
    return queryResult;
  }


  Future<DocsPro> readSingleNote(String id) async {
    final db = await DocsDatabase.instance.database;
    final note = await db.query(docProFields.notesTableName, where: '_id = ?', whereArgs: [id]);
    return DocsPro.fromJson(note[0]);
  }

  Future<void> deleteNote(String id) async {
    final db = await DocsDatabase.instance.database;
    await db.delete(
      docProFields.notesTableName,
      where: "_id = ?",
      whereArgs: [id],
    );
  }

  Future<void> updateNote(String id, String tittle, String note,
      DateTime createdOn) async {
    DocsPro notes = DocsPro(
      id: id,
      title: tittle,
      content: note,
      createdOn: createdOn,
    );
    final db = await DocsDatabase.instance.database;
    await db.update(docProFields.notesTableName, notes.toJson(),
        where: "_id = ?", whereArgs: [notes.id]);
  }

  closeDB() async {
    final db = await DocsDatabase.instance.database;
    db.close();
  }
}
