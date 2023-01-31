import 'package:flutter/material.dart';
import 'package:quran/shared/components/to_arabic_no_converter.dart';

import '../constants/dimensions.dart';


class ArabicSuraNumber extends StatelessWidget {
  final int i;
  const ArabicSuraNumber({Key? key, required this.i,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "\uFD3E"+(i+1).toString().toArabicNumbers+"\uFD3F",
      style: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontFamily: 'me_quran',
        fontSize: Dimensions.font20,
        shadows: [
          Shadow(
            offset: Offset(0.5, 0.5),
            blurRadius: 1.0,
            color: Colors.amberAccent,
          ),
        ],
      ),
    );
  }
}
