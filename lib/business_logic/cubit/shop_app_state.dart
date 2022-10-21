part of 'shop_app_cubit.dart';

@immutable
abstract class ShopAppState {}

class ShopAppInitial extends ShopAppState {}

class NavigateScreen extends ShopAppState {}

class ShopAppLoadingHomeData extends ShopAppState {}

class ShopAppSuccessHomeData extends ShopAppState {}

class ShopAppErrorHomeData extends ShopAppState {}

class ShopAppLoadingCategoriesData extends ShopAppState {}

class ShopAppSuccessCategoriesData extends ShopAppState {}

class ShopAppErrorCategoriesData extends ShopAppState {}
