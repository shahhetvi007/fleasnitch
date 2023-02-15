import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends BaseStatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends BaseState<PaymentMethodScreen> with BasicScreen {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: itemBackground,
      appBar: AppBar(
        title: getTitle(
          paymentMethod,
          fontSize: HOME_TITLE_SIZE,
          // color: Theme.of(context).secondaryHeaderColor,
          weight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          padding: EdgeInsets.zero,
          onPressed: () {
            bloc.add(DeliveryAddressEvent());
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
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: getSmallText(makePayment, color: colorWhite),
        ),
      ),
    );
  }
}
