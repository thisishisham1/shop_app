import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/cache_helper/chache_data.dart';
import 'package:shop_app/data/dio_helper/dio_helper.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/style/theme.dart';
import 'package:shop_app/ui/screens/login/login.dart';
import 'package:shop_app/ui/screens/on_boarding/on_boarding.dart';
import 'package:shop_app/ui/screens/register/register.dart';
import 'data/bloc_observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheData.init();
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      routes: routes,
      initialRoute: Register.routeName,
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}
