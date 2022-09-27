import 'package:flutter/material.dart';
import 'package:shop_app/style/theme.dart';

Widget customButton(
    {required String text,
    required Function() onPressed}) {
  return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
        backgroundColor: MaterialStateProperty.all(mainColor),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      onPressed: onPressed,
      child: Text(text));
}
