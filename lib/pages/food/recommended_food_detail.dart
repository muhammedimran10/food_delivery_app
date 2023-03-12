import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecommenededFoodDetail extends StatelessWidget {
  const RecommenededFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(background: Image.asset("assets/image/food3.jpeg",width: double.maxFinite,)),
          )

        ],
      ),
    );
  }
}