import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/navigation/navigation_page.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/utils/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreference initialization
  await SharedPrefHelper.createInstance();
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
      // theme: ThemeData.dark(),
      theme: ThemeData(
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
      home: const NavigationPage(),
    );
  }
}
