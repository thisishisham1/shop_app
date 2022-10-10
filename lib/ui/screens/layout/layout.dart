import 'package:flutter/material.dart';
import 'package:shop_app/component/constant.dart';
import 'package:shop_app/data/cache_helper/chache_data.dart';
import 'package:shop_app/ui/screens/login/login.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);
  static String routeName = "layout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Hisham"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            CacheData.removeData(key: "Token").then((value) {
              if (value) {
                navigateReplacement(context, LoginScreen.routeName);
              }
            });
          },
          child: Text("Sign out"),
        ),
      ),
    );
  }
}
