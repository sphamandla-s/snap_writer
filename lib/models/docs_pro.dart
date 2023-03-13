class DocsPro {
  final String id;
  final String title;
  final String content;
  final DateTime createdOn;

  DocsPro(
      {required this.id,
      required this.title,
      required this.content,
      required this.createdOn});

  DocsPro.fromJson(Map<String, Object?> jsonMap) : this(
    id : jsonMap['_id'] as String,
    createdOn:
    DateTime.parse(jsonMap['createdOn'] as String),
    title: jsonMap['title'] as String,
    content: jsonMap['content'] as String,
  );

  Map<String, Object?> toJson() {
    return {
      '_id' : id,
      'title': title,
      'createdOn': createdOn.toIso8601String(),
      'content': content,
    };
  }

}

class DocProFields{
  final String _noteTableName = 'docspro';
  final String _id = '_id';
  final String _title = 'title';
  final String _content = 'content';
  final String _createdOn = 'createdOn';


  String get notesTableName => _noteTableName;
  String get notesId  => _id ;
  String get notesTitle => _title;
  String get content => _content;
  String get notesCreatedOn => _createdOn;

}
