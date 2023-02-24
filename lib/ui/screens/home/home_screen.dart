import 'package:carousel_slider/carousel_slider.dart';
import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../res/dimen_resources.dart';

class HomeScreen extends BaseStatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> with BasicScreen {
  int _carouselActiveIndex = 0;
  List bannerList = [BANNER2, BANNER1, BANNER3, BANNER11, BANNER12, BANNER13];

  @override
  Widget buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          // extendBody: true,
          appBar: AppBar(
            title: getTitle(
              home,
              fontSize: APPBAR_FONT_SIZE,
              color: Theme.of(context).secondaryHeaderColor,
              weight: FontWeight.w700,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    bloc.add(FavoritesEvent());
                  },
                  icon: const Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    bloc.add(CartEvent());
                  },
                  icon: const Icon(Icons.shopping_cart_outlined)),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: HORIZONTAL_PADDING, vertical: VERTICAL_PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.05,
                    width: size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: darkGrey),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(BORDER_RADIUS),
                      ),
                    ),
                    child: TextField(
                      // focusNode: searchFocusNode,
                      // controller: searchcontroller,
                      onChanged: (value) {
                        // _debouncer.run(() {
                        //   _onSearchChanged(
                        //       searchcontroller.text
                        //           .trim());
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: search,
                        hintStyle: TextStyle(
                            color: grey,
                            fontSize: CATEGORY_TEXT_SIZE,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Nunito'),
                        contentPadding: EdgeInsets.only(bottom: 0, top: 4),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: VERTICAL_PADDING * 2),
                    child: Container(
                      height: size.height * 0.25,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(BORDER_RADIUS * 5),
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            viewportFraction: 1,
                            // autoPlay: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            initialPage: 0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _carouselActiveIndex = index;
                              });
                            }),
                        items: List.generate(
                            bannerList.length,
                            (index) => customCarouselItem(
                                size, bannerList[_carouselActiveIndex])),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: AnimatedSmoothIndicator(
                        effect: WormEffect(
                          spacing: 5,
                          dotHeight: 7,
                          dotWidth: 7,
                          type: WormType.normal,
                          strokeWidth: 0.2,
                          activeDotColor: Theme.of(context).secondaryHeaderColor,
                          dotColor: darkGrey.withOpacity(0.2),
                        ),
                        activeIndex: _carouselActiveIndex,
                        count: bannerList.length,
                        onDotClicked: (index) {
                          setState(() {
                            _carouselActiveIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: VERTICAL_PADDING * 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: VERTICAL_PADDING),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getTitle(
                          categories,
                          color: colorBlack,
                          bold: true,
                          weight: FontWeight.w700,
                          fontSize: HOME_TITLE_SIZE,
                        ),
                        getSmallText(
                          seeAll,
                          color: Theme.of(context).secondaryHeaderColor,
                          weight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                  categoryTab(),
                  const SizedBox(height: VERTICAL_PADDING * 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: getTitle(
                          popularProducts,
                          color: colorBlack,
                          bold: true,
                          weight: FontWeight.w700,
                          fontSize: HOME_TITLE_SIZE,
                        ),
                      ),
                      Flexible(
                        child: getSmallText(
                          seeAll,
                          color: Theme.of(context).secondaryHeaderColor,
                          weight: FontWeight.w700,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: VERTICAL_PADDING),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => popularProductItem(),
                      ),
                    ),
                  ),
                  const SizedBox(height: VERTICAL_PADDING * 3),
                  getTitle(
                    productsForYou,
                    color: colorBlack,
                    weight: FontWeight.w700,
                    fontSize: HOME_TITLE_SIZE,
                  ),
                  const SizedBox(height: VERTICAL_PADDING),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (ctx, index) => const ProductItem()),
                ],
              ),
            ),
          ),
          bottomNavigationBar: isKeyboardVisible ? null : BottomNav(0),
        );
      },
    );
  }

  Widget customCarouselItem(Size size, String image) {
    return Container(
        height: size.height * 0.18,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING / 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS * 5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(BORDER_RADIUS),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ));
  }

  Widget homeCategoryItem(String image, String title, Function f) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            f();
          },
          child: Card(
            shape: const CircleBorder(),
            child: Container(
              height: size.height * 0.06,
              width: size.width * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor.withOpacity(0.6),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  height: size.height * 0.03,
                  width: size.width * 0.075,
                  fit: BoxFit.fill,
                  color: secondaryDarkColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.004),
        getSmallText(
          title,
          fontSize: CATEGORY_TEXT_SIZE,
          color: secondaryDarkColor,
          weight: FontWeight.w600,
          maxLines: 2,
        )
      ],
    );
  }

  Widget categoryTab() {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING * 0.5),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            homeCategoryItem(IC_MOBILE, mobiles, () {}),
            SizedBox(width: size.width * 0.025),
            homeCategoryItem(IC_BEAUTY, beauty, () {}),
            SizedBox(width: size.width * 0.025),
            homeCategoryItem(IC_FASHION, fashion, () {}),
            SizedBox(width: size.width * 0.025),
            homeCategoryItem(IC_GROCERY, grocery, () {}),
            SizedBox(width: size.width * 0.025),
            homeCategoryItem(IC_PHARMACY, pharmacy, () {}),
            SizedBox(width: size.width * 0.025),
            homeCategoryItem(IC_ELECTRONICS, electronics, () {}),
          ],
        ),
      ),
    );
  }
}
