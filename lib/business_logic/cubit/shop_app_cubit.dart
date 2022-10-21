import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/component/constant.dart';
import 'package:shop_app/data/models/categories/categories_model.dart';
import 'package:shop_app/data/models/home/home_model.dart';
import 'package:shop_app/data/models/login/login_model.dart';
import 'package:shop_app/ui/screens/categories/categories.dart';
import 'package:shop_app/ui/screens/favorite_shopping/favorite_shopping.dart';
import 'package:shop_app/ui/screens/home/home.dart';
import 'package:shop_app/ui/screens/setting/setting.dart';
import '../../component/end_points.dart';
import '../../data/dio_helper/dio_helper.dart';

part 'shop_app_state.dart';

class ShopAppCubit extends Cubit<ShopAppState> {
  ShopAppCubit() : super(ShopAppInitial());

  static ShopAppCubit get(context) => BlocProvider.of<ShopAppCubit>(context);
  int currentIndex = 0;
  HomeModel? homeModel;
  CategoriesModel? categoriesModel;
  List<BottomNavigationBarItem> navigateItem = [
    BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/image/navigation_bar/home.png"),
          size: 30,
        ),
        label: "Home"),
    BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/image/navigation_bar/categories.png"),
          size: 30,
        ),
        label: "Categories"),
    BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/image/navigation_bar/fav shoping.png"),
          size: 30,
        ),
        label: "favorite"),
    BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/image/navigation_bar/settings.png"),
          size: 30,
        ),
        label: "setting")
  ];

  List<Widget> screen = [Home(), Categories(), FavoriteShopping(), Setting()];

  void screenView(int index) {
    currentIndex = index;
    if (currentIndex == 0) {
      Home();
    }
    if (currentIndex == 1) {
      getCategories();
      Categories();
    }
    if (currentIndex == 2) {
      FavoriteShopping();
    }
    if (currentIndex == 3) {
      Setting();
    }
    emit(NavigateScreen());
  }

  void getProductData() {
    emit(ShopAppLoadingHomeData());
    DioHelper.getData(url: HOME, Authorization: token ?? '', language: "en")
        .then((value) {
      homeModel = HomeModel.fromJson(value.data);
      emit(ShopAppSuccessHomeData());
    }).catchError((error) {
      emit(ShopAppErrorHomeData());
      print(error.toString());
    });
  }

  void getCategories() {
    emit(ShopAppLoadingCategoriesData());
    DioHelper.getData(url: CATEGORIES).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopAppSuccessCategoriesData());
    }).catchError((error) {
      emit(ShopAppErrorCategoriesData());
      print(error.toString());
    });
  }
}
