import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_food/pages/home/utils/dimension.dart';
import 'package:flutter_application_food/widgets/app_column.dart';
import 'package:flutter_application_food/widgets/app_icon.dart';
import 'package:flutter_application_food/widgets/big_text.dart';
import 'package:flutter_application_food/widgets/exandable_text_widget.dart';
import 'package:flutter_application_food/widgets/icon_and_text.dart';

import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food4.jpeg"),
                  
                  )
              ),

          )),
          // icons
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),

              ],
          )),
          // introduction of food
          Positioned(
            top: Dimensions.popularFoodImgSize-20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                  ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "chinese_side",),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20,),
                  Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "Depending on what marinades are made of, they can be used both to add flavour to the outside of the chicken and to tenderise it. If a marinade includes sugar or salt it will tenderise the chicken a little, but if there is an acid such as lemon juice or vinegar, buttermilk or yogurt, then the marinade will transform the texture of the outside of the chicken over time.The longer you leave an acidic marinade to work on the chicken, the worse the surface texture will get, becoming more stringy and dry, so don’t leave chicken soaking any longer than overnight. Give it 5-6 hours for the best flavour and texture – if you don't have that long, even 10 minutes of marinating will give flavour to the outside of chicken. Marinades without acid can be left longer but won’t make them work any better, so stick to 24 hours as a maximum.")))
                ],
              ),
          )),
          

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.remove,color:Color.fromARGB(255, 174, 177, 170),),
                      SizedBox(width: Dimensions.width10/2,),
                      BigText(text: "0"),
                      SizedBox(width: Dimensions.width10/2,),
                      Icon(Icons.add,color:Color.fromARGB(255, 159, 160, 158),),
                    ],
                    
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.blueAccent,
                  ),
                  
                  child: BigText(text: "\$10 | Add to cart",color: Colors.white,),
                ),

          ],
        ),
      ),
    );
    
  }
}