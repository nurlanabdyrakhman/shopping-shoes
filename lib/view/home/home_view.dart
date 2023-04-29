import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoping_hotic/data/dammy_data.dart';
import 'package:shoping_hotic/utils/constants.dart';
import 'package:shoping_hotic/view/home/components/home_appbar.dart';

import '../../theme/custom-app_theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const HomeAppBar(),
        body: Column(
          children: [
            _categoryView(size),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
               Container(
                color: Colors.red,
                margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
                  width: size.width/16,
                  height: size.height /2.4,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: featured.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndexOfFeatured = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: Text(
                              featured[index],
                              style: TextStyle(
                                  fontSize:
                                      selectedIndexOfFeatured == index ? 21 : 18,
                                  color: selectedIndexOfFeatured == index
                                      ? AppConstantsColor.darkTextColor
                                      : AppConstantsColor.unSelectedTextColor,
                                  fontWeight: selectedIndexOfFeatured == index
                                      ? FontWeight.bold
                                      : FontWeight.w400),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              Container(
                width: size.width*0.85,
                height: size.height*0.4,
                color: Colors.red,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: availableShoes.length,
                  itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.all(size.height*0.01),
                    width: size.width/1.5,
                    color: Colors.yellow,
                  );
                }),),
              ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryView(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.04,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexOfCategory = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                        fontSize: selectedIndexOfCategory == index ? 21 : 18,
                        color: selectedIndexOfCategory == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.unSelectedTextColor,
                        fontWeight: selectedIndexOfCategory == index
                            ? FontWeight.bold
                            : FontWeight.w400),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
