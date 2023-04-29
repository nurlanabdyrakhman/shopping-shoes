import 'package:flutter/material.dart';
import 'package:shoping_hotic/animation/fadeanimation.dart';
import 'package:shoping_hotic/data/dammy_data.dart';
import 'package:shoping_hotic/models/shoe_model.dart';
import 'package:shoping_hotic/utils/constants.dart';
import 'package:shoping_hotic/view/details/components/app_bar.dart';

import '../../theme/custom-app_theme.dart';

class DetailView extends StatelessWidget {
  DetailView(
      {super.key, required this.madel, required this.isComeFromMoreSection});
  final ShoeModel madel;
  final bool isComeFromMoreSection;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //ShoeModel model =availableShoes[index];
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const CostomDetailviewAppBar(),
        body: SizedBox(
          //color: Colors.red.withOpacity(0.2),
          width: size.width,
          height: size.height * 1.1,
          child: Column(
            children: [
              _topProductImageandBg(size),
              _morePicOfProduct(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _morePicOfProduct(Size size) {
    return FadeAnimation(
              delay: 0.5,
              child: Container(
                width: size.width,
                height: size.height * 0.1,
               
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => index == 3
                        ?  Container(
                            padding: const EdgeInsets.all(2),
                            width: size.width / 5,
                            height: size.aspectRatio / 14,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                              image: DecorationImage(image:AssetImage(madel.imgAddress),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.grey.withOpacity(1), BlendMode.darken),
                               )
                            ),
                            child:  const Center(
                             child: Icon(Icons.play_circle_fill,
                             color: AppConstantsColor.lightTextColor,
                             size: 30,
                        
                             ),
                            )
                            
                            
                          ):Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            child: roundedImage(size.width, size.height),
                          ),
                        
                  ),
                ),
              ),
            );
  }

  SizedBox _topProductImageandBg(Size size) {
    return SizedBox(
              //color: Colors.yellow.withOpacity(0.2),
              width: size.width,
              height: size.height / 2.3,
              child: Stack(
                children: [
                  Positioned(
                    left: 60,
                    bottom: 20,
                    child: FadeAnimation(
                      delay: 0.5,
                      child: Container(
                        width: size.width,
                        height: size.height / 2.2,
                        decoration: BoxDecoration(
                            color: madel.modelColor,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(1500),
                                bottomRight: Radius.circular(100))),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 30,
                    child: Hero(
                      tag: isComeFromMoreSection
                          ? madel.model
                          : madel.imgAddress,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(-25 / 360),
                        child: Container(
                          width: size.width / 1.3,
                          height: size.height / 4.3,
                          child: Image(
                            image: AssetImage(madel.imgAddress),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
  }

  roundedImage(width, height) {
    return Container(
      padding: EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(
        image: AssetImage(madel.imgAddress),
      ),
    );
  }
}
