import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/ui/screens/login/cubit/shop_app_login_cubit.dart';
import 'package:shop_app/ui/screens/login/login.dart';
import 'package:shop_app/ui/screens/on_boarding/on_boarding.dart';
import 'package:shop_app/ui/screens/register/cubit/shop_app_register_cubit.dart';
import 'package:shop_app/ui/screens/register/register.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoarding.routeName: (context) => OnBoarding(),
  LoginScreen.routeName: (context) => BlocProvider<ShopAppLoginCubit>(
        create: (context) => ShopAppLoginCubit(),
        child: LoginScreen(),
      ),
  Register.routeName: (context) => Register(),
};
