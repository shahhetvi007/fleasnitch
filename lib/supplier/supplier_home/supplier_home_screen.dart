import 'package:carousel_slider/carousel_slider.dart';
import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SupplierHomeScreen extends BaseStatefulWidget {
  @override
  _SupplierHomeScreenState createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends BaseState<SupplierHomeScreen> with BasicScreen {
  int _carouselActiveIndex = 0;
  List bannerList = [BANNER2, BANNER1, BANNER3, BANNER11, BANNER12, BANNER13];

  @override
  Widget buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: itemBackground,
          // extendBody: true,
          appBar: AppBar(
            title: getTitle(
              appName,
              fontSize: APPBAR_FONT_SIZE,
              color: Theme.of(context).secondaryHeaderColor,
              weight: FontWeight.w700,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    bloc.add(AddNewItemEvent());
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: VERTICAL_PADDING),
            child: ListView.separated(
              itemBuilder: (ctx, index) => supplierItem(),
              separatorBuilder: (ctx, index) {
                return const SizedBox(height: VERTICAL_PADDING * 1.5);
              },
              itemCount: 4,
            ),
          ),
          bottomNavigationBar: isKeyboardVisible ? null : SupplierBottomNav(0),
        );
      },
    );
  }
}
