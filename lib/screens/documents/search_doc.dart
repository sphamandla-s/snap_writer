import 'package:flutter/material.dart';

import 'new_document.dart';
import 'note_card.dart';

class SearchNotes extends SearchDelegate {
  SearchNotes({required this.noteList});
  final List<Map<String, Object?>> noteList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<Map<String, Object?>> matchQuery = [];
    for (var note in noteList) {
      if (note['title']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          note['createdOn']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
        matchQuery.add(note);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => NewDocument(
                          note: matchQuery[index],
                          isNew: false,
                        ),
                    fullscreenDialog: true),
              );
            },
            child: NoteCardWidget(
              index: index,
              note: matchQuery[index],
            ),
          );
        });
    ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<Map<String, Object?>> matchQuery = [];
    for (var note in noteList) {
      if (note['title']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          note['createdOn']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
        matchQuery.add(note);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NewDocument(note: matchQuery[index], isNew: false),
                    fullscreenDialog: true),
              );
            },
            child: NoteCardWidget(
              index: index,
              note: matchQuery[index],
            ),
          );
        });
  }
}
