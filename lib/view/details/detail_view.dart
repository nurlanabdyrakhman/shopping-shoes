import 'package:flutter/material.dart';
import 'package:shoping_hotic/animation/fadeanimation.dart';
import 'package:shoping_hotic/data/dammy_data.dart';
import 'package:shoping_hotic/models/shoe_model.dart';
import 'package:shoping_hotic/utils/app_methots.dart';
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
  int? _isSizeSelected;
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                      _buttomSizeselection(size),
                      _addToBagButton(size),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align _addToBagButton(Size size) {
    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: FadeAnimation(
                          delay: 3.5,
                          child: MaterialButton(
                            minWidth: size.width/1.2,
                            height: size.height/15,
                            //color: AppConstantsColor.materialButtonColor,
                             color: widget.madel.modelColor,
                            shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(12)
                            ),
                            onPressed: (){
                              /// After desing 
                              AppMethods.addToCart(widget.madel, context);
                            },
                          child: const Text('ABD TO BAG',
                          style: TextStyle(color: AppConstantsColor.lightTextColor),
                          ),
                          ),
                        ),
                      ),
                    );
  }

  Widget _buttomSizeselection(Size size) {
    return Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    width: size.width,
                    height: size.height * 0.07,
                   
                    child: FadeAnimation(
                      delay: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                children: const [
                                  Text(
                                    'Try it',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  RotatedBox(
                                    quarterTurns: -1,
                                    child:
                                        FaIcon(FontAwesomeIcons.shoePrints),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.7,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isSizeSelected = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    width: size.width * 0.15,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        border: Border.all(
                                            color: _isSizeSelected == index
                                                ? Colors.black
                                                : Colors.grey,width: 1.5),
                                                color: _isSizeSelected == index
                                                ? Colors.black
                                                : AppConstantsColor.backgroundColor
                                                ),
                                    child: Center(
                                      child: Text(
                                        sizes[index].toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: _isSizeSelected == index
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
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
      padding: const EdgeInsets.all(2),
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
