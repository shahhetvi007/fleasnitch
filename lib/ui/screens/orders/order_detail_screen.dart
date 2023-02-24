import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:order_tracker/order_tracker.dart';

class OrderDetailScreen extends BaseStatefulWidget {
  // final String image;
  // final String itemDescription;
  // final String price;
  // final String size;
  // final String qty;
  //
  // OrderDetailScreen({
  //   required this.image,
  //   required this.itemDescription,
  //   required this.price,
  //   required this.size,
  //   required this.qty,
  // });

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends BaseState<OrderDetailScreen> with BasicScreen {
  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller has processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto(
        "Your item has been picked up by courier partner.", "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: itemBackground,
      appBar: AppBar(
        title: getTitle(
          orderDetails,
          fontSize: HOME_TITLE_SIZE,
          weight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          padding: EdgeInsets.zero,
          onPressed: () {
            bloc.add(OrdersEvent());
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: colorWhite,
              padding: const EdgeInsets.symmetric(
                  vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getSmallText(
                    productDetails,
                    fontSize: HOME_TITLE_SIZE,
                    weight: FontWeight.w700,
                  ),
                  const SizedBox(height: VERTICAL_PADDING * 2),
                  SizedBox(
                    width: double.infinity,
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
                            child: Image.asset(IC_FASHION),
                          ),
                        ),
                        const SizedBox(width: HORIZONTAL_PADDING),
                        Expanded(
                          flex: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getSmallText(
                                "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
                                color: darkGrey,
                                maxLines: 1,
                                weight: FontWeight.w800,
                                fontSize: CATEGORY_TEXT_SIZE,
                              ),
                              const SizedBox(height: VERTICAL_PADDING / 2),
                              GestureDetector(
                                onTap: () {
                                  bloc.add(ProductDetailEvent());
                                },
                                child: Container(
                                  width: double.infinity,
                                  color: colorWhite,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          getSmallText(
                                            "₹268",
                                            color: darkGrey,
                                            maxLines: 1,
                                            fontSize: CATEGORY_TEXT_SIZE,
                                          ),
                                          const SizedBox(height: VERTICAL_PADDING / 2),
                                          Row(
                                            children: [
                                              getSmallText(
                                                size,
                                                color: darkGrey,
                                                fontSize: CATEGORY_TEXT_SIZE,
                                              ),
                                              getSmallText(
                                                "IND-5",
                                                color: darkGrey,
                                                fontSize: CATEGORY_TEXT_SIZE,
                                              ),
                                              const SizedBox(width: HORIZONTAL_PADDING),
                                              getSmallText(
                                                qty,
                                                color: darkGrey,
                                                fontSize: CATEGORY_TEXT_SIZE,
                                              ),
                                              getSmallText(
                                                "1",
                                                color: darkGrey,
                                                fontSize: CATEGORY_TEXT_SIZE,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: VERTICAL_PADDING),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: VERTICAL_PADDING / 2),
                  const Divider(thickness: 1),
                  const SizedBox(height: VERTICAL_PADDING / 2),
                  getSmallText(rateYourExperience,
                      weight: FontWeight.w700, fontSize: CATEGORY_TEXT_SIZE),
                  const SizedBox(height: VERTICAL_PADDING / 2),
                  RatingBar.builder(
                    itemBuilder: (ctx, i) {
                      return const Icon(
                        Icons.star_rounded,
                        color: primaryColor,
                      );
                    },
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                    itemSize: 25,
                    unratedColor: grey.withOpacity(0.3),
                    glowColor: primaryColor,
                    itemPadding:
                        const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING / 4),
                  ),
                  const SizedBox(height: VERTICAL_PADDING / 2),
                  const Divider(thickness: 1),
                  const SizedBox(height: VERTICAL_PADDING * 1.5),
                  getSmallText(
                    orderTracking,
                    fontSize: HOME_TITLE_SIZE,
                    weight: FontWeight.w700,
                  ),
                  const SizedBox(height: VERTICAL_PADDING),
                  OrderTracker(
                    status: Status.order,
                    activeColor: Colors.green,
                    inActiveColor: Colors.grey[300],
                    orderTitleAndDateList: orderList,
                    shippedTitleAndDateList: shippedList,
                    outOfDeliveryTitleAndDateList: outOfDeliveryList,
                    deliveredTitleAndDateList: deliveredList,
                    headingTitleStyle: const TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: SUBTITLE_FONT_SIZE,
                      fontWeight: FontWeight.w700,
                    ),
                    subTitleTextStyle: const TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: CATEGORY_TEXT_SIZE,
                      fontWeight: FontWeight.w500,
                    ),
                    headingDateTextStyle: const TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: SUBTITLE_FONT_SIZE,
                      color: grey,
                    ),
                    subDateTextStyle: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: CATEGORY_TEXT_SIZE,
                      color: grey.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: VERTICAL_PADDING),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  vertical: VERTICAL_PADDING * 1.5, horizontal: HORIZONTAL_PADDING),
              color: colorWhite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getSmallText(returnExchangeOrder, weight: FontWeight.w700),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ],
              ),
            ),
            const SizedBox(height: VERTICAL_PADDING),
            Container(
              color: colorWhite,
              padding: const EdgeInsets.symmetric(
                  vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getSmallText(
                    orderDetails,
                    fontSize: HOME_TITLE_SIZE,
                    weight: FontWeight.w700,
                  ),
                  const SizedBox(height: VERTICAL_PADDING),
                  getSmallText(
                    priceDetails,
                    color: darkGrey,
                    maxLines: 1,
                    weight: FontWeight.w700,
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
                  const SizedBox(height: VERTICAL_PADDING * 2),
                  discountContainer("100"),
                ],
              ),
            ),
            const SizedBox(height: VERTICAL_PADDING),
            Container(
              color: colorWhite,
              padding: const EdgeInsets.symmetric(
                  vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getSmallText(
                    deliveryAddress,
                    color: darkGrey,
                    maxLines: 1,
                    weight: FontWeight.w800,
                  ),
                  const SizedBox(height: VERTICAL_PADDING),
                  Wrap(children: [
                    getSmallText(
                      'Hetvi Shah',
                      fontSize: CATEGORY_TEXT_SIZE,
                      color: grey,
                    ),
                    getSmallText(
                      'Iris Watson P.O. Box 283 8562 Fusce Rd.Frederick Nebraska, 20620',
                      fontSize: CATEGORY_TEXT_SIZE,
                      color: grey,
                    ),
                    getSmallText(
                      '9876541230',
                      fontSize: CATEGORY_TEXT_SIZE,
                      color: grey,
                    ),
                  ]),
                ],
              ),
            ),
            const SizedBox(height: VERTICAL_PADDING),
            Container(
              color: colorWhite,
              padding: const EdgeInsets.symmetric(
                  vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getSmallText(supplier,
                      fontSize: CATEGORY_TEXT_SIZE,
                      color: darkGrey,
                      weight: FontWeight.w500),
                  getSmallText('Shloka Enterprise',
                      fontSize: CATEGORY_TEXT_SIZE,
                      color: darkGrey,
                      weight: FontWeight.w700),
                ],
              ),
            ),
            const SizedBox(height: VERTICAL_PADDING * 4),
          ],
        ),
      ),
    );
  }
}
