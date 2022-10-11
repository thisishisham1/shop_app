import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/ui/screens/favorite_shopping/favorite_shopping.dart';
import 'package:shop_app/ui/screens/home/home.dart';
import 'package:shop_app/ui/screens/setting/setting.dart';

part 'shop_app_state.dart';

class ShopAppCubit extends Cubit<ShopAppState> {
  ShopAppCubit() : super(ShopAppInitial());

  static ShopAppCubit get(context) => BlocProvider.of<ShopAppCubit>(context);
  int currentIndex = 0;

  List<BottomNavigationBarItem> navigateItem = [
    BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/image/navigation_bar/home.png"),size: 30,
        ),
        label: "Home"),
    BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/image/navigation_bar/fav shoping.png"),size: 30,
        ),
        label: "favorite"),
    BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/image/navigation_bar/settings.png"),size: 30,
        ),
        label: "setting")
  ];

  List<Widget> screen = [Home(), FavoriteShopping(), Setting()];

  void screenView(int index) {
    currentIndex = index;
    if (currentIndex == 0) {
      Home();
    }
    if (currentIndex == 1) {
      FavoriteShopping();
    }
    if (currentIndex == 2) {
      Setting();
    }
    emit(NavigateScreen());
  }
}
