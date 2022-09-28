import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'shop_app_state.dart';

class ShopAppCubit extends Cubit<ShopAppState> {
  ShopAppCubit() : super(ShopAppInitial());
  bool rememberEmail = false;

  bool loginPassword = true;

  bool registerPassword = true;

  static ShopAppCubit get(context) => BlocProvider.of<ShopAppCubit>(context);

  void viewLoginPassword() {
    loginPassword = !loginPassword;
    emit(ViewPassword());
  }

  void viewRegisterPassword() {
    registerPassword = !registerPassword;
    emit(ViewPassword());
  }

  void rememberMe(bool value) {
    rememberEmail = value;
    emit(RememberMe());
  }
}
