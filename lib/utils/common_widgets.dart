import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
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
  bool border = true,
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
        hintStyle: const TextStyle(
            color: primaryColor, fontFamily: 'Nunito', fontSize: CATEGORY_TEXT_SIZE),
        labelText: labelText,
        labelStyle: const TextStyle(
            color: colorBlack, fontFamily: 'Nunito', fontSize: CATEGORY_TEXT_SIZE),
        prefixIcon: prefixIcon,
        prefixIconColor: colorBlack,
        contentPadding: EdgeInsets.zero,
        border: border
            ? const OutlineInputBorder()
            : const UnderlineInputBorder(borderSide: BorderSide(color: grey)),
        focusedBorder: border
            ? OutlineInputBorder(
                borderSide: const BorderSide(color: grey),
                borderRadius: BorderRadius.circular(BORDER_RADIUS),
              )
            : const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor))),
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
    child: getSmallText(text, color: colorWhite),
  );
}

Widget cartItem(BuildContext context, String image, String itemDescription,
    String itemPrice, String sizeSelected, String qtySelected, String soldByName) {
  return Container(
    color: colorWhite,
    padding: const EdgeInsets.only(bottom: VERTICAL_PADDING, top: VERTICAL_PADDING * 2),
    margin: const EdgeInsets.only(bottom: 4),
    child: Column(
      children: [
        // const SizedBox(height: VERTICAL_PADDING * 2),
        Container(
          width: double.infinity,
          // padding: const EdgeInsets.all(VERTICAL_PADDING / 1.5),
          margin: const EdgeInsets.only(
              top: VERTICAL_PADDING, left: HORIZONTAL_PADDING, right: HORIZONTAL_PADDING),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
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
                      weight: FontWeight.w800,
                      fontSize: CATEGORY_TEXT_SIZE,
                    ),
                    const SizedBox(height: VERTICAL_PADDING / 2),
                    GestureDetector(
                      onTap: () {
                        productDetailBottomSheet(
                            context, image, itemDescription, itemPrice);
                      },
                      child: Container(
                        width: double.infinity,
                        color: colorWhite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getSmallText(
                                  itemPrice,
                                  color: darkGrey,
                                  maxLines: 1,
                                  fontSize: CATEGORY_TEXT_SIZE,
                                ),
                                const SizedBox(height: VERTICAL_PADDING / 2),
                                Row(
                                  children: [
                                    getSmallText(
                                      size,
                                      color: darkGrey,
                                      fontSize: CATEGORY_TEXT_SIZE,
                                    ),
                                    getSmallText(
                                      sizeSelected,
                                      color: darkGrey,
                                      fontSize: CATEGORY_TEXT_SIZE,
                                    ),
                                    const SizedBox(width: HORIZONTAL_PADDING),
                                    getSmallText(
                                      qty,
                                      color: darkGrey,
                                      fontSize: CATEGORY_TEXT_SIZE,
                                    ),
                                    getSmallText(
                                      qtySelected,
                                      color: darkGrey,
                                      fontSize: CATEGORY_TEXT_SIZE,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: VERTICAL_PADDING),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        removeItemBottomSheet(context, image, itemDescription, itemPrice,
                            sizeSelected, qtySelected);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.close,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          getSmallText(
                            remove,
                            color: darkGrey,
                            maxLines: 1,
                            weight: FontWeight.w700,
                            fontSize: CATEGORY_TEXT_SIZE,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider(thickness: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getSmallText(
                soldBy + " : " + soldByName,
                color: darkGrey,
                fontSize: CATEGORY_TEXT_SIZE,
              ),
              getSmallText(
                freeDelivery,
                color: darkGrey,
                fontSize: CATEGORY_TEXT_SIZE,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Future productDetailBottomSheet(
    BuildContext context, String image, String itemDescription, String itemPrice) {
  return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: VERTICAL_PADDING * 2, horizontal: HORIZONTAL_PADDING),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(height: VERTICAL_PADDING * 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
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
                          weight: FontWeight.w800,
                          fontSize: CATEGORY_TEXT_SIZE,
                        ),
                        const SizedBox(height: VERTICAL_PADDING / 2),
                        getSmallText(
                          itemPrice,
                          color: darkGrey,
                          maxLines: 1,
                          fontSize: CATEGORY_TEXT_SIZE,
                        ),
                        const SizedBox(height: VERTICAL_PADDING / 2),
                        Row(
                          children: [
                            getSmallText(
                              size,
                              color: darkGrey,
                              fontSize: CATEGORY_TEXT_SIZE,
                            ),
                            sizeDropDown(['IND-4', 'IND-5', 'IND-6', 'IND-7', 'IND-8']),
                            const SizedBox(width: HORIZONTAL_PADDING),
                            getSmallText(
                              qty,
                              color: darkGrey,
                              fontSize: CATEGORY_TEXT_SIZE,
                            ),
                            incDecCounter(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: VERTICAL_PADDING),
              const Divider(thickness: 1),
              const SizedBox(height: VERTICAL_PADDING),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: getSmallText(
                    continueText,
                    weight: FontWeight.w700,
                    fontSize: CATEGORY_TEXT_SIZE,
                    color: colorWhite,
                  )),
            ],
          ),
        );
      });
}

Widget sizeDropDown(List<String> items) {
  String selectedVal = items[0];
  return DropdownButton(
      elevation: 6,
      borderRadius: BorderRadius.circular(BORDER_RADIUS),
      items: items.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem(
          child: getSmallText(
            e,
            color: darkGrey,
            fontSize: CATEGORY_TEXT_SIZE,
          ),
          value: e,
        );
      }).toList(),
      value: selectedVal,
      onChanged: (newVal) {
        selectedVal = newVal.toString();
      });
}

Widget incDecCounter() {
  int val = 1;
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: grey),
      borderRadius: BorderRadius.circular(BORDER_RADIUS / 2),
    ),
    padding: const EdgeInsets.symmetric(
        horizontal: HORIZONTAL_PADDING / 2, vertical: VERTICAL_PADDING / 2),
    child: IntrinsicHeight(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (val > 1) {
                val--;
              }
            },
            child: const Icon(
              Icons.remove,
              size: 16,
            ),
          ),
          const VerticalDivider(
            thickness: 0.5,
            color: grey,
          ),
          getSmallText(
            val.toString(),
            color: darkGrey,
            fontSize: CATEGORY_TEXT_SIZE,
          ),
          const VerticalDivider(
            thickness: 0.5,
            color: grey,
          ),
          GestureDetector(
            onTap: () {
              val++;
            },
            child: const Icon(
              Icons.add,
              size: 16,
            ),
          ),
        ],
      ),
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

