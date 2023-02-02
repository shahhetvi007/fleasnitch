import 'package:carousel_slider/carousel_slider.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fleasnitch/base/base_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends BaseStatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends BaseState<ProductDetailScreen> with BasicScreen {
  int _carouselActiveIndex = 0;
  List productList = [
    DRESS,
    DRESS,
    DRESS,
    DRESS,
  ];
  @override
  Widget buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            bloc.add(HomeScreenEvent());
          },
        ),
        bottom: const PreferredSize(
          preferredSize: Size(0, 0),
          child: Divider(
            height: 0.5,
            color: grey,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  aspectRatio: 1.2,
                  // autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _carouselActiveIndex = index;
                    });
                  }),
              items: List.generate(productList.length,
                  (index) => customCarouselItem(size, productList[_carouselActiveIndex])),
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
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
                  count: productList.length,
                  onDotClicked: (index) {
                    setState(() {
                      _carouselActiveIndex = index;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: HORIZONTAL_PADDING, vertical: VERTICAL_PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getSmallText(
                    '5 Similar products',
                    color: grey,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: size.height * 0.09,
                    child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (ctx, index) => Container(
                        height: size.height * 0.08,
                        width: size.width * 0.12,
                        margin: const EdgeInsets.all(VERTICAL_PADDING),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(BORDER_RADIUS),
                          border: Border.all(color: grey),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(BORDER_RADIUS),
                          child: Image.asset(IC_DRESS),
                        ),
                      ),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(height: VERTICAL_PADDING),
                  Row(
                    children: [
                      Expanded(
                        child: getSmallText(
                          'Yellow Attractive Dress' * 5,
                          maxLines: 2,
                          fontSize: HOME_TITLE_SIZE,
                          color: grey,
                          weight: FontWeight.w600,
                        ),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.favorite_border,
                              size: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          getSmallText(
                            wishlist,
                            fontSize: SMALL_TEXT,
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.share,
                              size: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          getSmallText(share, fontSize: SMALL_TEXT),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: VERTICAL_PADDING / 2),
                  Row(
                    children: [
                      getTitle(
                        '₹365',
                        weight: FontWeight.w700,
                      ),
                      const SizedBox(width: HORIZONTAL_PADDING),
                      getSmallText(
                        '400',
                        color: grey,
                        // fontSize: CATEGORY_TEXT_SIZE,
                        lineThrough: true,
                        maxLines: 1,
                      ),
                      const SizedBox(width: 5),
                      getSmallText(
                        '15% off',
                        fontSize: CATEGORY_TEXT_SIZE,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const SizedBox(height: VERTICAL_PADDING / 2),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING / 2),
                    decoration: BoxDecoration(
                      color: grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(BORDER_RADIUS / 2),
                    ),
                    child: getSmallText(
                      freeDelivery,
                      color: colorBlack,
                      fontSize: SMALL_TEXT,
                      weight: FontWeight.w600,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: VERTICAL_PADDING),
                ],
              ),
            ),
            const Divider(
              height: 2,
              thickness: 3,
              color: itemBackground,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getSmallText(
                    soldBy,
                    weight: FontWeight.w800,
                  ),
                  const SizedBox(height: VERTICAL_PADDING),
                  Row(
                    children: [
                      Card(
                        shape: const CircleBorder(),
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width * 0.14,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: secondaryColor.withOpacity(0.6),
                          ),
                          child: Center(
                            child: Image.asset(
                              IC_STORE,
                              height: size.height * 0.025,
                              width: size.width * 0.07,
                              fit: BoxFit.fill,
                              color: secondaryDarkColor,
                            ),
                          ),
                        ),
                      ),
                      getSmallText(
                        'Shop Name'.toUpperCase(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 2,
              thickness: 3,
              color: itemBackground,
            ),
          ],
        ),
      ),
    );
  }

  Widget customCarouselItem(Size size, String image) {
    return SizedBox(
        height: size.height * 0.3,
        width: size.width,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ));
  }
}
