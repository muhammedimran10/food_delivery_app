import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText({Key? key, this.color = Colors.amber, 
    required this.text,
    this.size=20,
    this.overflow=TextOverflow.ellipsis,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        overflow: overFlow,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w400,

        ),
    );
  }
}