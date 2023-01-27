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
        cartItems,
        fontSize: APPBAR_FONT_SIZE,
      )),
      body: Column(children: [
        cartItem(IC_FASHION, "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
            "₹268", "IND-5", "1"),
        cartItem(IC_FASHION, "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
            "₹268", "IND-5", "1"),
        cartItem(IC_FASHION, "Stylish Women Sandal Block Heel Heel Heel Heel Heel Heel ",
            "₹268", "IND-5", "1"),
      ]),
    );
  }
}
