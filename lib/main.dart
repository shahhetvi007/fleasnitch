import 'package:animations/animations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/navigation/navigation_page.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:fleasnitch/utils/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreference initialization
  await SharedPrefHelper.createInstance();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(testDeviceIds: ["D1E7806B927510B7600637E3ACF2E8AB"]));
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<MainBloc>(
        create: (BuildContext context) => MainBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const NavigationPage(),

        // When navigating to the "/second" route, build the SecondScreen widget.
      },
      navigatorKey: navigatorKey,

      // theme: ThemeData.dark(),
      theme: ThemeData(
        // pageTransitionsTheme: const PageTransitionsTheme(
        //   builders: <TargetPlatform, PageTransitionsBuilder>{
        //     TargetPlatform.android: FadeThroughPageTransitionsBuilder()
        //   },
        // ),
        primarySwatch: Colors.orange,
        primaryColor: primaryColor,
        backgroundColor: secondaryColor,
        accentColor: secondaryColor,
        scaffoldBackgroundColor: colorWhite,
        secondaryHeaderColor: secondaryDarkColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: darkGrey,
          selectedItemColor: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: colorWhite,
          elevation: 0,
          foregroundColor: colorBlack,
        ),
      ),
      // home: const NavigationPage(),
      initialRoute: '/',
    );
  }
}
