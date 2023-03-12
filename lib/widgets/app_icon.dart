import 'package:flutter/widgets.dart';
import 'package:flutter_application_food/pages/home/utils/dimension.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgrounColor;
  final Color iconColor;
  final double size;

  const AppIcon({Key? key,
  required this.icon,
  this.backgrounColor=const Color(0xFFfcf4e4),
  this.iconColor=const Color(0xFF756d54),
  this.size=40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(borderRadius:BorderRadius.circular(size/2),
      color: backgrounColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize16,
      ),
    );
  }
}