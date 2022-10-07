class RegisterModel {
  late String name;
  late String email;
  late String image;
  late String password;
  late String phone;

   RegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    email = json['password'];
  }
}
