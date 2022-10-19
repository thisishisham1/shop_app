import 'package:flutter/material.dart';

const String baseUrl = "https://student.valuxapps.com/api/";
const String errorName = "Enter your name sir";
const String errorPhone = "Invalid phone";
const String errorEmail = "Invalid email";
const String errorPasswordLess = "Password must be more than 7 number";
const String errorPasswordEmpty = "Invalid password";

void navigatePush(context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateReplacement(context, String widgetName) =>
    Navigator.pushReplacementNamed(context, widgetName);

void navigatePop(context) => Navigator.pop(context);

String? token = '';
