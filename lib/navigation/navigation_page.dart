import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/supplier/add_new_item/add_new_item_screen.dart';
import 'package:fleasnitch/supplier/supplier_account/supplier_account_screen.dart';
import 'package:fleasnitch/supplier/supplier_category/supplier_category_screen.dart';
import 'package:fleasnitch/supplier/supplier_home/supplier_home_screen.dart';
import 'package:fleasnitch/supplier/supplier_login/supplier_account_details.dart';
import 'package:fleasnitch/supplier/supplier_login/supplier_login_screen.dart';
import 'package:fleasnitch/supplier/supplier_notification/supplier_notification_screen.dart';
import 'package:fleasnitch/supplier/supplier_selling/supplier_selling_screen.dart';
import 'package:fleasnitch/ui/screens/account/account_screen.dart';
import 'package:fleasnitch/ui/screens/account/saved_addresses.dart';
import 'package:fleasnitch/ui/screens/cart/add_new_address_screen.dart';
import 'package:fleasnitch/ui/screens/cart/cart_screen.dart';
import 'package:fleasnitch/ui/screens/cart/delivery_address_screen.dart';
import 'package:fleasnitch/ui/screens/cart/payment_method_screen.dart';
import 'package:fleasnitch/ui/screens/cart/summary_screen.dart';
import 'package:fleasnitch/ui/screens/categories/category_screen.dart';
import 'package:fleasnitch/ui/screens/categories/sub_category_screen.dart';
import 'package:fleasnitch/ui/screens/favorites/favorites_screen.dart';
import 'package:fleasnitch/ui/screens/home/home_screen.dart';
import 'package:fleasnitch/ui/screens/login/login_screen.dart';
import 'package:fleasnitch/ui/screens/notifications/notification_screen.dart';
import 'package:fleasnitch/ui/screens/orders/order_detail_screen.dart';
import 'package:fleasnitch/ui/screens/orders/orders_screen.dart';
import 'package:fleasnitch/ui/screens/products/product_detail_screen.dart';
import 'package:fleasnitch/ui/screens/shop/shop_screen.dart';
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
          } else if (state == MainStates.OrderSummary) {
            return SummaryScreen();
          } else if (state == MainStates.Notification) {
            return NotificationScreen();
          } else if (state == MainStates.Account) {
            return AccountScreen();
          } else if (state == MainStates.Orders) {
            return OrdersScreen();
          } else if (state == MainStates.OrderDetail) {
            return OrderDetailScreen();
          } else if (state == MainStates.Favorites) {
            return FavoritesScreen();
          } else if (state == MainStates.SavedAddresses) {
            return SavedAddresses();
          } else if (state == MainStates.Shop) {
            return ShopScreen();
          } else if (state == MainStates.SupplierLogin) {
            return SupplierLoginScreen();
          } else if (state == MainStates.SupplierDetails) {
            return SupplierAccountDetails();
          } else if (state == MainStates.SupplierHome) {
            return SupplierHomeScreen();
          } else if (state == MainStates.AddNewItem) {
            return AddNewItemScreen();
          } else if (state == MainStates.SupplierAccount) {
            return SupplierAccountScreen();
          } else if (state == MainStates.SupplierCategory) {
            return SupplierCategoryScreen();
          } else if (state == MainStates.SupplierNotification) {
            return SupplierNotificationScreen();
          } else if (state == MainStates.SupplierSelling) {
            return SupplierSellingScreen();
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
