import 'package:flutter/material.dart';

class UnderlineOfText extends StatelessWidget {
  const UnderlineOfText({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: width,
      color: Colors.grey,
    );
  }

  final double width;
}
