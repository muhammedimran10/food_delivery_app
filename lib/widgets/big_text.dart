import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_food/pages/home/utils/dimension.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText({Key? key, this.color = Colors.black54, 
    required this.text,
    this.size=0,
    this.overFlow=TextOverflow.ellipsis,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        maxLines: 1,
        overflow: overFlow,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size==0?Dimensions.font20:size,
          fontWeight: FontWeight.w400,

        ),
    );
  }
}