Future removeItemBottomSheet(BuildContext context, String image, String itemDescription,
    String itemPrice, String sizeSelected, String qtySelected) {
  return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BORDER_RADIUS)),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: HORIZONTAL_PADDING, vertical: VERTICAL_PADDING * 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getSmallText(removeFromCart.toUpperCase(),
                      fontSize: CATEGORY_TEXT_SIZE, weight: FontWeight.w700),
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
              const SizedBox(height: VERTICAL_PADDING),
              const Divider(thickness: 1),
              const SizedBox(height: VERTICAL_PADDING),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
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
                          weight: FontWeight.w800,
                          fontSize: CATEGORY_TEXT_SIZE,
                        ),
                        const SizedBox(height: VERTICAL_PADDING / 2),
                        getSmallText(
                          itemPrice,
                          color: darkGrey,
                          maxLines: 1,
                          fontSize: CATEGORY_TEXT_SIZE,
                        ),
                        const SizedBox(height: VERTICAL_PADDING / 2),
                        Row(
                          children: [
                            getSmallText(
                              size,
                              color: darkGrey,
                              fontSize: CATEGORY_TEXT_SIZE,
                            ),
                            getSmallText(
                              sizeSelected,
                              color: darkGrey,
                              fontSize: CATEGORY_TEXT_SIZE,
                            ),
                            const SizedBox(width: HORIZONTAL_PADDING),
                            getSmallText(
                              qty,
                              color: darkGrey,
                              fontSize: CATEGORY_TEXT_SIZE,
                            ),
                            getSmallText(
                              qtySelected,
                              color: darkGrey,
                              fontSize: CATEGORY_TEXT_SIZE,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: VERTICAL_PADDING),
              const Divider(thickness: 1),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      label: getSmallText(remove,
                          weight: FontWeight.w600, fontSize: CATEGORY_TEXT_SIZE),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: getSmallText(moveToWishlist,
                          weight: FontWeight.w600,
                          color: colorWhite,
                          fontSize: CATEGORY_TEXT_SIZE),
                      icon: const Icon(
                        Icons.favorite_border,
                        color: colorWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}

Future addToCartBottomSheet(BuildContext context, List sizeList) {
  return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(height: VERTICAL_PADDING * 2),
              getSmallText(
                selectSize,
                weight: FontWeight.w800,
              ),
              const SizedBox(height: VERTICAL_PADDING),
              Wrap(
                children: [
                  for (int i = 0; i < sizeList.length; i++) sizeContainer(sizeList[i]),
                ],
              ),
              const SizedBox(height: VERTICAL_PADDING),
              const Divider(thickness: 1),
              const SizedBox(height: VERTICAL_PADDING),
              ElevatedButton.icon(
                  icon: const Icon(Icons.shopping_cart_outlined, color: colorWhite),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  label: getSmallText(
                    addToCart,
                    weight: FontWeight.w700,
                    fontSize: CATEGORY_TEXT_SIZE,
                    color: colorWhite,
                  )),
            ],
          ),
        );
      });
}

Widget sizeContainer(String size) {
  return Container(
    height: 35,
    padding: const EdgeInsets.symmetric(
        vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
    margin: const EdgeInsets.all(VERTICAL_PADDING),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(BORDER_RADIUS * 2),
      border: Border.all(color: colorBlack),
    ),
    child: getSmallText(
      size,
      weight: FontWeight.w600,
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
        bloc.add(NotificationEvent());
        break;

      case 3:
        bloc.add(OrdersEvent());
        break;

      case 4:
        bloc.add(AccountEvent());
        break;

      default:
        bloc.add(HomeScreenEvent());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<MainBloc>(context);
    return Container(
      color: Colors.transparent,
      child: DotNavigationBar(
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
      ),
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
        child: GridView.builder(
            itemCount: 30,
            shrinkWrap: true,
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
                        height: deviceHeight * 0.086,
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
    ],
  );
}
