import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class SupplierAccountDetails extends BaseStatefulWidget {
  @override
  _SupplierAccountDetailsState createState() => _SupplierAccountDetailsState();
}

class _SupplierAccountDetailsState extends BaseState<SupplierAccountDetails>
    with BasicScreen, SingleTickerProviderStateMixin {
  bool isHomeSelected = true;
  bool isOfficeSelected = false;
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: getTitle(
          completeAccDetails,
          fontSize: HOME_TITLE_SIZE,
          weight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          padding: EdgeInsets.zero,
          onPressed: () {
            bloc.add(SupplierLoginEvent());
          },
        ),
        bottom: TabBar(
          controller: controller,
          labelPadding: EdgeInsets.zero,
          onTap: (val) {
            if (controller.index != val) {
              controller.index = controller.previousIndex;
            } else {
              controller.index = val;
            }
          },
          labelStyle: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: CATEGORY_TEXT_SIZE,
            fontWeight: FontWeight.w800,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: CATEGORY_TEXT_SIZE,
            fontWeight: FontWeight.w700,
          ),
          labelColor: primaryColor,
          indicatorColor: primaryColor,
          unselectedLabelColor: colorBlack,
          tabs: const [
            Tab(
              text: pickupAdd,
              icon: Icon(Icons.location_on_outlined),
            ),
            Tab(text: bankDetails, icon: Icon(Icons.account_balance)),
            Tab(
              text: supplierDetails,
              icon: Icon(Icons.person_outline),
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          pickUpAddWidget(),
          bankDetailsWidget(),
          supplierDetailsWidget(),
        ],
      ),
    );
  }

  Widget pickUpAddWidget() {
    return Container(
      color: colorWhite,
      padding: const EdgeInsets.symmetric(
          vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: VERTICAL_PADDING),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: primaryColor.withOpacity(0.5),
                ),
                const SizedBox(width: HORIZONTAL_PADDING / 2),
                getSmallText(address, fontSize: HOME_TITLE_SIZE, weight: FontWeight.w800),
              ],
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            commonTextFormField(
              context: context,
              labelText: houseNoBuildingName,
              border: false,
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            commonTextFormField(
              context: context,
              labelText: roadNameAreaColony,
              border: false,
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            commonTextFormField(
              context: context,
              labelText: pinCode,
              border: false,
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            Row(
              children: [
                Expanded(
                  child: commonTextFormField(
                    context: context,
                    labelText: city,
                    border: false,
                  ),
                ),
                const SizedBox(width: HORIZONTAL_PADDING * 2),
                Expanded(
                  child: commonTextFormField(
                    context: context,
                    labelText: state,
                    border: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            commonTextFormField(
              context: context,
              labelText: nearbyLocation,
              border: false,
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            getSmallText(
              typeOfAddress,
              fontSize: CATEGORY_TEXT_SIZE,
              weight: FontWeight.w700,
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            Row(
              children: [
                typeOfAdd(home, isHomeSelected, () {
                  setState(() {
                    isHomeSelected = true;
                    isOfficeSelected = false;
                  });
                }),
                const SizedBox(width: HORIZONTAL_PADDING),
                typeOfAdd(office, isOfficeSelected, () {
                  setState(() {
                    isOfficeSelected = true;
                    isHomeSelected = false;
                  });
                }),
              ],
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: () {
                controller.animateTo(1);
              },
              child:
                  getSmallText(continueText, color: colorWhite, weight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget bankDetailsWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: VERTICAL_PADDING),
            Row(
              children: [
                Icon(
                  Icons.account_balance,
                  color: primaryColor.withOpacity(0.5),
                ),
                const SizedBox(width: HORIZONTAL_PADDING / 2),
                getSmallText(bankDetails,
                    fontSize: HOME_TITLE_SIZE, weight: FontWeight.w800),
              ],
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            commonTextFormField(
              context: context,
              hintText: bankAccountName,
              labelText: bankAccountName,
              border: false,
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            commonTextFormField(
              context: context,
              hintText: bankName,
              labelText: bankName,
              border: false,
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            commonTextFormField(
              context: context,
              hintText: accountNo,
              labelText: accountNo,
              border: false,
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            commonTextFormField(
              context: context,
              hintText: ifsc,
              labelText: ifsc,
              border: false,
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: () {
                controller.animateTo(2);
              },
              child:
                  getSmallText(continueText, color: colorWhite, weight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget supplierDetailsWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: VERTICAL_PADDING),
            commonTextFormField(
              context: context,
              labelText: name,
              hintText: name,
              border: false,
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            commonTextFormField(
              context: context,
              labelText: email,
              hintText: email,
              border: false,
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            commonTextFormField(
              context: context,
              labelText: mobileNumber,
              hintText: mobileNumber,
              border: false,
            ),
            const SizedBox(height: VERTICAL_PADDING * 2),
            commonTextFormField(
              context: context,
              labelText: shopName,
              hintText: shopName,
              border: false,
            ),
            const SizedBox(height: VERTICAL_PADDING * 3),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: () {
                bloc.add(SupplierHomeEvent());
              },
              child: getSmallText(saveAndContinue,
                  color: colorWhite, weight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
