import 'package:flutter/material.dart';
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

Widget customTextFiled(
    {required TextEditingController textEditingController,
    bool obScureText = false,
    TextInputType textInputType = TextInputType.text,
    required Function(String) onFiledSubmitted,
    required String? Function(String?) validator,
    Function()? viewPassword,
    required IconData suffixIcon,
    required String hintText,
      required String labelText,

    }) {
  return TextFormField(
    style: const TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
    controller: textEditingController,
    obscureText: obScureText,
    keyboardType: textInputType,
    onFieldSubmitted: onFiledSubmitted,
    maxLines: 1,
    validator: validator,
    decoration: InputDecoration(
      suffixIcon: obScureText
          ? IconButton(onPressed: viewPassword, icon: Icon(suffixIcon))
          : Icon(suffixIcon),
      suffixIconColor: obScureText ? mainColor : textColor,
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: textColor
      ),
      labelText: labelText,
      labelStyle:  const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
      ),
      enabled: true,
      enabledBorder:  OutlineInputBorder(
        borderSide: const BorderSide(color: textColor),
        borderRadius: BorderRadius.circular(25)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(25)
      ),
    ),
  );
}
