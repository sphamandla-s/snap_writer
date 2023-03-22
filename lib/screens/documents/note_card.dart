import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({
    Key? key,
    required this.index,
    required this.note,
  }) : super(key: key);

  final int index;
  final Map<String, Object?> note;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final minHeight = getMinHeight(index);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        constraints: const BoxConstraints(minHeight: 150),
        padding: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                note['title'].toString(),
                style: GoogleFonts.gildaDisplay(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                note['content'].toString().length < 80
                    ? '${note['content'].toString().substring(
                          0,
                        )} ....'
                    : '${note['content'].toString().substring(0, 80)} .....',
                style: GoogleFonts.gildaDisplay(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'images/play-svgrepo-com .svg',
                      semanticsLabel: 'Acme Logo',
                      colorFilter:
                          const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                      height: 15,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'images/lock-svgrepo-com .svg',
                      semanticsLabel: 'Acme Logo',
                      colorFilter:
                          const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                      height: 15,
                    ),
                  )
                ],
              ),
              Text(
                note['createdOn'].toString().split('T')[0],
                style: TextStyle(color: Colors.grey.shade500),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 150;
      case 1:
        return 200;
      case 2:
        return 200;
      case 3:
        return 150;
      default:
        return 150;
    }
  }
}
