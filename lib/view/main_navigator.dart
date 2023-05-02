import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:shoping_hotic/utils/constants.dart';
import 'package:shoping_hotic/view/cart/cart_bag_view.dart';
import 'package:shoping_hotic/view/user_profile/user_profile_view.dart';
import 'package:shoping_hotic/view/view.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;
  List<Widget> _screen = [
    HomeView(),
    CartBagView(),
    UserProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(_selectedIndex);
    _pageController.animateToPage(
      _selectedIndex,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CustomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          iconSize: 27.0,
          bubbleCurve: Curves.linear,
          selectedColor: AppConstantsColor.materialButtonColor,
          strokeColor: AppConstantsColor.materialButtonColor,
          unSelectedColor: Colors.grey,
          backgroundColor: Colors.white,
          scaleFactor: 0.3,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.home),
            ),
            CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.shopping_cart),
            ),
            CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.person),
            ),
          ]),
    );
  }
}
