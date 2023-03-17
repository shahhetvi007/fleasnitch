import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class SupplierCategoryScreen extends BaseStatefulWidget {
  @override
  _SupplierCategoryScreenState createState() => _SupplierCategoryScreenState();
}

class _SupplierCategoryScreenState extends BaseState<SupplierCategoryScreen>
    with BasicScreen {
  List<Map<String, String>> categoriesList = [
    {'name': mobiles, 'image': IC_MOBILE},
    {'name': beauty, 'image': IC_BEAUTY},
    {'name': fashion, 'image': IC_FASHION},
    {'name': grocery, 'image': IC_GROCERY},
    {'name': pharmacy, 'image': IC_PHARMACY},
    {'name': electronics, 'image': IC_ELECTRONICS},
    {'name': dress, 'image': IC_DRESS},
  ];

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(
          categories,
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
        child: GridView.builder(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (ctx, index) {
            return categoryItem(
                categoriesList[index]['name']!, categoriesList[index]['image']!);
          },
          itemCount: categoriesList.length,
        ),
      ),
      bottomNavigationBar: SupplierBottomNav(1),
    );
  }

  Widget categoryItem(String title, String image) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // f();
          },
          child: Card(
            shape: const CircleBorder(),
            child: Container(
              height: size.height * 0.09,
              width: size.width * 0.22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor.withOpacity(0.6),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  height: size.height * 0.04,
                  width: size.width * 0.1,
                  fit: BoxFit.fill,
                  color: secondaryDarkColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.004),
        getSmallText(
          title,
          fontSize: HOME_TITLE_SIZE,
          color: secondaryDarkColor,
          weight: FontWeight.w600,
          maxLines: 2,
        )
      ],
    );
  }
}
