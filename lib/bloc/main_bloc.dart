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
  Notification,
  Account,
  LoggedLoading
}

class MainBloc extends Bloc<MainEvent, MainStates> {
  MainBloc() : super(MainStates.SplashIn);

  init() {
    add(AccountEvent());
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
    }
  }
}
