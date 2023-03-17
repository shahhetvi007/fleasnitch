import 'dart:io';

import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addProfile(),
                const SizedBox(height: VERTICAL_PADDING),
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
            onTap: () {
              bloc.add(SupplierLoginEvent());
            },
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
      onTap: chooseImageSourceType,
      child: Stack(children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: secondaryColor.withOpacity(0.2),
          ),
        ),
        (imagePicked != null)
            ? Container(
                height: 100,
                width: 100,
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
                  size: 32,
                ),
              )
      ]),
    );
  }

  void chooseImageSourceType() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BORDER_RADIUS)),
        context: context,
        builder: (ctx) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getSmallText(
                      editPhoto,
                      fontSize: HOME_TITLE_SIZE,
                      weight: FontWeight.w700,
                    ),
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
                const SizedBox(height: VERTICAL_PADDING / 2),
                const Divider(),
                const SizedBox(height: VERTICAL_PADDING / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: imageFromCamera,
                          icon: const Icon(Icons.camera_alt),
                          color: secondaryDarkColor,
                        ),
                        getSmallText(camera),
                      ],
                    ),
                    const SizedBox(width: HORIZONTAL_PADDING * 2),
                    Column(
                      children: [
                        IconButton(
                          onPressed: imageFromGallery,
                          icon: const Icon(Icons.photo),
                          color: secondaryDarkColor,
                        ),
                        getSmallText(gallery),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: VERTICAL_PADDING * 2),
              ],
            ),
          );
        });
  }

  Future imageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        imagePicked = File(pickedFile.path);
      });
      Navigator.pop(context);
      print(imagePicked);
    } else {
      print('No image path received');
      Navigator.pop(context);
    }
  }

  Future imageFromGallery() async {
    PermissionStatus? result;
    if (Platform.isIOS) {
      result = await Permission.photos.request();
      print(result);
    }
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePicked = File(pickedFile.path);
      });
      Navigator.pop(context);
      print(imagePicked);
    } else {
      print('No image selected');
      Navigator.pop(context);
    }
  }
}
