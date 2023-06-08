// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign align;

  const TextWidget(
      {Key? key,
      required this.text,
      required this.style,
      this.align = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      textAlign: align,
      softWrap: false,
      overflow: TextOverflow.fade,
      style: style,
    );
  }
}
