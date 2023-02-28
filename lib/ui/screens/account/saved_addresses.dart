import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/models/address.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class SavedAddresses extends BaseStatefulWidget {
  @override
  _SavedAddressesState createState() => _SavedAddressesState();
}

class _SavedAddressesState extends BaseState<SavedAddresses> with BasicScreen {
  List<Address> addresses = [
    Address(
        name: 'Hetvi Shah',
        buildingName: 'Iris Watson',
        roadName: ' Fusce Rd',
        pincode: '20620',
        city: 'Frederick',
        state: 'Nebraska',
        mobileNo: '9876541230',
        isSelected: true),
    Address(
        name: 'Hrithik',
        houseNo: 'Robert Robertson',
        roadName: ' NW Bobcat Lane',
        pincode: '206205',
        city: 'St. Robert',
        state: 'Nebraska',
        mobileNo: '9876541230',
        isSelected: false),
    Address(
        name: 'Deepika',
        houseNo: 'Cecilia Chapman',
        roadName: ' 711-2880 Nulla',
        pincode: '96522',
        city: 'St.Mankato',
        state: 'Mississippi',
        mobileNo: '9876541230',
        isSelected: false),
  ];

  @override
  Widget buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: getTitle(
          savedAddresses,
          fontSize: HOME_TITLE_SIZE,
          weight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          padding: EdgeInsets.zero,
          onPressed: () {
            bloc.add(AccountEvent());
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
                return addressListItem(addresses[i]);
              },
              itemCount: addresses.length,
              separatorBuilder: (ctx, i) {
                return const Divider(thickness: 0.5);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget addressListItem(Address address) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSmallText(address.name.toString(),
              weight: FontWeight.w800, fontSize: HOME_TITLE_SIZE),
          Wrap(
            children: [
              getSmallText(
                  address.houseNo != null ? address.houseNo.toString() + " " : ""),
              getSmallText(address.buildingName != null
                  ? address.buildingName.toString() + ""
                  : ""),
              getSmallText(
                  address.roadName != null ? address.roadName.toString() + ", " : ""),
              getSmallText(address.area != null ? address.area.toString() + ", " : ""),
              getSmallText(address.city.toString() + ", "),
              getSmallText(address.state.toString() + " - "),
              getSmallText(address.pincode.toString() + " "),
            ],
          ),
          getSmallText(address.mobileNo.toString()),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              bloc.add(AddDeliveryAddressEvent());
            },
            child: getSmallText(edit.toUpperCase(),
                color: primaryColor,
                fontSize: CATEGORY_TEXT_SIZE,
                weight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
