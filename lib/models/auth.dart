part of 'models.dart';

class Auth {
  String name;
  String email;
  String password;
  String phoneNumber;
  String address;
  String houseNumber;
  String city;
  File photo;

  Auth({
    this.name = "",
    this.email = "",
    this.password = "",
    this.phoneNumber = "",
    this.address = "",
    this.houseNumber = "",
    this.city = "",
    this.photo,
  });
}
