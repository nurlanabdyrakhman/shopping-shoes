import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoping_hotic/animation/fadeanimation.dart';
import 'package:shoping_hotic/data/dammy_data.dart';
import 'package:shoping_hotic/models/shoe_model.dart';
import 'package:shoping_hotic/utils/constants.dart';
import 'package:shoping_hotic/view/details/detail_view.dart';
import 'package:shoping_hotic/view/home/components/home_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            _mainShoeslistView(size),
            moreTextAndIcon(),
            _bottomSizeCategory(size),
          ],
        ),
      ),
    );
  }

  SizedBox _bottomSizeCategory(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: availableShoes.length,
        itemBuilder: (context, index) {
          ShoeModel model = availableShoes[index];
          return GestureDetector(
            onTapCancel: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailView(
                  madel: model,
                  isComeFromMoreSection: false,
                ),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(10),
              width: size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 4,
                    child: FadeAnimation(
                      delay: 1,
                      child: Container(
                        width: size.width / 13,
                        height: size.height / 10,
                        color: Colors.blue,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: FadeAnimation(
                              delay: 1.5,
                              child: const Text(
                                'NEW',
                                style: AppThemes.homeGridNewText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 5,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: AppConstantsColor.darkTextColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    child: FadeAnimation(
                      delay: 1.5,
                      child: RotationTransition(
                        turns: const AlwaysStoppedAnimation(-13 / 360),
                        child: Hero(
                          tag: model.model,
                          child: Image(
                            image: AssetImage(model.imgAddress),
                            width: size.width * 0.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    child: FadeAnimation(
                      delay: 2,
                      child: Text(
                        '${model.model} ${model.model}',
                        style: AppThemes.homeGridNameAndModel,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: FadeAnimation(
                        delay: 2.2,
                        child: Text(
                          '\$${model.price.toStringAsFixed(2)}',
                          style: AppThemes.homeGridPrice,
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding moreTextAndIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'More',
            style: AppThemes.homeMoreText,
          ),
          IconButton(
            onPressed: () {
              //by teppig
            },
            icon: const Icon(
              CupertinoIcons.arrow_right,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }

  //main shoes
  Row _mainShoeslistView(Size size) {
    return Row(
      children: [
        Container(
          color: Colors.red,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          width: size.width / 16,
          height: size.height / 2.4,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Text(
                      featured[index],
                      style: TextStyle(
                          fontSize: selectedIndexOfFeatured == index ? 21 : 18,
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
          width: size.width * 0.85,
          height: size.height * 0.4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: availableShoes.length,
            itemBuilder: ((context, index) {
              ShoeModel model = availableShoes[index];
              return GestureDetector(
                onTap: () {
                  //we will

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailView(
                        madel: model,
                        isComeFromMoreSection: true,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.005,
                      vertical: size.height * 0.01),
                  width: size.width / 1.5,
                  child: Stack(
                    children: [
                      Container(
                        width: size.width / 1.81,
                        decoration: BoxDecoration(
                          color: model.modelColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: FadeAnimation(
                          delay: 1,
                          child: Row(
                            children: [
                              Text(model.name),
                              SizedBox(width: size.width * 0.3),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 10,
                        child: FadeAnimation(
                          delay: 1.5,
                          child: Text(
                            model.model,
                            style: AppThemes.homeProductModel,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 10,
                        child: FadeAnimation(
                          delay: 2,
                          child: Text('\$${model.price.toStringAsFixed(2)}'),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 50,
                        //  right: 69,
                        child: FadeAnimation(
                          delay: 2,
                          child: Hero(
                            tag: model.imgAddress,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(-30 / 360),
                              child: SizedBox(
                                width: 250,
                                height: 230,
                                child: Image(
                                  image: AssetImage(model.imgAddress),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 170,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
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
