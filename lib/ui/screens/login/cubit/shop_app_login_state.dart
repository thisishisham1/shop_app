part of 'shop_app_login_cubit.dart';

@immutable
abstract class ShopAppLoginState {}

class ShopAppLoginInitial extends ShopAppLoginState {}

class ViewPassword extends ShopAppLoginState {}

class RememberMe extends ShopAppLoginState {}

class ShopAppLoginLoadingState extends ShopAppLoginState {}

class ShopAppLoginSuccessState extends ShopAppLoginState {
  final LoginModel loginModel;
  ShopAppLoginSuccessState(this.loginModel);
}

class ShopAppLoginErrorState extends ShopAppLoginState {
  final String error;

  ShopAppLoginErrorState(this.error);
}
