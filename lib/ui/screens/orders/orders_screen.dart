import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends BaseStatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends BaseState<OrdersScreen> with BasicScreen {
  @override
  Widget buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: itemBackground,
      appBar: AppBar(
        title: getTitle(
          myOrders,
          fontSize: APPBAR_FONT_SIZE,
          color: Theme.of(context).secondaryHeaderColor,
          weight: FontWeight.w700,
        ),
        bottom: const PreferredSize(
          preferredSize: Size(0, 0),
          child: Divider(
            height: 0.5,
            color: colorBlack,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                bloc.add(CartEvent());
              },
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: VERTICAL_PADDING * 1.5, horizontal: HORIZONTAL_PADDING),
            height: size.height * 0.05,
            width: size.width,
            decoration: BoxDecoration(
              color: colorWhite,
              border: Border.all(color: darkGrey),
              borderRadius: const BorderRadius.all(
                Radius.circular(BORDER_RADIUS),
              ),
            ),
            child: TextField(
              // focusNode: searchFocusNode,
              // controller: searchcontroller,
              // textAlign: TextAlign.center,
              onChanged: (value) {
                // _debouncer.run(() {
                //   _onSearchChanged(
                //       searchcontroller.text
                //           .trim());
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: searchByCustomerOrProduct,
                hintStyle: TextStyle(
                    color: grey,
                    height: 1,
                    fontSize: SUBTITLE_FONT_SIZE,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nunito'),
                contentPadding: EdgeInsets.only(bottom: 0, top: 4),
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (ctx, i) {
                  return orderItem(
                      '1st January',
                      'Shloka Enterprise',
                      IC_DRESS,
                      "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
                      "Delivered on 04 January, 2023");
                },
                separatorBuilder: (ctx, i) {
                  return const Divider(
                    color: itemBackground,
                    height: VERTICAL_PADDING,
                  );
                },
                itemCount: 5),
          )
        ],
      ),
      bottomNavigationBar: BottomNav(3),
    );
  }

  Widget orderItem(String date, String supplierName, String image, String itemDescription,
      String deliveryDetail) {
    return Container(
      color: colorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
            child:
                getSmallText(date, fontSize: CATEGORY_TEXT_SIZE, weight: FontWeight.w700),
          ),
          const Divider(color: itemBackground, thickness: 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: VERTICAL_PADDING / 2, horizontal: HORIZONTAL_PADDING),
            child: Row(
              children: [
                getSmallText(supplier + " : ",
                    fontSize: SMALL_TEXT, color: darkGrey, weight: FontWeight.w500),
                getSmallText(supplierName,
                    fontSize: SMALL_TEXT, color: darkGrey, weight: FontWeight.w700),
              ],
            ),
          ),
          const Divider(color: itemBackground, thickness: 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    bloc.add(OrderDetailEvent());
                  },
                  child: SizedBox(
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
                            child: Image.asset(image),
                          ),
                        ),
                        const SizedBox(width: HORIZONTAL_PADDING),
                        Expanded(
                          flex: 8,
                          child: Column(
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
                              Container(
                                width: double.infinity,
                                color: colorWhite,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getSmallText(
                                      deliveryDetail,
                                      color: darkGrey,
                                      maxLines: 1,
                                      fontSize: CATEGORY_TEXT_SIZE,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: VERTICAL_PADDING),
                const Divider(color: itemBackground, thickness: 1.5),
                getSmallText(rateYourExperience,
                    weight: FontWeight.w700, fontSize: CATEGORY_TEXT_SIZE),
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) {
                      return Icon(Icons.star_rounded, color: grey.withOpacity(0.3));
                    },
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
