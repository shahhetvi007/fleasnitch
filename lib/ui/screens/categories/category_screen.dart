import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends BaseStatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends BaseState<CategoryScreen> with BasicScreen {
  int selectedIndex = 0;
  final PageController _pageController = PageController();
  final ScrollController _categoryController = ScrollController();
  bool atEdge = false;

  @override
  Widget buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(
              onPressed: () {
                bloc.add(CartEvent());
              },
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.25,
              child: ListView.separated(
                  controller: _categoryController,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          _pageController.jumpToPage(selectedIndex);
                        });
                      },
                      child: Container(
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: (selectedIndex == index) ? size.height * 0.1 : 0,
                              color: primaryColor,
                              width: 4,
                            ),
                            Expanded(
                              child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: const Duration(milliseconds: 500),
                                height: size.height * 0.1,
                                color: (selectedIndex == index)
                                    ? colorWhite
                                    : grey.withOpacity(0.1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.stream,
                                      color: (selectedIndex == index)
                                          ? primaryColor
                                          : colorBlack,
                                    ),
                                    const SizedBox(height: VERTICAL_PADDING / 2),
                                    getSmallText(
                                      'Jewellery',
                                      color: (selectedIndex == index)
                                          ? primaryColor
                                          : colorBlack,
                                      weight: FontWeight.w700,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(height: 1);
                  },
                  itemCount: 10),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: size.height,
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    pageSnapping: false,
                    itemCount: 10,
                    itemBuilder: (ctx, index) {
                      return categoryGrid(bloc, context, 'Jewellery');
                    },
                    onPageChanged: (val) {
                      setState(() {
                        selectedIndex = val;
                        // _pageController.addListener(() {
                        //   setState(() {
                        //     atEdge = _pageController.offset.isFinite;
                        //   });
                        //   print(atEdge);
                        // });
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(1),
    );
  }
}
