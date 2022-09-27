import 'package:flutter/material.dart';

const String baseUrl = "https://student.valuxapps.com/api/";

void navigatePush(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget()));

void navigateReplacement(context, String widgetName) =>
    Navigator.pushReplacementNamed(context, widgetName);

