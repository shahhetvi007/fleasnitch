import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_screen.dart';
import '../../res/color_resources.dart';

class LoginScreen extends BaseStatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> with BasicScreen {
  bool isSignInDialogShown = false;
  bool isSignUp = false;
  @override
  Widget buildBody(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: secondaryColor,
      body: Stack(children: [
        Container(
          color: secondaryColor,
          height: mediaQuery.height,
          child: Image.asset(
            SHOPPING_GIF,
            fit: BoxFit.fitWidth,
          ),
        ),
        AnimatedPositioned(
          top: isSignInDialogShown ? -30 : 0,
          duration: const Duration(milliseconds: 240),
          height: mediaQuery.height,
          width: mediaQuery.width,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: mediaQuery.width,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: VERTICAL_PADDING * 8),
                  child: getTitle(
                    appName,
                    color: colorBlack,
                    softWrap: true,
                    fontSize: TAGLINE_FONT_SIZE,
                    weight: FontWeight.w700,
                  ),
                ),
                // Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: VERTICAL_PADDING * 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: mediaQuery.width / 1.8,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(BORDER_RADIUS * 2),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Future.delayed(
                            const Duration(milliseconds: 800),
                            () {
                              setState(() {
                                isSignInDialogShown = true;
                              });

                              customLoginDialog(context, onClosed: (value) {
                                setState(() {
                                  isSignInDialogShown = false;
                                });
                              });
                            },
                          );
                        },
                        child: getSmallText(login, weight: FontWeight.w500),
                        style: ElevatedButton.styleFrom(
                          padding:
                              const EdgeInsets.symmetric(vertical: VERTICAL_PADDING * 2),
                          primary: colorTransparent,
                          shadowColor: colorTransparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(BORDER_RADIUS * 2)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }

