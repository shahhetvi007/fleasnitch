import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OrderSuccessful extends BaseStatefulWidget {
  @override
  _OrderSuccessfulState createState() => _OrderSuccessfulState();
}

class _OrderSuccessfulState extends BaseState<OrderSuccessful> with BasicScreen {
  final confettiController = ConfettiController();

  @override
  void dispose() {
    super.dispose();
    confettiController.dispose();
  }

  @override
  void initState() {
    confettiController.play();
    Future.delayed(const Duration(seconds: 3), () {
      confettiController.stop();
      Navigator.pop(context);
      bloc.add(HomeScreenEvent());
    });
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getTitle(
                  orderPlacedSuccessfully,
                  color: colorBlack,
                  weight: FontWeight.w800,
                ),
                const SizedBox(width: HORIZONTAL_PADDING / 2),
                Icon(
                  Icons.check_circle_outline,
                  size: 26,
                )
              ],
            ),
            SizedBox(height: size.height / 3),
            ConfettiWidget(
              confettiController: confettiController,
              shouldLoop: true,
              blastDirection: -pi / 2, //up
              numberOfParticles: 20,
            )
          ],
        ),
      ),
    );
  }
}
