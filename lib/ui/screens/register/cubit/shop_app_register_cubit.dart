import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/component/end_points.dart';
import 'package:shop_app/data/models/login/login_model.dart';
import 'package:shop_app/data/models/register/register_model.dart';

import '../../../../data/dio_helper/dio_helper.dart';

part 'shop_app_register_state.dart';

class ShopAppRegisterCubit extends Cubit<ShopAppRegisterState> {
  ShopAppRegisterCubit() : super(ShopAppRegisterInitial());

  static ShopAppRegisterCubit get(context) =>
      BlocProvider.of<ShopAppRegisterCubit>(context);

  bool registerPassword = true;

  late RegisterModel registerModel;

  void viewRegisterPassword() {
    registerPassword = !registerPassword;
    emit(ViewPassword());
  }

  void userRegister(
      {required String email,
      required String password,
      required String phone,
      required String name}) {
    emit(ShopAppRegisterLoading());
    DioHelper.postData(language: 'en', url: register, data: {
      'email': email,
      'password': password,
      'phone': phone,
      'name': name,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      emit(ShopAppRegisterSuccess(registerModel));
    }).catchError((e) {
      print(e);
      emit(ShopAppRegisterLoadingError(e.toString()));
    });
    print(email);
    print(password);
  }
}
