import 'package:flutter/material.dart';
import 'package:shop_app/component/constant.dart';
import 'package:shop_app/style/theme.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        leading: IconButton(
          onPressed: () {
            navigatePop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: mainLightColor,
        ),
      ),
      body: Container(
        child: Text("search"),
      ),
    );
  }
}
