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

class OrderSummaryEvent extends MainEvent {
  OrderSummaryEvent();
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

class FavoritesEvent extends MainEvent {
  FavoritesEvent();
}

class SavedAddressEvent extends MainEvent {
  SavedAddressEvent();
}

class ShopEvent extends MainEvent {
  ShopEvent();
}

class SupplierLoginEvent extends MainEvent {
  SupplierLoginEvent();
}

class SupplierDetailsEvent extends MainEvent {
  SupplierDetailsEvent();
}

class SupplierHomeEvent extends MainEvent {
  SupplierHomeEvent();
}

class AddNewItemEvent extends MainEvent {
  AddNewItemEvent();
}

class SupplierAccountEvent extends MainEvent {
  SupplierAccountEvent();
}

class SupplierCategoryEvent extends MainEvent {
  SupplierCategoryEvent();
}

class SupplierNotificationEvent extends MainEvent {
  SupplierNotificationEvent();
}

class SupplierSellingEvent extends MainEvent {
  SupplierSellingEvent();
}
