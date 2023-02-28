import 'dart:async';
import 'dart:io';

import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/main_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MainBloc bloc = MainBloc();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: Platform.isAndroid ? 2 : 2), () {
      // bloc.add(Login());
      bloc.init();
      //bloc.add(Login());
      // bloc.add(SignUp);
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<MainBloc>(context);
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: getTitle(
          appName,
          fontSize: TAGLINE_FONT_SIZE,
          weight: FontWeight.w700,
        ),
      ),
    );
  }
}
