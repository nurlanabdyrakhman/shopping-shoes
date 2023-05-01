import 'package:flutter/material.dart';
import 'package:shoping_hotic/animation/fadeanimation.dart';
import 'package:shoping_hotic/data/dammy_data.dart';
import 'package:shoping_hotic/models/shoe_model.dart';
import 'package:shoping_hotic/utils/constants.dart';
import 'package:shoping_hotic/view/details/components/app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme/custom-app_theme.dart';

class DetailView extends StatefulWidget {
  DetailView(
      {super.key, required this.madel, required this.isComeFromMoreSection});
  final ShoeModel madel;
  final bool isComeFromMoreSection;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool _isCountrySelected = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _productNameAndPrice(),
                    _productShoeInfo(size.width, size.height),
                    _moreDetailsText(size.width, size.height),
                    _sideAndCountCategorySection(size),
                    Container(
                      width: size.width,
                      height: size.height * 0.07,
                      color: Colors.red,
                      child: FadeAnimation(
                        delay: 3,
                        child: Row(
                          children: [
                            Container(
                              width: size.width / 4.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const[
                                    Text(
                                      'Try it',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800),
                                    ),
                                     Text(
                                      'sil',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800),
                                    ),
                                     SizedBox(width: 8,),
                                    RotatedBox(quarterTurns: -1,
                                    child: FaIcon(FontAwesomeIcons.shoePrints),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sideAndCountCategorySection(Size size) {
    return FadeAnimation(
      delay: 2.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Size',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppConstantsColor.darkTextColor,
                fontSize: 22,
              ),
            ),
            SizedBox(
              width: size.width * 0.45,
              height: size.height * 0.05,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isCountrySelected = false;
                      });
                    },
                    child: Text(
                      'UK',
                      style: TextStyle(
                          fontWeight: _isCountrySelected
                              ? FontWeight.w400
                              : FontWeight.bold,
                          color: _isCountrySelected
                              ? Colors.grey
                              : AppConstantsColor.darkTextColor,
                          fontSize: 19),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isCountrySelected = true;
                      });
                    },
                    child: Text(
                      'USA',
                      style: TextStyle(
                          fontWeight: !_isCountrySelected
                              ? FontWeight.w400
                              : FontWeight.bold,
                          color: !_isCountrySelected
                              ? Colors.grey
                              : AppConstantsColor.darkTextColor,
                          fontSize: 19),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _moreDetailsText(width, height) {
    return FadeAnimation(
      delay: 2,
      child: const Padding(
        padding: EdgeInsets.only(top: 12),
        child: Text('MORE DETAILS', style: AppThemes.detailsMoreText),
      ),
    );
  }

  Widget _productShoeInfo(width, height) {
    return FadeAnimation(
      delay: 1.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: SizedBox(
          width: width,
          height: height / 9,
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt laoreet enim, eget sodales ligula semper at. Sed id aliquet eros, nec vestibulum felis. Nunc maximus aliquet aliquam. Quisque eget sapien at velit cursus tincidunt. Duis tempor lacinia erat eget fermentum.",
              style: AppThemes.detailsProductDescriptions),
        ),
      ),
    );
  }

  Widget _productNameAndPrice() {
    return FadeAnimation(
      delay: 1,
      child: Row(
        children: [
          Text(
            widget.madel.model,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppConstantsColor.darkTextColor,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Text('\$${widget.madel.price.toStringAsFixed(2)}',
              style: AppThemes.detailsProductPrice)
        ],
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
                ? Container(
                    padding: const EdgeInsets.all(2),
                    width: size.width / 5,
                    height: size.aspectRatio / 14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                        image: DecorationImage(
                          image: AssetImage(widget.madel.imgAddress),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.grey.withOpacity(1), BlendMode.darken),
                        )),
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        color: AppConstantsColor.lightTextColor,
                        size: 30,
                      ),
                    ))
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
                    color: widget.madel.modelColor,
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
              tag: widget.isComeFromMoreSection
                  ? widget.madel.model
                  : widget.madel.imgAddress,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(-25 / 360),
                child: Container(
                  width: size.width / 1.3,
                  height: size.height / 4.3,
                  child: Image(
                    image: AssetImage(widget.madel.imgAddress),
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
        image: AssetImage(widget.madel.imgAddress),
      ),
    );
  }
}
