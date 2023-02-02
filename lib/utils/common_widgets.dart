import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/ui/screens/categories/sub_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Text getSmallText(String text,
    {bool bold = false,
    Color color = colorBlack,
    double fontSize = SUBTITLE_FONT_SIZE,
    // TextAlign align,
    FontWeight weight = FontWeight.w400,
    int maxLines = 5,
    bool isCenter = false,
    bool lineThrough = false}) {
  return Text(
    text,
    // textAlign: align,
    maxLines: maxLines,
    style: TextStyle(
        decoration: lineThrough ? TextDecoration.lineThrough : null,
        color: color,
        fontWeight: weight,
        fontSize: fontSize,
        fontFamily: "Nunito"),
    overflow: TextOverflow.ellipsis,
  );
}

Text getTitle(
  String text, {
  bool bold = false,
  bool isCenter = false,
  FontWeight weight = FontWeight.w500,
  double fontSize = TITLE_TEXT_FONT_SIZE,
  Color color = colorBlack,
  bool softWrap = false,
  // int lines
}) {
  return Text(
    text,
    // maxLines: lines,
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
    style: TextStyle(
        color: color, fontSize: fontSize, fontWeight: weight, fontFamily: 'Nunito'),
    softWrap: softWrap,
    overflow: softWrap ? TextOverflow.visible : TextOverflow.ellipsis,
  );
}

loader() {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Loading..."),
          Container(
            margin: const EdgeInsets.all(VERTICAL_PADDING),
            child: const CircularProgressIndicator(
              backgroundColor: Colors.black26,
              valueColor: AlwaysStoppedAnimation<Color>(
                colorWhite, //<-- SEE HERE
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget commonTextFormField({
  required BuildContext context,
  Icon? prefixIcon,
  String hintText = '',
  String labelText = "",
  bool obscureText = false,
  bool readOnly = false,
  TextInputType keyboardType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  TextCapitalization textCapitalization = TextCapitalization.sentences,
  int maxLines = 1,
  TextEditingController? controller,
  String? Function(String?)? validator,
  void Function(String)? onTextChanged,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    textCapitalization: textCapitalization,
    controller: controller,
    validator: validator,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onChanged: onTextChanged,
    obscureText: obscureText,
    decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: colorBlack, fontFamily: 'Nunito'),
        labelText: labelText,
        labelStyle: const TextStyle(color: colorBlack, fontFamily: 'Nunito'),
        prefixIcon: prefixIcon,
        prefixIconColor: colorBlack,
        contentPadding: EdgeInsets.zero,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: colorBlack),
          borderRadius: BorderRadius.circular(BORDER_RADIUS),
        )),
  );
}

Widget customButton(String text, Function f) {
  return ElevatedButton(
    onPressed: () {
      f();
    },
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
      primary: primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(BORDER_RADIUS / 2),
          topRight: Radius.circular(BORDER_RADIUS * 2),
          bottomRight: Radius.circular(BORDER_RADIUS * 2),
          bottomLeft: Radius.circular(BORDER_RADIUS * 2),
        ),
      ),
    ),
    child: getSmallText(text),
  );
}

Widget cartItem(String image, String itemDescription, String itemPrice,
    String sizeSelected, String qtySelected) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(VERTICAL_PADDING / 1.5),
    margin: const EdgeInsets.symmetric(vertical: VERTICAL_PADDING),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(BORDER_RADIUS / 2),
              border: Border.all(color: darkGrey),
            ),
            padding: const EdgeInsets.all(VERTICAL_PADDING),
            child: Image.asset(image),
          ),
        ),
        const SizedBox(width: HORIZONTAL_PADDING),
        Expanded(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getSmallText(
                itemDescription,
                color: darkGrey,
                maxLines: 1,
                weight: FontWeight.w700,
              ),
              const SizedBox(height: VERTICAL_PADDING / 2),
              getSmallText(
                itemPrice,
                color: darkGrey,
                maxLines: 1,
              ),
              const SizedBox(height: VERTICAL_PADDING / 2),
              Row(
                children: [
                  getSmallText(
                    size,
                    color: darkGrey,
                  ),
                  getSmallText(
                    sizeSelected,
                    color: darkGrey,
                  ),
                  const SizedBox(width: HORIZONTAL_PADDING),
                  getSmallText(
                    qty,
                    color: darkGrey,
                  ),
                  getSmallText(
                    qtySelected,
                    color: darkGrey,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget popularProductItem() {
  return Card(
    margin: const EdgeInsets.all(VERTICAL_PADDING),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(BORDER_RADIUS),
    ),
    elevation: 6,
    color: colorWhite,
    child: Container(
      height: deviceHeight / 5,
      width: deviceWidth / 3,
      margin: const EdgeInsets.all(VERTICAL_PADDING),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: deviceHeight / 6,
            width: deviceWidth / 3,
            decoration: BoxDecoration(
              color: itemBackground,
              borderRadius: BorderRadius.circular(BORDER_RADIUS / 2),
            ),
            child: Image.asset(IC_DRESS),
          ),
          getSmallText(
            dress,
            color: colorBlack,
            weight: FontWeight.w800,
            maxLines: 1,
          )
        ],
      ),
    ),
  );
}

