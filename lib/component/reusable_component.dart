import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/style/theme.dart';

Widget customButton({required String text, required Function() onPressed}) {
  return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
        backgroundColor: MaterialStateProperty.all(mainColor),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      onPressed: onPressed,
      child: Text(text));
}

Widget customTextFiled({
  required TextEditingController textEditingController,
  bool isPassword = false,
  TextInputType textInputType = TextInputType.text,
  required Function(String) onFiledSubmitted,
  required String? Function(String?) validator,
  Function()? viewPassword,
  required Icon suffixIcon,
  required String hintText,
  required String labelText,
}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    style: const TextStyle(
        letterSpacing: 1,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black87),
    controller: textEditingController,
    obscureText: isPassword,
    keyboardType: textInputType,
    onFieldSubmitted: onFiledSubmitted,
    maxLines: 1,
    validator: validator,
    decoration: InputDecoration(
      suffixIcon: IconButton(onPressed: viewPassword, icon: suffixIcon),
      hintText: hintText,
      hintStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: textColor),
      labelText: labelText,
      labelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: textColor),
          borderRadius: BorderRadius.circular(25)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: textColor),
          borderRadius: BorderRadius.circular(25)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: textColor),
          borderRadius: BorderRadius.circular(25)),
    ),
  );
}

void toastMessage({required String message, required ToastState state}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 15.0,
    textColor: Colors.white,
    backgroundColor: toastColor(state),
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
  );
}

enum ToastState { SUCCESS, ERROR, WARNING }

Color toastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = mainColor;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    default:
      color = Colors.amber;
  }
  return color;
}
