part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

// to show splash screen
class SplashInEvent extends MainEvent {
  SplashInEvent();
}

class LoginEvent extends MainEvent {
  LoginEvent();
}

class HomeScreenEvent extends MainEvent {
  HomeScreenEvent();
}

class CategoryEvent extends MainEvent {
  CategoryEvent();
}

class SubCategoryEvent extends MainEvent {
  SubCategoryEvent();
}

class ProductDetailEvent extends MainEvent {
  ProductDetailEvent();
}

class CartEvent extends MainEvent {
  CartEvent();
}

class DeliveryAddressEvent extends MainEvent {
  DeliveryAddressEvent();
}

class AddDeliveryAddressEvent extends MainEvent {
  AddDeliveryAddressEvent();
}

class PaymentEvent extends MainEvent {
  PaymentEvent();
}

class NotificationEvent extends MainEvent {
  NotificationEvent();
}

class AccountEvent extends MainEvent {
  AccountEvent();
}

class OrdersEvent extends MainEvent {
  OrdersEvent();
}

class OrderDetailEvent extends MainEvent {
  OrderDetailEvent();
}
