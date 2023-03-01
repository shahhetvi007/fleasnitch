import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

import '../models/size.dart';

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
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
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

class ProductDetailSheet extends StatefulWidget {
  final String image;
  final String itemDescription;
  final String itemPrice;
  final String selectedSize;
  final ValueChanged<String> valueChanged;
  final int quantity;
  final ValueChanged<int> quantityChanged;

  ProductDetailSheet({
    required this.image,
    required this.itemDescription,
    required this.itemPrice,
    required this.selectedSize,
    required this.valueChanged,
    required this.quantity,
    required this.quantityChanged,
  });

  @override
  State<ProductDetailSheet> createState() => _ProductDetailSheetState();
}

class _ProductDetailSheetState extends State<ProductDetailSheet> {
  late String selectedVal;
  late int qtySelected;

  @override
  void initState() {
    selectedVal = widget.selectedSize;
    qtySelected = widget.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset(widget.image),
                ),
              ),
              const SizedBox(width: HORIZONTAL_PADDING),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getSmallText(
                      widget.itemDescription,
                      color: darkGrey,
                      maxLines: 1,
                      weight: FontWeight.w800,
                      fontSize: CATEGORY_TEXT_SIZE,
                    ),
                    const SizedBox(height: VERTICAL_PADDING / 2),
                    getSmallText(
                      widget.itemPrice,
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
                        DropdownButton(
                            elevation: 6,
                            borderRadius: BorderRadius.circular(BORDER_RADIUS),
                            items: sizeList.map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem(
                                child: getSmallText(
                                  e.sizeText,
                                  color: darkGrey,
                                  fontSize: CATEGORY_TEXT_SIZE,
                                ),
                                value: e.sizeText,
                              );
                            }).toList(),
                            value: selectedVal,
                            onChanged: (newVal) {
                              setState(() {
                                selectedVal = newVal.toString();
                              });
                              widget.valueChanged(selectedVal);
                            }),
                        const SizedBox(width: HORIZONTAL_PADDING),
                        getSmallText(
                          qty,
                          color: darkGrey,
                          fontSize: CATEGORY_TEXT_SIZE,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.circular(BORDER_RADIUS / 2),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: HORIZONTAL_PADDING / 2,
                              vertical: VERTICAL_PADDING / 2),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (qtySelected > 1) {
                                      setState(() {
                                        qtySelected--;
                                      });
                                      widget.quantityChanged(qtySelected);
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
                                  qtySelected.toString(),
                                  color: darkGrey,
                                  fontSize: CATEGORY_TEXT_SIZE,
                                ),
                                const VerticalDivider(
                                  thickness: 0.5,
                                  color: grey,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      qtySelected++;
                                    });
                                    widget.quantityChanged(qtySelected);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
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
              onPressed: () {
                Navigator.pop(context);
              },
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
  }
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

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isLiked = false;
  MainBloc bloc = MainBloc();
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<MainBloc>(context);
    return GestureDetector(
      onTap: () {
        bloc.add(ProductDetailEvent());
      },
      child: Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    DRESS,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 10,
                  child: Container(
                    // padding: const EdgeInsets.all(6),
                    // decoration: BoxDecoration(
                    //   shape: BoxShape.circle,
                    //   color: colorWhite.withOpacity(0.8),
                    // ),
                    // child: GestureDetector(
                    //     onTap: () {
                    //       setState(() {
                    //         isLiked = !isLiked;
                    //       });
                    //     },
                    //     child: Icon(
                    //       isLiked ? Icons.favorite : Icons.favorite_border,
                    //       color: isLiked ? Colors.red : grey,
                    //       size: 20,
                    //     )),
                    child: LikeButton(
                      size: 25,
                      padding: EdgeInsets.all(6),
                      circleColor:
                          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Color(0xff33b5e5),
                        dotSecondaryColor: Color(0xff0099cc),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.favorite_border,
                          color: isLiked ? Colors.deepPurpleAccent : Colors.purple,
                          size: 24,
                        );
                      },
                      // likeCount: 665,
                    ),
                  ),
                ),
              ],
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING / 2),
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

Future addToCartBottomSheet(BuildContext context, List<ProductSize> sizeList) {
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
                  for (int i = 0; i < sizeList.length; i++)
                    GestureDetector(
                      onTap: () {
                        // setState(() {
                        for (var element in sizeList) {
                          element.isSelected = false;
                        }
                        sizeList[i].isSelected = true;
                        // });
                      },
                      child: sizeContainer(sizeList[i].sizeText),
                    ),
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

Widget sizeContainer(String size, {bool isSelected = false}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(
        horizontal: HORIZONTAL_PADDING, vertical: VERTICAL_PADDING),
    margin: const EdgeInsets.all(VERTICAL_PADDING),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(BORDER_RADIUS * 2),
      border: Border.all(color: isSelected ? primaryColor : colorBlack),
      color: isSelected ? primaryColor.withOpacity(0.2) : colorWhite,
    ),
    child: getSmallText(
      size,
      weight: FontWeight.w600,
      isCenter: true,
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

Widget cartSteps(int currentStep) {
  List<EasyStep> getSteps() => [
        const EasyStep(icon: Icon(Icons.shopping_cart), title: cart),
        const EasyStep(icon: Icon(Icons.location_on), title: address),
        const EasyStep(icon: Icon(Icons.money_outlined), title: payment),
        const EasyStep(icon: Icon(Icons.summarize), title: summary),
      ];
  return Container(
    color: colorWhite,
    height: deviceHeight * 0.085,
    child: EasyStepper(
      steps: getSteps(),
      activeStep: currentStep,
      showLoadingAnimation: false,
      stepRadius: deviceWidth * 0.04,
      activeStepBorderColor: secondaryDarkColor,
      activeStepIconColor: secondaryDarkColor,
      activeStepTextColor: secondaryDarkColor,
      // activeStepBorderType: BorderType.normal,
      finishedStepBackgroundColor: secondaryDarkColor,
      finishedStepTextColor: secondaryDarkColor,
      defaultStepBorderType: BorderType.normal,
      lineColor: grey,
      lineType: LineType.normal,
      lineLength: deviceWidth * 0.16,
      borderThickness: 5,
      // padding: VERTICAL_PADDING,
      disableScroll: true,
    ),
  );
}

Widget discountContainer(String discount) {
  return Container(
    color: secondaryDarkColor.withOpacity(0.1),
    padding: const EdgeInsets.symmetric(
        vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(IC_DISCOUNT, color: secondaryDarkColor),
        const SizedBox(width: 4),
        getSmallText(discountText,
            fontSize: CATEGORY_TEXT_SIZE, color: secondaryDarkColor),
        getSmallText(discount, fontSize: CATEGORY_TEXT_SIZE, color: secondaryDarkColor),
      ],
    ),
  );
}

List<ProductSize> sizeList = [
  ProductSize('S'),
  ProductSize('M'),
  ProductSize('L'),
  ProductSize('XL'),
  ProductSize('XXL'),
];
