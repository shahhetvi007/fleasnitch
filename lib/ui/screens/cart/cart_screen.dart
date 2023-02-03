import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: getTitle(
          cart,
          fontSize: APPBAR_FONT_SIZE,
          color: Theme.of(context).secondaryHeaderColor,
          weight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
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
              child: Column(children: [
                cartItem(
                    IC_FASHION,
                    "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
                    "₹268",
                    "IND-5",
                    "1",
                    "ABC Footwear"),
                cartItem(
                    IC_FASHION,
                    "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
                    "₹268",
                    "IND-5",
                    "1",
                    "Fashion trials"),
                cartItem(
                    IC_FASHION,
                    "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
                    "₹268",
                    "IND-5",
                    "1",
                    "King Rocco"),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(VERTICAL_PADDING),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getSmallText(
                        '₹804',
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
                      onPressed: () {},
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
    );
  }
}
