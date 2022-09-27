import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'shop_app_state.dart';

class ShopAppCubit extends Cubit<ShopAppState> {
  ShopAppCubit() : super(ShopAppInitial());

  static ShopAppState get(context)=>BlocProvider.of(context);

   void viewPassword(bool view){
    view=!view;
    emit(ViewPassword());
  }
}
