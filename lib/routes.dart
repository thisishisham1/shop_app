import 'package:flutter/material.dart';
import 'package:shop_app/ui/screens/login_screen/login_screen.dart';
import 'package:shop_app/ui/screens/on_boarding_screen/on_boarding.dart';
import 'package:shop_app/ui/screens/register/register.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoarding.routeName: (context) => OnBoarding(),
  LoginScreen.routeName: (context) => LoginScreen(),
  Register.routeName: (context) => Register(),
};
