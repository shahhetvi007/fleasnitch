import 'package:easy_stepper/easy_stepper.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:im_stepper/stepper.dart';
// import 'package:status_change/status_change.dart';

import '../../../base/base_screen.dart';
import '../../../utils/common_widgets.dart';
import '../../res/strings.dart';
import '../../res/dimen_resources.dart';
import '../../res/image_resources.dart';

class CartScreen extends BaseStatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends BaseState<CartScreen> with BasicScreen {
  @override
  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: itemBackground,
        appBar: AppBar(
          title: getTitle(
            cart,
            fontSize: APPBAR_FONT_SIZE,
            color: Theme.of(context).secondaryHeaderColor,
            weight: FontWeight.w700,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 18),
            padding: EdgeInsets.zero,
            onPressed: () {
              bloc.add(HomeScreenEvent());
            },
          ),
          bottom: const PreferredSize(
            preferredSize: Size(0, 0),
            child: Divider(
              height: 0.5,
              color: colorBlack,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  cartSteps(0),
                  const Divider(thickness: 0.5, height: 1),
                  // Container(
                  //   height: 100,
                  //   child: IconStepper(
                  //     activeStep: 0,
                  //     icons: const [
                  //       Icon(Icons.shopping_cart),
                  //       Icon(Icons.location_on),
                  //       Icon(Icons.money_outlined),
                  //       Icon(Icons.summarize),
                  //     ],
                  //     stepRadius: size.width * 0.05,
                  //     scrollingDisabled: true,
                  //     enableNextPreviousButtons: false,
                  //
                  //   ),
                  // ),
                  cartItem(
                      context,
                      IC_FASHION,
                      "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
                      "₹268",
                      "IND-5",
                      "1",
                      "ABC Footwear"),
                  cartItem(
                      context,
                      IC_FASHION,
                      "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
                      "₹268",
                      "IND-5",
                      "1",
                      "Fashion trials"),
                  cartItem(
                      context,
                      IC_FASHION,
                      "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
                      "₹268",
                      "IND-5",
                      "1",
                      "King Rocco"),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: wishlistBottomSheet,
                    child: Container(
                      color: colorWhite,
                      padding: const EdgeInsets.symmetric(
                          vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getSmallText(
                            wishlist,
                            color: darkGrey,
                            maxLines: 1,
                            weight: FontWeight.w700,
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 18),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(HORIZONTAL_PADDING),
                    color: colorWhite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getSmallText(
                          priceDetails,
                          color: darkGrey,
                          maxLines: 1,
                          weight: FontWeight.w800,
                        ),
                        const SizedBox(height: VERTICAL_PADDING),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getSmallText(
                              totalProductPrice,
                              color: darkGrey,
                              maxLines: 1,
                              weight: FontWeight.w500,
                              fontSize: CATEGORY_TEXT_SIZE,
                            ),
                            getSmallText(
                              "₹804",
                              color: darkGrey,
                              maxLines: 1,
                              weight: FontWeight.w500,
                              fontSize: CATEGORY_TEXT_SIZE,
                            ),
                          ],
                        ),
                        const SizedBox(height: VERTICAL_PADDING),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getSmallText(
                              discount,
                              color: darkGrey,
                              maxLines: 1,
                              weight: FontWeight.w500,
                              fontSize: CATEGORY_TEXT_SIZE,
                            ),
                            getSmallText(
                              "₹100",
                              color: darkGrey,
                              maxLines: 1,
                              weight: FontWeight.w500,
                              fontSize: CATEGORY_TEXT_SIZE,
                            ),
                          ],
                        ),
                        const Divider(thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getSmallText(
                              orderTotal,
                              color: darkGrey,
                              maxLines: 1,
                              weight: FontWeight.w700,
                              fontSize: CATEGORY_TEXT_SIZE,
                            ),
                            getSmallText(
                              "₹704",
                              color: darkGrey,
                              maxLines: 1,
                              weight: FontWeight.w700,
                              fontSize: CATEGORY_TEXT_SIZE,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              color: colorWhite,
              padding: const EdgeInsets.all(VERTICAL_PADDING),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getSmallText(
                          '₹704',
                          weight: FontWeight.w800,
                        ),
                        getSmallText(
                          viewPriceDetails,
                          fontSize: CATEGORY_TEXT_SIZE,
                          weight: FontWeight.w700,
                          color: primaryColor,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          bloc.add(DeliveryAddressEvent());
                        },
                        child: getSmallText(
                          continueText,
                          weight: FontWeight.w700,
                          fontSize: CATEGORY_TEXT_SIZE,
                          color: colorWhite,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future wishlistBottomSheet() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return Container(
            height: deviceHeight * 0.80,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: VERTICAL_PADDING * 2,
                        left: HORIZONTAL_PADDING,
                        right: HORIZONTAL_PADDING),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getSmallText(wishlist.toUpperCase(),
                            fontSize: CATEGORY_TEXT_SIZE, weight: FontWeight.w700),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: VERTICAL_PADDING),
                      const Divider(thickness: 1),
                      const SizedBox(height: VERTICAL_PADDING),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            return wishlistItem(
                              IC_FASHION,
                              "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
                              "₹268",
                            );
                          },
                          separatorBuilder: (ctx, i) {
                            return const Divider(thickness: 1);
                          },
                          itemCount: 20),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget wishlistItem(String image, String itemDescription, String itemPrice) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(BORDER_RADIUS / 2),
                border: Border.all(color: darkGrey),
              ),
              padding: const EdgeInsets.all(VERTICAL_PADDING),
              child: Image.asset(image),
            ),
          ),
          const SizedBox(width: HORIZONTAL_PADDING),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSmallText(
                  itemDescription,
                  color: darkGrey,
                  maxLines: 1,
                  weight: FontWeight.w800,
                  fontSize: CATEGORY_TEXT_SIZE,
                ),
                const SizedBox(height: VERTICAL_PADDING / 2),
                getSmallText(
                  itemPrice,
                  color: darkGrey,
                  maxLines: 1,
                  fontSize: CATEGORY_TEXT_SIZE,
                ),
                const SizedBox(height: VERTICAL_PADDING),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(
                        Icons.shopping_cart_outlined,
                        size: 16,
                        color: primaryColor,
                      ),
                      const SizedBox(width: 4),
                      getSmallText(
                        addToCart,
                        color: primaryColor,
                        maxLines: 1,
                        fontSize: CATEGORY_TEXT_SIZE,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
