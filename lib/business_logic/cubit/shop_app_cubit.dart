import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shop_app_state.dart';

class ShopAppCubit extends Cubit<ShopAppState> {
  ShopAppCubit() : super(ShopAppInitial());
}
