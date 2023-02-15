import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class AddNewAddressScreen extends BaseStatefulWidget {
  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends BaseState<AddNewAddressScreen> with BasicScreen {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: itemBackground,
        appBar: AppBar(
          title: getTitle(
            addDeliveryAddress,
            fontSize: HOME_TITLE_SIZE,
            // color: Theme.of(context).secondaryHeaderColor,
            weight: FontWeight.w700,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 18),
            padding: EdgeInsets.zero,
            onPressed: () {
              bloc.add(DeliveryAddressEvent());
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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        color: colorWhite,
                        padding: const EdgeInsets.symmetric(
                            vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(VERTICAL_PADDING),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.call_rounded,
                                    color: primaryColor.withOpacity(0.5),
                                  ),
                                  const SizedBox(width: HORIZONTAL_PADDING / 2),
                                  getSmallText(contactDetails,
                                      fontSize: HOME_TITLE_SIZE, weight: FontWeight.w800),
                                ],
                              ),
                            ),
                            const SizedBox(height: VERTICAL_PADDING / 2),
                            commonTextFormField(
                              context: context,
                              labelText: fullName,
                              border: false,
                            ),
                            const SizedBox(height: VERTICAL_PADDING),
                            commonTextFormField(
                              context: context,
                              labelText: mobileNumber,
                              border: false,
                            ),
                            const SizedBox(height: VERTICAL_PADDING),
                          ],
                        ),
                      ),
                      const SizedBox(height: VERTICAL_PADDING),
                      Container(
                        color: colorWhite,
                        padding: const EdgeInsets.symmetric(
                            vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(VERTICAL_PADDING),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: primaryColor.withOpacity(0.5),
                                  ),
                                  const SizedBox(width: HORIZONTAL_PADDING / 2),
                                  getSmallText(address,
                                      fontSize: HOME_TITLE_SIZE, weight: FontWeight.w800),
                                ],
                              ),
                            ),
                            const SizedBox(height: VERTICAL_PADDING / 2),
                            commonTextFormField(
                              context: context,
                              labelText: houseNoBuildingName,
                              border: false,
                            ),
                            const SizedBox(height: VERTICAL_PADDING * 1.5),
                            commonTextFormField(
                              context: context,
                              labelText: roadNameAreaColony,
                              border: false,
                            ),
                            const SizedBox(height: VERTICAL_PADDING * 1.5),
                            commonTextFormField(
                              context: context,
                              labelText: pinCode,
                              border: false,
                            ),
                            const SizedBox(height: VERTICAL_PADDING * 1.5),
                            Row(
                              children: [
                                Expanded(
                                  child: commonTextFormField(
                                    context: context,
                                    labelText: city,
                                    border: false,
                                  ),
                                ),
                                const SizedBox(width: HORIZONTAL_PADDING * 1.5),
                                Expanded(
                                  child: commonTextFormField(
                                    context: context,
                                    labelText: state,
                                    border: false,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: VERTICAL_PADDING * 1.5),
                            commonTextFormField(
                              context: context,
                              labelText: nearbyLocation,
                              border: false,
                            ),
                            const SizedBox(height: VERTICAL_PADDING * 1.5),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: colorWhite,
              padding: const EdgeInsets.symmetric(
                  vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
              child: ElevatedButton(
                  onPressed: () {
                    bloc.add(PaymentEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: getSmallText(
                    saveAddressAndContinue,
                    weight: FontWeight.w700,
                    fontSize: CATEGORY_TEXT_SIZE,
                    color: colorWhite,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
