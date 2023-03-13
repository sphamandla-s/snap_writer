import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/docs_view_model.dart';
import '../themes/my_themes.dart';

class Documents extends StatefulWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  late List<Map<String, Object?>> _noteList = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allNotes();
  }

  allNotes() async {
    setState(() {
      isLoading = true;
    });

    _noteList = await Provider.of<DocsProViewModel>(context, listen: false).getAllAllNotes;

    setState(() {
      isLoading = false;
    });
    print(_noteList);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(),
                    const Text('DocUp', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),),
                    IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.search))
                  ],
                ),
                Column(
                  children: const [
                    Text('You currently have no documents'),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/newdoc');
                },
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(FontAwesomeIcons.pen, color: MyThemes.lightIconColor,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
