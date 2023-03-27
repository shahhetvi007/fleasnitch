import 'package:fleasnitch/helper/auth_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

enum MainStates {
  SplashIn,
  Login,
  HomeScreen,
  Category,
  SubCategory,
  ProductDetail,
  Cart,
  AddDeliveryAddress,
  DeliveryAddress,
  PaymentMethod,
  OrderSummary,
  Notification,
  Account,
  Orders,
  OrderDetail,
  Favorites,
  SavedAddresses,
  Shop,
  SupplierLogin,
  SupplierDetails,
  SupplierHome,
  AddNewItem,
  SupplierAccount,
  SupplierCategory,
  SupplierNotification,
  SupplierSelling,
  LoggedLoading
}

class MainBloc extends Bloc<MainEvent, MainStates> {
  MainBloc() : super(MainStates.SplashIn);

  init() {
    // add(AuthHelper().user != null ? HomeScreenEvent() : LoginEvent());
    add(HomeScreenEvent());
  }

  @override
  Stream<MainStates> mapEventToState(MainEvent event) async* {
    // sets state based on events
    if (event is SplashInEvent) {
      yield MainStates.SplashIn;
    } else if (event is LoginEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.Login;
    } else if (event is HomeScreenEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.HomeScreen;
    } else if (event is CategoryEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.Category;
    } else if (event is SubCategoryEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.SubCategory;
    } else if (event is ProductDetailEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.ProductDetail;
    } else if (event is CartEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.Cart;
    } else if (event is DeliveryAddressEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.DeliveryAddress;
    } else if (event is AddDeliveryAddressEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.AddDeliveryAddress;
    } else if (event is PaymentEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.PaymentMethod;
    } else if (event is NotificationEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.Notification;
    } else if (event is AccountEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.Account;
    } else if (event is OrdersEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.Orders;
    } else if (event is OrderDetailEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.OrderDetail;
    } else if (event is OrderSummaryEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.OrderSummary;
    } else if (event is FavoritesEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.Favorites;
    } else if (event is SavedAddressEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.SavedAddresses;
    } else if (event is ShopEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.Shop;
    } else if (event is SupplierLoginEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.SupplierLogin;
    } else if (event is SupplierDetailsEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.SupplierDetails;
    } else if (event is SupplierHomeEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.SupplierHome;
    } else if (event is AddNewItemEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.AddNewItem;
    } else if (event is SupplierAccountEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.SupplierAccount;
    } else if (event is SupplierCategoryEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.SupplierCategory;
    } else if (event is SupplierNotificationEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.SupplierNotification;
    } else if (event is SupplierSellingEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.SupplierSelling;
    }
  }
}
