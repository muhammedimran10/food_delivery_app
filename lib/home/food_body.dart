import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_food/home/utils/dimension.dart';
import 'package:flutter_application_food/widgets/big_text.dart';
import 'package:flutter_application_food/widgets/icon_and_text.dart';
import 'package:flutter_application_food/widgets/small_text.dart';

class Food_PageBody extends StatefulWidget {
  const Food_PageBody({Key? key}) : super(key: key);

  @override
  State<Food_PageBody> createState() => _Food_PageBodyState();
}

class _Food_PageBodyState extends State<Food_PageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() { 
      setState(() {
        _currentPageValue=pageController.page!;
      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        Container(
          // color: Colors.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (ontext,position){
            return _buildPageItem(position);
          }),
        ),
          // dots section
          new DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
        // popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left:Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            BigText(text: "Popular"),
            SizedBox(width: Dimensions.width10,),
            Container(
              margin: const EdgeInsets.only(bottom: 3),
              child: BigText(text: ".",color: Colors.black26,),
            ),
            SizedBox(width: Dimensions.width10,),
            Container(
              child: SmallText(text: "Food pairing"),
            )
          ]),
        ),
        // listof food and images
                    Container(
                      height: 1900,
                      child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index){

                              return Container(
                                margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20 ,bottom: Dimensions.height10),

                                child: Row(
                                  children: [
                                    // image section
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                                        color: Colors.white38,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:AssetImage(
                                            "assets/image/food2.jpeg"
                                            )
                                        )
                                      ),
                                    ),
                                  
                                  // text container
                                  Expanded(
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight:Radius.circular(Dimensions.radius20),
                                          bottomRight:Radius.circular(Dimensions.radius20),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                                        child: Column(

                                          children: [

                                            BigText(text: "Nutritious fruit meal in china"),
                                            SmallText(text: "With chinese characteristics"),
                                            
                                            
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

                                          ),
                                      ),
                                    ),
                                  )
                                  ],
                                ),
                              );
                            }),
                    )

        ],
    );
  }

Widget _buildPageItem(int index)
{
  Matrix4 matrix = new Matrix4.identity();
  if(index==_currentPageValue.floor()){
    var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
    var currTrans = _height*(1-currScale)/2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans,0);
    
  }else if(index == _currentPageValue.floor()+1){
    var currScale = _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
    var currTrans = _height*(1-currScale)/2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans,0);

  }else if(index == _currentPageValue.floor()-1){
    var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
    var currTrans = _height*(1-currScale)/2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans,0);
  }else{
    var currScale=0.8;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,_height*(1-_scaleFactor)/2,1 );
  }
  
  return Transform(
    transform: matrix,
    child: Stack(
      children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven?Color(0xFF69c5df):Colors.amber,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
              "assets/image/food1.jpeg"
            ))
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width30, bottom: Dimensions.height30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                color: Color(0xFFe8e8e8),
                blurRadius: 5.0,
                offset: Offset(0, 5)
              ),
                BoxShadow(
                color: Colors.white,
                offset: Offset(-5, 0)
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(5, 0)
              )
              ]
            ),

            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
  
                children: [
  
                  BigText(text: "chineese side"),
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
                ),
            ),
          ),
        ),
      ],
    ),
  );
}
}