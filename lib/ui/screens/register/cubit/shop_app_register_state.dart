part of 'shop_app_register_cubit.dart';

@immutable
abstract class ShopAppRegisterState {}

class ShopAppRegisterInitial extends ShopAppRegisterState {}

class ViewPassword extends ShopAppRegisterState {}

class ShopAppRegisterLoading extends ShopAppRegisterState {}

class ShopAppRegisterSuccess extends ShopAppRegisterState {
  final RegisterModel registerModel;
  ShopAppRegisterSuccess(this.registerModel);
}

class ShopAppRegisterLoadingError extends ShopAppRegisterState {
  final String error;

  ShopAppRegisterLoadingError(this.error);
}
