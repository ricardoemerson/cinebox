import 'package:flutter/material.dart';

class HomeBottomNavBarItem extends BottomNavigationBarItem {
  HomeBottomNavBarItem({
    required String label,
    required String activeAsset,
    required String inactiveAsset,
    double iconWidth = 24,
    double iconHeight = 24,
    double marginTop = 20,
  }) : super(
         label: label,
         activeIcon: Container(
           margin: EdgeInsets.only(top: marginTop),
           child: Image.asset(activeAsset, width: iconWidth, height: iconHeight),
         ),
         icon: Container(
           margin: EdgeInsets.only(top: marginTop),
           child: Image.asset(inactiveAsset, width: iconWidth, height: iconHeight),
         ),
       );
}
