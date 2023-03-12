import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_food/pages/home/food_body.dart';
import 'package:flutter_application_food/pages/home/utils/dimension.dart';
import 'package:flutter_application_food/widgets/big_text.dart';
import 'package:flutter_application_food/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
          children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15),
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
              
                      Column(
                        children: [
                          BigText(text:"bangladesh" ,color: Colors.amber),
                          Row(
                            children: [
                              SmallText(text:"kerala" ,color:Colors.black54),
                              const Icon(Icons.arrow_drop_down_rounded),
                            ],
                          ),
                        ],
                      ),
              
                      Center(
                        child: Container(
                          width: Dimensions.height45,
                          height: Dimensions.height45,
                          child: Icon(Icons.search,color: Colors.white, size:Dimensions.iconSize24 ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius30),
                            color:Colors.blue,
                          ),
                        ),
                      )
              
                    ],
              
                  ),
              
                ),
              ),
              Expanded(child: SingleChildScrollView(child: Food_PageBody())),
            ],
      ),

    );

  }
}
