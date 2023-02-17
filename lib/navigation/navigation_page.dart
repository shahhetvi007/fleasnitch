import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/screens/account/account_screen.dart';
import 'package:fleasnitch/ui/screens/cart/add_new_address_screen.dart';
import 'package:fleasnitch/ui/screens/cart/cart_screen.dart';
import 'package:fleasnitch/ui/screens/cart/delivery_address_screen.dart';
import 'package:fleasnitch/ui/screens/cart/payment_method_screen.dart';
import 'package:fleasnitch/ui/screens/categories/category_screen.dart';
import 'package:fleasnitch/ui/screens/categories/sub_category_screen.dart';
import 'package:fleasnitch/ui/screens/home/home_screen.dart';
import 'package:fleasnitch/ui/screens/login/login_screen.dart';
import 'package:fleasnitch/ui/screens/notifications/notification_screen.dart';
import 'package:fleasnitch/ui/screens/orders/order_detail_screen.dart';
import 'package:fleasnitch/ui/screens/orders/orders_screen.dart';
import 'package:fleasnitch/ui/screens/products/product_detail_screen.dart';
import 'package:fleasnitch/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  MainBloc bloc = MainBloc();
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<MainBloc>(context);
    bloc.add(SplashInEvent());
    return WillPopScope(child: Scaffold(
      body: BlocBuilder<MainBloc, MainStates>(
        builder: (context, state) {
          if (state == MainStates.SplashIn) {
            return const SplashScreen();
          } else if (state == MainStates.Login) {
            return LoginScreen();
          } else if (state == MainStates.HomeScreen) {
            return HomeScreen();
          } else if (state == MainStates.Category) {
            return CategoryScreen();
          } else if (state == MainStates.SubCategory) {
            return SubCategoryScreen();
          } else if (state == MainStates.ProductDetail) {
            return ProductDetailScreen();
          } else if (state == MainStates.Cart) {
            return CartScreen();
          } else if (state == MainStates.AddDeliveryAddress) {
            return AddNewAddressScreen();
          } else if (state == MainStates.DeliveryAddress) {
            return DeliveryAddressScreen();
          } else if (state == MainStates.PaymentMethod) {
            return PaymentMethodScreen();
          } else if (state == MainStates.Notification) {
            return NotificationScreen();
          } else if (state == MainStates.Account) {
            return AccountScreen();
          } else if (state == MainStates.Orders) {
            return OrdersScreen();
          } else if (state == MainStates.OrderDetail) {
            return OrderDetailScreen();
          } else if (state == MainStates.LoggedLoading) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Loading..."),
                    Container(
                        margin: EdgeInsets.all(10), child: CircularProgressIndicator()),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    ), onWillPop: () async {
      bloc.add(HomeScreenEvent());
      return false;
    });
  }
}
