

import 'package:flutter/material.dart';
import 'package:shoping_hotic/utils/constants.dart';

import '../../theme/custom-app_theme.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Discover',style: AppThemes.homeAppBar,),
        ),
      ));
  }
}