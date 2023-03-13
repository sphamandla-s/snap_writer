import 'package:docs/models/docs_view_model.dart';
import 'package:docs/screens/documents/new_document.dart';
import 'package:docs/themes/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'myHomePage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DocsProViewModel>(
          create: (_) => DocsProViewModel())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: const MyHomePage(),
      routes: {'/newdoc': (context) => const NewDocument()},
    );
  }
}