  Future<Object?> customLoginDialog(BuildContext context,
      {required ValueChanged onClosed}) {
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: login,
        transitionDuration: const Duration(milliseconds: 400),
        transitionBuilder: (_, animation, __, child) {
          Tween<Offset> tween;
          tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
          return SlideTransition(
            position: tween.animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            ),
            child: child,
          );
        },
        pageBuilder: (ctx, _, __) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
            return Center(
              child: AnimatedContainer(
                height: isSignUp
                    ? MediaQuery.of(context).size.height * 0.9
                    : MediaQuery.of(context).size.height * 0.7,
                margin: const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING * 1.5),
                padding: const EdgeInsets.symmetric(
                    vertical: VERTICAL_PADDING * 3, horizontal: HORIZONTAL_PADDING * 1.5),
                decoration: BoxDecoration(
                  color: colorWhite.withOpacity(0.7),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(BORDER_RADIUS * 4)),
                ),
                duration: const Duration(milliseconds: 400),
                child: Scaffold(
                  backgroundColor: colorTransparent,
                  resizeToAvoidBottomInset: false,
                  body: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Spacer(),
                          Center(
                              child: getTitle(
                            isSignUp ? signUp : login,
                            color: colorBlack,
                            bold: true,
                            weight: FontWeight.w900,
                            fontSize: TAGLINE_FONT_SIZE,
                          )),
                          // const SizedBox(height: VERTICAL_PADDING * 2),
                          AnimatedCrossFade(
                            firstChild: const SignUpForm(),
                            secondChild: SignInForm(setState: setState),
                            crossFadeState: isSignUp
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 400),
                          ),
                          orDivider(),
                          // const SizedBox(height: VERTICAL_PADDING * 2),
                          socialLogin(),
                          // const SizedBox(height: VERTICAL_PADDING * 2),
                          dontHaveAccountText(context, setState),
                          // Spacer(),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: -40,
                        child: CircleAvatar(
                          radius: BORDER_RADIUS * 1.6,
                          backgroundColor: primaryColor.withOpacity(0.7),
                          child: const Icon(
                            Icons.close,
                            color: colorBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        }).then(onClosed);
  }

  Widget orDivider() {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: colorBlack,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING),
          child: getSmallText(or, weight: FontWeight.w700),
        ),
        const Expanded(
            child: Divider(
          color: colorBlack,
        )),
      ],
    );
  }

  Widget socialLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(VERTICAL_PADDING),
          child: Image.asset(
            GOOGLE_ICON,
            width: ICON_SIZE,
            height: ICON_SIZE,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: colorBlack),
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(VERTICAL_PADDING),
          child: Image.asset(
            PHONE_ICON,
            width: ICON_SIZE,
            height: ICON_SIZE,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: colorBlack),
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
          ),
        )
      ],
    );
  }

  Widget dontHaveAccountText(ctx, setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getSmallText(isSignUp ? alreadyHaveAccount : dontHaveAccount, color: colorBlack),
        GestureDetector(
          onTap: () {
            if (mounted) {
              setState(() {
                isSignUp = !isSignUp;
              });
            }
          },
          child: getSmallText(
            isSignUp ? login : signUp,
            color: Theme.of(ctx).primaryColor,
            weight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
    required this.setState,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();

  final Function(void Function() fn) setState;
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  MainBloc bloc = MainBloc();
  // bool showConfetti = false;
  // bool isShowLoading = false;
  //
  // late SMITrigger check;
  // late SMITrigger error;
  // late SMITrigger reset;
  //
  // late SMITrigger confetti;
  //
  // StateMachineController getRiveController(Artboard artboard) {
  //   StateMachineController? controller =
  //       StateMachineController.fromArtboard(artboard, "State Machine 1");
  //   artboard.addController(controller!);
  //   return controller;
  // }
  //
  void signIn(BuildContext context) {
    //   widget.setState(() {
    //     isShowLoading = true;
    //     showConfetti = true;
    //     print('inSetState');
    //     print(isShowLoading);
    //   });
    //   Future.delayed(const Duration(seconds: 2), () {
    if (_formKey.currentState!.validate()) {
      // changeLoadStatus();
      Navigator.pop(context);
      bloc.add(HomeScreenEvent());
      // changeLoadStatus();
      //       // If everything looks good it shows the success animation
      //       check.fire();
      //       Future.delayed(const Duration(seconds: 2), () {
      //         widget.setState(() {
      //           isShowLoading = false;
      //         });
      //         // After closing it want to show the confetti animation
      //         // First let's add the animation
      //         // restart it
      //         confetti.fire();
      //         // Once all success we will navigate to the Next screen
      //       });
    } else {
      // showMessage(message, () {
      //   if (mounted) {
      //     setState(() {
      //       isShowMessage = false;
      //       Navigator.pop(context);
      //     });
      //   }
      // });
      //       // or error animation
      //       error.fire();
      //       Future.delayed(const Duration(seconds: 2), () {
      //         widget.setState(() {
      //           isShowLoading = false;
      //         });
      //       });
    }
    //   });
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<MainBloc>(context);
    print('build called');
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // isShowLoading
              //     ? Center(
              //         child: RiveAnimation.asset(
              //           CHECK_RIVE,
              //           onInit: (artboard) {
              //             StateMachineController controller = getRiveController(artboard);
              //             check = controller.findSMI("Check") as SMITrigger;
              //             error = controller.findSMI("Error") as SMITrigger;
              //             reset = controller.findSMI("Reset") as SMITrigger;
              //           },
              //         ),
              //       )
              //     : const SizedBox(),
              // showConfetti
              //     ? Center(
              //         child: RiveAnimation.asset(
              //           CONFETTI_RIVE,
              //           onInit: (artboard) {
              //             StateMachineController controller = getRiveController(artboard);
              //             confetti =
              //                 controller.findSMI("Trigger explosion") as SMITrigger;
              //           },
              //         ),
              //       )
              //     : const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(
                    top: VERTICAL_PADDING, bottom: VERTICAL_PADDING * 2),
                child: commonTextFormField(
                    context: context,
                    prefixIcon: const Icon(Icons.email),
                    hintText: email,
                    labelText: email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: VERTICAL_PADDING, bottom: VERTICAL_PADDING * 2),
                child: commonTextFormField(
                    context: context,
                    prefixIcon: const Icon(Icons.password),
                    hintText: password,
                    labelText: password,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: VERTICAL_PADDING, bottom: VERTICAL_PADDING * 3),
                child: customButton(login, () {
                  signIn(context);
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: VERTICAL_PADDING, bottom: VERTICAL_PADDING * 1.5),
              child: commonTextFormField(
                context: context,
                prefixIcon: const Icon(Icons.person),
                hintText: fullName,
                labelText: fullName,
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: VERTICAL_PADDING, bottom: VERTICAL_PADDING * 1.5),
              child: commonTextFormField(
                context: context,
                prefixIcon: const Icon(Icons.email),
                hintText: email,
                labelText: email,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: VERTICAL_PADDING, bottom: VERTICAL_PADDING * 1.5),
              child: commonTextFormField(
                context: context,
                prefixIcon: const Icon(Icons.password),
                hintText: password,
                labelText: password,
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: VERTICAL_PADDING, bottom: VERTICAL_PADDING * 1.5),
              child: commonTextFormField(
                context: context,
                prefixIcon: const Icon(Icons.password),
                hintText: confirmPassword,
                labelText: confirmPassword,
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: VERTICAL_PADDING, bottom: VERTICAL_PADDING * 1.5),
              child: commonTextFormField(
                context: context,
                prefixIcon: const Icon(Icons.send_to_mobile),
                hintText: mobileNumber,
                labelText: mobileNumber,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: VERTICAL_PADDING, bottom: VERTICAL_PADDING * 1.5),
              child: commonTextFormField(
                context: context,
                prefixIcon: const Icon(Icons.location_on),
                hintText: billingAddress,
                labelText: billingAddress,
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: VERTICAL_PADDING, bottom: VERTICAL_PADDING * 3),
              child: customButton(signUp, () {}),
            ),
          ],
        ),
      ),
    );
  }
}
