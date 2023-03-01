import 'dart:convert';

class DocumentModels {
  final String uid;
  final String title;
  final List content;
  final DateTime createdAt;

  DocumentModels({
    required this.uid,
    required this.title,
    required this.content,
    required this.createdAt,
  });


  DocumentModels.fromJson(Map<String, dynamic> jsonMap)
      : this(
    uid : jsonMap['_id'] as String,
    createdAt: DateTime.fromMillisecondsSinceEpoch(jsonMap['createdAt']),
    title: jsonMap['title'] as String,
    content: List.from(jsonMap['content']),
  );

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'content': content,
      'createdAt': createdAt
    };
  }
}
