import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class DeliveryAddressScreen extends BaseStatefulWidget {
  @override
  _DeliveryAddressScreenState createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends BaseState<DeliveryAddressScreen>
    with BasicScreen {
  List<Map<String, Object>> address = [
    {
      'name': 'Hetvi Shah',
      'address': 'Iris Watson P.O. Box 283 8562 Fusce Rd.Frederick Nebraska 20620',
      'number': '9876541230'
    },
    {
      'name': 'Hrithik Roshan',
      'address': 'Robert Robertson, 1234 NW Bobcat Lane, St. Robert,',
      'number': '9876541230'
    },
    {
      'name': 'Deepika',
      'address': 'Cecilia Chapman 711-2880 Nulla St.Mankato Mississippi 96522',
      'number': '9876541230'
    },
  ];
  Object? selectedVal;

  @override
  void initState() {
    selectedVal = address[0].values.first;
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: getTitle(
            deliveryAddress,
            fontSize: HOME_TITLE_SIZE,
            weight: FontWeight.w700,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 18),
            padding: EdgeInsets.zero,
            onPressed: () {
              bloc.add(CartEvent());
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: VERTICAL_PADDING * 1.5,
                    left: HORIZONTAL_PADDING,
                    right: HORIZONTAL_PADDING,
                    bottom: VERTICAL_PADDING),
                height: size.height * 0.05,
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: darkGrey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(BORDER_RADIUS),
                  ),
                ),
                child: TextField(
                  // focusNode: searchFocusNode,
                  // controller: searchcontroller,
                  // textAlign: TextAlign.center,
                  onChanged: (value) {
                    // _debouncer.run(() {
                    //   _onSearchChanged(
                    //       searchcontroller.text
                    //           .trim());
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: searchAddByNameNo,
                    hintStyle: TextStyle(
                        color: grey,
                        height: 1,
                        fontSize: SUBTITLE_FONT_SIZE,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Nunito'),
                    contentPadding: EdgeInsets.only(bottom: 0, top: 4),
                    border: InputBorder.none,
                    // enabledBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(color: darkGrey),
                    //     borderRadius: BorderRadius.circular(BORDER_RADIUS)),
                  ),
                ),
              ),
              const Divider(
                thickness: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: HORIZONTAL_PADDING, vertical: VERTICAL_PADDING / 2),
                child: GestureDetector(
                  onTap: () {
                    bloc.add(AddDeliveryAddressEvent());
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        color: primaryColor,
                        size: 18,
                      ),
                      getSmallText(addNewAddress, color: primaryColor)
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 0.5,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  return customRadio(address[i], selectedVal!);
                },
                itemCount: address.length,
                separatorBuilder: (ctx, i) {
                  return const Divider(thickness: 0.5);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customRadio(Map<String, Object> address, Object val) {
    bool isSelected = selectedVal.toString() == address.toString();
    return Container(
      color: isSelected ? secondaryColor.withOpacity(0.5) : colorWhite,
      padding: const EdgeInsets.symmetric(
          horizontal: HORIZONTAL_PADDING, vertical: VERTICAL_PADDING),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getSmallText(address['name'].toString(),
                        weight: FontWeight.w800, fontSize: HOME_TITLE_SIZE),
                    getSmallText(address['address'].toString()),
                    getSmallText(address['number'].toString()),
                  ],
                ),
              ),
              Expanded(
                child: Radio(
                  value: address,
                  groupValue: val,
                  onChanged: (value) {
                    setSelectedVal(value!);
                  },
                  activeColor: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          if (isSelected)
            GestureDetector(
              onTap: () {
                bloc.add(AddDeliveryAddressEvent());
              },
              child: getSmallText(edit.toUpperCase(),
                  color: primaryColor,
                  fontSize: CATEGORY_TEXT_SIZE,
                  weight: FontWeight.w800),
            ),
          if (isSelected) const SizedBox(height: VERTICAL_PADDING),
          if (isSelected)
            ElevatedButton(
                onPressed: () {
                  bloc.add(PaymentEvent());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: getSmallText(
                  deliverToThisAdd,
                  weight: FontWeight.w700,
                  color: colorWhite,
                )),
        ],
      ),
    );
  }

  setSelectedVal(Object value) {
    setState(() {
      selectedVal = value;
    });
  }
}
