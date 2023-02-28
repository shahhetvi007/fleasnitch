import 'dart:io';

import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class AccountScreen extends BaseStatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends BaseState<AccountScreen> with BasicScreen {
  File? imagePicked;
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: itemBackground,
      appBar: AppBar(
        title: getTitle(
          account,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
            width: double.infinity,
            color: colorWhite,
            child: Row(
              children: [
                addProfile(),
                const SizedBox(width: HORIZONTAL_PADDING),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getTitle(
                      'Hetvi Shah',
                      weight: FontWeight.w800,
                    ),
                    getSmallText(editProfile,
                        fontSize: CATEGORY_TEXT_SIZE,
                        weight: FontWeight.w600,
                        color: secondaryDarkColor),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: VERTICAL_PADDING),
          ListTile(
            leading: const Icon(
              Icons.save_as,
              color: secondaryDarkColor,
            ),
            title: getSmallText(savedAddresses, weight: FontWeight.w600),
            tileColor: colorWhite,
            onTap: () {
              bloc.add(SavedAddressEvent());
            },
          ),
          const SizedBox(height: VERTICAL_PADDING / 2),
          ListTile(
            leading: const Icon(
              Icons.add_shopping_cart_outlined,
              color: secondaryDarkColor,
            ),
            title: getSmallText(becomeASupplier, weight: FontWeight.w600),
            tileColor: colorWhite,
          ),
          const SizedBox(height: VERTICAL_PADDING / 2),
          ListTile(
            leading: const Icon(
              Icons.favorite_border,
              color: secondaryDarkColor,
            ),
            onTap: () {
              bloc.add(FavoritesEvent());
            },
            title: getSmallText(yourWishlist, weight: FontWeight.w600),
            tileColor: colorWhite,
          ),
          const SizedBox(height: VERTICAL_PADDING / 2),
          ListTile(
            leading: const Icon(
              Icons.shopping_bag_outlined,
              color: secondaryDarkColor,
            ),
            title: getSmallText(yourOrders, weight: FontWeight.w600),
            tileColor: colorWhite,
            onTap: () {
              bloc.add(OrdersEvent());
            },
          ),
          const SizedBox(height: VERTICAL_PADDING / 2),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: secondaryDarkColor,
            ),
            title: getSmallText(logout, weight: FontWeight.w600),
            tileColor: colorWhite,
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(4),
    );
  }

  Widget addProfile() {
    return GestureDetector(
      onTap: () {},
      child: Stack(children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: secondaryColor.withOpacity(0.2),
            // border: Border.all(color: colorBlack),
          ),
        ),
        (imagePicked != null)
            ? Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: FileImage(
                        imagePicked!,
                      ),
                      fit: BoxFit.fill,
                    )),
              )
            : const Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Icon(
                  Icons.person_add_alt_outlined,
                  color: secondaryDarkColor,
                  size: 24,
                ),
              )
      ]),
    );
  }
}
