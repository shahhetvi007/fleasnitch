import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class ShopScreen extends BaseStatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends BaseState<ShopScreen> with BasicScreen {
  @override
  Widget buildBody(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final height =
        MediaQuery.of(context).size.height - padding.top - padding.right - kToolbarHeight;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: getTitle(
          'SHOP NAME',
          fontSize: HOME_TITLE_SIZE,
          weight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          padding: EdgeInsets.zero,
          onPressed: () {
            bloc.add(ProductDetailEvent());
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
          children: [
            SizedBox(
              height: height * 0.24,
              child: Stack(
                children: [
                  SizedBox(
                    height: height * 0.2,
                    width: width,
                    child: Image.asset(
                      SHOPPING_DOODLE,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: height * 0.165,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(VERTICAL_PADDING / 2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorWhite,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(VERTICAL_PADDING * 1.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor.withOpacity(0.2),
                        ),
                        child: Image.asset(
                          IC_STORE,
                          color: primaryColor,
                          height: height * 0.035,
                          width: height * 0.035,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: colorWhite,
              child: Column(
                children: [
                  const SizedBox(height: VERTICAL_PADDING),
                  getTitle(
                    'SHOP NAME',
                    fontSize: HOME_TITLE_SIZE,
                    weight: FontWeight.w900,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING),
                    child: Column(
                      children: [
                        getSmallText('122', weight: FontWeight.w700, maxLines: 1),
                        getSmallText(totalProducts, color: grey),
                      ],
                    ),
                  ),
                  const SizedBox(height: VERTICAL_PADDING * 1.5),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (ctx, index) => const ProductItem()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
