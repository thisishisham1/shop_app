import 'package:shop_app/data/models/home/home_model.dart';

class CategoriesModel {
  late bool status;
  late DataCategoriesModel data;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = DataCategoriesModel.fromJson(json['data']);
  }
}

class DataCategoriesModel {
  late int currentPage;
  List<DataModel> categoriesData = [];

  DataCategoriesModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    categoriesData =
        List.from(json["data"]).map((e) => DataModel.fromJson(e)).toList();
  }
}

class DataModel {
  late int id;
  late String name;
  late String image;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json["image"];
  }
}
