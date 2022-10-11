import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:shop_app/business_logic/cubit/shop_app_cubit.dart';
import 'package:shop_app/style/theme.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);
  static String routeName = "layout";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopAppCubit(),
      child: BlocConsumer<ShopAppCubit, ShopAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var layoutCubit = ShopAppCubit.get(context);
          int index = layoutCubit.currentIndex;
          return Scaffold(
            appBar: AppBar(
              title: Text("Shop hub"),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: layoutCubit.navigateItem,
              currentIndex: index,
              onTap: layoutCubit.screenView,
            ),
            body: layoutCubit.screen[index],
          );
        },
      ),
    );
  }
}
