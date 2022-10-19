part of 'shop_app_cubit.dart';

@immutable
abstract class ShopAppState {}

class ShopAppInitial extends ShopAppState {}

class NavigateScreen extends ShopAppState {}

class ShopAppSuccessHomeData extends ShopAppState {}

class ShopAppLoadingHomeData extends ShopAppState {}

class ShopAppErrorHomeData extends ShopAppState {}
