import 'package:easy_stepper/easy_stepper.dart';
import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';

class SummaryScreen extends BaseStatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends BaseState<SummaryScreen> with BasicScreen {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: itemBackground,
      appBar: AppBar(
        title: getTitle(
          orderSummary,
          fontSize: HOME_TITLE_SIZE,
          // color: Theme.of(context).secondaryHeaderColor,
          weight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          padding: EdgeInsets.zero,
          onPressed: () {
            bloc.add(PaymentEvent());
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
              child: Column(
                children: [
                  cartSteps(3),
                  const Divider(thickness: 0.5, height: 1),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
                    color: colorWhite,
                    child: Row(
                      children: [
                        const Icon(Icons.car_rental),
                        const SizedBox(width: 4),
                        getSmallText(
                          estimatedDelivery,
                          fontSize: CATEGORY_TEXT_SIZE,
                          weight: FontWeight.w600,
                        ),
                        getSmallText(
                          'Thursday, 09th Feb',
                          fontSize: CATEGORY_TEXT_SIZE,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.5, height: 1),
                  Container(
                    color: colorWhite,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              top: VERTICAL_PADDING,
                              left: HORIZONTAL_PADDING,
                              right: HORIZONTAL_PADDING),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(BORDER_RADIUS / 2),
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
                                        productDetailBottomSheet(
                                            context,
                                            IC_FASHION,
                                            "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
                                            "₹268");
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: colorWhite,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                getSmallText(
                                                  "₹268",
                                                  color: darkGrey,
                                                  maxLines: 1,
                                                  fontSize: CATEGORY_TEXT_SIZE,
                                                ),
                                                const SizedBox(
                                                    height: VERTICAL_PADDING / 2),
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
                                                    const SizedBox(
                                                        width: HORIZONTAL_PADDING),
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
                        const Divider(thickness: 1, height: 1),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: HORIZONTAL_PADDING, vertical: VERTICAL_PADDING),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getSmallText(
                                supplier + " : " + "ABC Footwear",
                                color: darkGrey,
                                fontSize: CATEGORY_TEXT_SIZE,
                              ),
                              getSmallText(
                                freeDelivery,
                                color: darkGrey,
                                fontSize: CATEGORY_TEXT_SIZE,
                              ),
                            ],
                          ),
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
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined, size: 16),
                            const SizedBox(width: 4),
                            getSmallText(
                              deliveryAddress,
                              color: darkGrey,
                              maxLines: 1,
                              weight: FontWeight.w700,
                            ),
                          ],
                        ),
                        const SizedBox(height: VERTICAL_PADDING),
                        Row(
                          children: [
                            Expanded(
                              flex: 11,
                              child: Wrap(direction: Axis.horizontal, children: [
                                getSmallText(
                                  'Hetvi Shah',
                                  fontSize: CATEGORY_TEXT_SIZE,
                                  weight: FontWeight.w600,
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
                            ),
                            const Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                              ),
                            )
                          ],
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
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
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
                        // bloc.add(DeliveryAddressEvent());
                      },
                      child: getSmallText(
                        payNow,
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
    );
  }
}
