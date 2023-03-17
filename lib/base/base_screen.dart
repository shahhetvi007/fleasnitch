import '../bloc/main_bloc.dart';
import '../ui/res/color_resources.dart';
import '../ui/res/dimen_resources.dart';
import '../utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/common_widgets.dart';

abstract class BaseStatefulWidget extends StatefulWidget with WidgetsBindingObserver {}

abstract class BaseState<Screen extends BaseStatefulWidget> extends State<Screen>
    with RouteAware {}

mixin BasicScreen<Screen extends BaseStatefulWidget> on BaseState<Screen> {
  MainBloc bloc = MainBloc();

  Color appBarColor = colorWhite;
  bool isLoading = false;
  bool isBlurred = false;
  bool isShowMessage = false;
  String message = "Something went wrong!";
  bool gestureEnabled = false;
  Function f = () {};

  @override
  Widget build(BuildContext context) {
    Globals.globalContext = context;
    bloc = BlocProvider.of<MainBloc>(context);
    return Scaffold(
      backgroundColor: colorTransparent,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          isShowMessage
              ? WillPopScope(
                  onWillPop: () {
                    bloc.add(HomeScreenEvent());
                    return Future.value(false);
                  },
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getTitle("Fleasnitch",
                              bold: true,
                              isCenter: true,
                              fontSize: TITLE_TEXT_FONT_SIZE,
                              color: colorWhite,
                              weight: FontWeight.w700),
                        ],
                      ),
                      content: GestureDetector(
                        child: getSmallText(
                          message,
                          bold: true,
                          isCenter: true,
                          fontSize: SUBTITLE_FONT_SIZE,
                          color: colorBlack,
                          weight: FontWeight.w500,
                        ),
                        onTap: gestureEnabled
                            ? () {
                                Navigator.pop(context);
                              }
                            : null,
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              f();
                            },
                            child: const Text('OK'))
                      ],
                    ),
                  ),
                )
              : isLoading
                  ? loader()
                  : isBlurred
                      ? const Scaffold(
                          backgroundColor: colorTransparent,
                          resizeToAvoidBottomInset: false,
                          body: Center(),
                        )
                      : GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          child: buildBody(context)),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context);

  changeLoadStatus() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  changeBlurredStatus() {
    setState(() {
      isBlurred = !isBlurred;
    });
  }

  showMessage(String message, Function f, [bool gestureEnabled = false]) {
    setState(() {
      isShowMessage = true;
      this.message = message;
      this.f = f;
      this.gestureEnabled = gestureEnabled;
    });
  }
}
