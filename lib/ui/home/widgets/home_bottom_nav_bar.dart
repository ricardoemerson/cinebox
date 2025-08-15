import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/resources.dart';
import 'home_bottom_nav_bar_item.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: 0,
            selectedItemColor: AppColors.red,
            unselectedItemColor: AppColors.lightGrey,
            selectedLabelStyle: TextStyle(fontSize: 12, color: AppColors.red),
            unselectedLabelStyle: TextStyle(fontSize: 10, color: AppColors.red),
            items: [
              HomeBottomNavBarItem(
                label: 'Filmes',
                activeAsset: R.ASSETS_IMAGES_ICON_FILME_NAV_BAR_PNG,
                inactiveAsset: R.ASSETS_IMAGES_ICON_FILME_NAV_BAR_INATIVO_PNG,
              ),
              HomeBottomNavBarItem(
                label: 'Favoritos',
                activeAsset: R.ASSETS_IMAGES_ICON_HEART_BNB_PNG,
                inactiveAsset: R.ASSETS_IMAGES_ICON_HEART_BNB_INATIVO_PNG,
              ),
              HomeBottomNavBarItem(
                label: 'Perfil',
                activeAsset: R.ASSETS_IMAGES_ICON_PROFILE_NAV_BAR_PNG,
                inactiveAsset: R.ASSETS_IMAGES_ICON_PROFILE_NAV_BAR_INATIVO_PNG,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
