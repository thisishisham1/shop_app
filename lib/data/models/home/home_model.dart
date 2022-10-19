class HomeModel {
  late bool status;
  late DataModel data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = DataModel.fromJson(json["data"]);
  }
}

class DataModel {
  List<BannersModel> banners = [];
  List<ProductsModel> products = [];

  DataModel.fromJson(Map<String, dynamic> json) {
    banners = List.from(json["banners"])
        .map((e) => BannersModel.fromJson(e))
        .toList();
    products = List.from(json["products"])
        .map((e) => ProductsModel.fromJson(e))
        .toList();
  }
}

class BannersModel {
  late int id;
  late String image;
  late Null category;
  late Null products;

  BannersModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    category = null;
    products = null;
  }
}

class ProductsModel {
  late int id;
  late dynamic? price;
  late dynamic? oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late bool inFavorites;
  late bool inCart;
  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    oldPrice = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    name = json["name"];
    inFavorites = json["in_favorites"];
    inCart = json["in_cart"];
  }
}
