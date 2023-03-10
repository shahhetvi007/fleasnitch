import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class SupplierLoginScreen extends BaseStatefulWidget {
  @override
  _SupplierLoginScreenState createState() => _SupplierLoginScreenState();
}

class _SupplierLoginScreenState extends BaseState<SupplierLoginScreen> with BasicScreen {
  bool is8Chars = false;
  bool is1SpecialChar = false;
  bool is1CapChar = false;
  bool is1Num = false;

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: VERTICAL_PADDING * 2),
                  getTitle(
                    createSupplierAcc,
                    weight: FontWeight.w700,
                  ),
                  getSmallText(sellYourProducts, color: grey),
                  const SizedBox(height: VERTICAL_PADDING * 3),
                  commonTextFormField(
                    context: context,
                    hintText: mobileNumber,
                    labelText: mobileNumber,
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(
                      Icons.call,
                      size: 16,
                    ),
                  ),
                  const SizedBox(height: VERTICAL_PADDING * 3),
                  commonTextFormField(
                    context: context,
                    hintText: email,
                    labelText: email,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(
                      Icons.mail,
                      size: 16,
                    ),
                  ),
                  const SizedBox(height: VERTICAL_PADDING * 3),
                  commonTextFormField(
                    context: context,
                    hintText: password,
                    labelText: password,
                    obscureText: true,
                    prefixIcon: const Icon(
                      Icons.password,
                      size: 16,
                    ),
                  ),
                  const SizedBox(height: VERTICAL_PADDING * 3),
                  getSmallText(makePassStrong,
                      fontSize: CATEGORY_TEXT_SIZE, weight: FontWeight.w700),
                  Row(
                    children: [
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: is8Chars,
                        onChanged: (bool? val) {
                          setState(() {
                            is8Chars = val!;
                          });
                        },
                        activeColor: primaryColor,
                        shape: const CircleBorder(),
                      ),
                      getSmallText(min8Chars, fontSize: CATEGORY_TEXT_SIZE),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: is1SpecialChar,
                        onChanged: (bool? val) {
                          setState(() {
                            is1SpecialChar = val!;
                          });
                        },
                        activeColor: primaryColor,
                        shape: const CircleBorder(),
                      ),
                      getSmallText(min1SpecialChar, fontSize: CATEGORY_TEXT_SIZE),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: is1CapChar,
                        onChanged: (bool? val) {
                          setState(() {
                            is1CapChar = val!;
                          });
                        },
                        activeColor: primaryColor,
                        shape: const CircleBorder(),
                      ),
                      getSmallText(min1Caps, fontSize: CATEGORY_TEXT_SIZE),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: is1Num,
                        onChanged: (bool? val) {
                          setState(() {
                            is1Num = val!;
                          });
                        },
                        activeColor: primaryColor,
                        shape: const CircleBorder(),
                      ),
                      getSmallText(min1Num, fontSize: CATEGORY_TEXT_SIZE),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: () {
                bloc.add(SupplierDetailsEvent());
              },
              child:
                  getSmallText(continueText, color: colorWhite, weight: FontWeight.w600),
            ),
            const SizedBox(height: VERTICAL_PADDING),
            Wrap(
              children: [
                getSmallText(byClicking, fontSize: CATEGORY_TEXT_SIZE, color: grey),
                getSmallText(termsAndConditions,
                    fontSize: CATEGORY_TEXT_SIZE, color: primaryColor),
                getSmallText(and, fontSize: CATEGORY_TEXT_SIZE, color: grey),
                getSmallText(privacyPolicy,
                    fontSize: CATEGORY_TEXT_SIZE, color: primaryColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
