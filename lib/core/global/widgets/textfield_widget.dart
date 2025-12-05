import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    this.color = Colors.black,
    required this.data,
    this.fontWeight = FontWeight.normal,
    this.fontsize = 14,
    this.textOverflow,
    this.maxLines
  });
  final String data;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines:maxLines ,
      overflow: textOverflow,
      style: TextStyle(

        color: color,
        fontWeight: fontWeight,
        fontSize: fontsize,
        fontFamily: 'Poppins',
      ),
    );
  }
}
