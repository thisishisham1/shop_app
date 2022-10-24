import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/business_logic/cubit/shop_app_cubit.dart';
import 'package:shop_app/data/cache_helper/chache_data.dart';
import 'package:shop_app/data/dio_helper/dio_helper.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/style/theme.dart';
import 'package:shop_app/ui/layout/layout.dart';
import 'package:shop_app/ui/screens/login/cubit/shop_app_login_cubit.dart';
import 'package:shop_app/ui/screens/login/login.dart';
import 'package:shop_app/ui/screens/on_boarding/on_boarding.dart';
import 'package:shop_app/ui/screens/register/cubit/shop_app_register_cubit.dart';
import 'component/constant.dart';
import 'data/bloc_observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheData.init();
  Widget widget;
  bool? onBoarding = CacheData.getData(key: "onBoarding");
  token = CacheData.getData(key: "Token");
  if (onBoarding != null) {
    if (token != null) {
      widget = Layout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoarding();
  }
  runApp(DevicePreview(builder: (context) => MyApp(startApp: widget)));
}

class MyApp extends StatelessWidget {
  final Widget startApp;

  MyApp({required this.startApp});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ShopAppCubit()
              ..getProductData()
              ..getCategories()),
        BlocProvider(create: (context) => ShopAppLoginCubit()),
        BlocProvider(create: (context) => ShopAppRegisterCubit()),
      ],
      child: BlocConsumer<ShopAppCubit, ShopAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
              theme: lightTheme,
              routes: routes,
              debugShowCheckedModeBanner: false,
              home: startApp);
        },
      ),
    );
  }
}
