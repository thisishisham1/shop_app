import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubit/shop_app_cubit.dart';
import 'package:shop_app/component/constant.dart';
import 'package:shop_app/ui/screens/search/search.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);
  static String routeName = "layout";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopAppCubit()..getProductData(),
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
                    onPressed: () {
                      navigatePush(context, Search());
                    },
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
              showUnselectedLabels: true,
            ),
            body: layoutCubit.screen[index],
          );
        },
      ),
    );
  }
}
