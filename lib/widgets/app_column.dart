import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_food/widgets/big_text.dart';
import 'package:flutter_application_food/widgets/icon_and_text.dart';
import 'package:flutter_application_food/widgets/small_text.dart';

import '../pages/home/utils/dimension.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
  
                children: [
  
                  BigText(text: text,size: Dimensions.font26,),
                  SizedBox(height: Dimensions.height10,),
                  Row(
                    children: [
  
                      Wrap(
                        children: List.generate(5, (index) => Icon(Icons.star,color: Colors.amber,size: 15,)),
                      ),
                      SizedBox(width: 10,),
                      SmallText(text: "4.5"),
                      SizedBox(width: 10,),
                      SmallText(text: "1287"),
                      SizedBox(width: 5,),
                      SmallText(text: "comments"),
                    ],
                    
                  ),
                  SizedBox(height: Dimensions.height20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(icon: Icons.circle_sharp,
                                        text: "Normal", 
                                        iconColor: Colors.amber,
                                        ),
                      IconAndTextWidget(icon: Icons.location_on,
                                        text: "1.7km", 
                                        iconColor: Colors.blue,
                                        ),
                      IconAndTextWidget(icon: Icons.access_time_rounded,
                                        text: "32min", 
                                        iconColor: Colors.redAccent,
                                        ),
                    ],
                  )
                ]
                );
  }
}