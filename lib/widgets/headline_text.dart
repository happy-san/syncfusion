import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  final String text;

  const HeadlineText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      textAlign: TextAlign.center,
    );
  }
}
