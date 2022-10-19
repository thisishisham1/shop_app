import 'package:flutter/material.dart';
import 'package:shop_app/ui/layout/layout.dart';
import 'package:shop_app/ui/screens/login/login.dart';
import 'package:shop_app/ui/screens/on_boarding/on_boarding.dart';
import 'package:shop_app/ui/screens/register/register.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoarding.routeName: (context) => OnBoarding(),
  LoginScreen.routeName: (context) => LoginScreen(),
  Register.routeName: (context) => Register(),
  Layout.routeName: (context) => Layout(),
};
