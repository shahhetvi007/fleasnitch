import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fleasnitch/base/base_screen.dart';

import '../../res/strings.dart';

class SubCategoryScreen extends BaseStatefulWidget {
  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends BaseState<SubCategoryScreen> with BasicScreen {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(
          'Dresses',
          fontSize: APPBAR_FONT_SIZE,
        ),
        bottom: const PreferredSize(
          preferredSize: Size(0, 0),
          child: Divider(
            height: 0.5,
            color: grey,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: HORIZONTAL_PADDING / 2, vertical: 0),
            // intinsic height => for vertical divider other wise not showing
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.compare_arrows),
                    label: getSmallText(sort),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  const VerticalDivider(
                    color: grey,
                    thickness: 0.2,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_alt),
                    label: getSmallText(filters),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 0.7,
            color: grey,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7),
                itemBuilder: (ctx, index) => productItem(bloc)),
          ),
        ],
      ),
    );
  }
}