Widget productItem(MainBloc bloc) {
  return GestureDetector(
    onTap: () {
      bloc.add(ProductDetailEvent());
    },
    child: Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 5,
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              DRESS,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.all(VERTICAL_PADDING / 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getSmallText('Yellow Attractive Dress',
                    color: grey,
                    fontSize: SMALL_TEXT,
                    weight: FontWeight.w600,
                    maxLines: 1),
                Row(
                  children: [
                    Flexible(
                      child: getSmallText(
                        '₹365',
                        color: colorBlack,
                        weight: FontWeight.w700,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: getSmallText(
                        '400',
                        color: grey,
                        fontSize: SMALL_TEXT,
                        lineThrough: true,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: getSmallText(
                        '15% off',
                        color: grey,
                        fontSize: SMALL_TEXT,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING / 2),
                  decoration: BoxDecoration(
                    color: grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(BORDER_RADIUS / 2),
                  ),
                  child: getSmallText(
                    freeDelivery,
                    color: colorBlack,
                    fontSize: SMALLER_TEXT,
                    weight: FontWeight.w600,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    ),
  );
}

class BottomNav extends StatefulWidget {
  int currentIndex;

  BottomNav(this.currentIndex);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  MainBloc bloc = MainBloc();
  // int _currentIndex = 0;

  void changePage(int index) {
    setState(() {
      widget.currentIndex = index;
    });
    switch (index) {
      case 0:
        bloc.add(HomeScreenEvent());
        break;

      case 1:
        bloc.add(CategoryEvent());
        break;

      case 2:
        bloc.add(HomeScreenEvent());
        break;

      case 3:
        bloc.add(HomeScreenEvent());
        break;

      case 4:
        bloc.add(HomeScreenEvent());
        break;

      default:
        bloc.add(HomeScreenEvent());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<MainBloc>(context);
    return DotNavigationBar(
      backgroundColor: Theme.of(context).accentColor,
      enablePaddingAnimation: false,
      dotIndicatorColor: colorTransparent,
      paddingR: const EdgeInsets.only(bottom: VERTICAL_PADDING / 2, right: 0),
      marginR: EdgeInsets.only(
        left: deviceWidth * 0.1,
        right: deviceWidth * 0.1,
        bottom: VERTICAL_PADDING * 2.5,
      ),
      currentIndex: widget.currentIndex,
      onTap: (index) {
        changePage(index);
      },
      items: [
        DotNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.category_outlined),
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.notifications_none),
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.account_circle_outlined),
        ),
      ],
    );
  }
}

Widget categoryGrid(MainBloc bloc, BuildContext context, String categoryName) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(VERTICAL_PADDING),
        child: getSmallText(
          categoryName,
          color: colorBlack,
          weight: FontWeight.w700,
          fontSize: APPBAR_FONT_SIZE,
        ),
      ),
      Expanded(
        child: SizedBox(
          // height: deviceHeight,
          child: GridView.builder(
              itemCount: 30,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (ctx) => SubCategoryScreen()));
                        bloc.add(SubCategoryEvent());
                      },
                      child: Card(
                        shape: const CircleBorder(),
                        elevation: 5,
                        color: colorWhite,
                        child: Container(
                          height: deviceHeight * 0.087,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            IC_DRESS,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    getSmallText(
                      dress,
                      color: grey,
                      weight: FontWeight.w500,
                      fontSize: CATEGORY_TEXT_SIZE,
                    )
                  ],
                );
              }),
        ),
      ),
    ],
  );
}
