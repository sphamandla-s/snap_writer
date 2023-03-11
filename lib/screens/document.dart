import 'package:flutter/material.dart';

class Documents extends StatelessWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [],
            ),
            Column(
              children: const [
                Text('You currently have no documents'),
              ],
            ),
          ],
        ),
        Positioned(bottom: 15, right: 15,child: FloatingActionButton(onPressed: () { Navigator.pushNamed(context, '/newdoc'); },backgroundColor: Colors.red,),)
      ],
    );
  }
}
