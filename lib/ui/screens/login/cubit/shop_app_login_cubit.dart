import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/data/dio_helper/dio_helper.dart';
import '../../../../component/end_points.dart';
import '../../../../data/models/login/login_model.dart';

part 'shop_app_login_state.dart';

class ShopAppLoginCubit extends Cubit<ShopAppLoginState> {
  ShopAppLoginCubit() : super(ShopAppLoginInitial());

  bool rememberEmail = false;
  bool loginPassword = true;

  late LoginModel loginModel;

  static ShopAppLoginCubit get(context) =>
      BlocProvider.of<ShopAppLoginCubit>(context);

  void viewLoginPassword() {
    loginPassword = !loginPassword;
    emit(ViewPassword());
  }

  void rememberMe(bool value) {
    rememberEmail = value;
    emit(RememberMe());
  }

  void userLogin({required String email, required String password}) {
    emit(ShopAppLoginLoadingState());
    DioHelper.postData(language: 'en', url: login, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(ShopAppLoginSuccessState(loginModel));
    }).catchError((e) {
      print(e);
      emit(ShopAppLoginErrorState(e.toString()));
    });
  }
}
