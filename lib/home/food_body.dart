import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Food_PageBody extends StatefulWidget {
  const Food_PageBody({Key? key}) : super(key: key);

  @override
  State<Food_PageBody> createState() => _Food_PageBodyState();
}

class _Food_PageBodyState extends State<Food_PageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (ontext,position){
        return _buildPageItem(position);
      }),
    );
  }
}
Widget _buildPageItem(int index)
{
  return Container(
    height: 220,
    margin: EdgeInsets.only(left: 5,right: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF69c5df)
    ),
  );
}