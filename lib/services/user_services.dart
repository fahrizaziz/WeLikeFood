part of 'services.dart';

// Note untuk semua method yang dari api
class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + 'login';

    var response = await client.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Coba kembali');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File pictureFile, http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    // Note: 'user dkk dari api atau backend'
    String url = baseURL + 'register';
    var response = await client.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'name': user.name,
          'email': user.email,
          'password': password,
          'password_confirmation': password,
          'address': user.address,
          'city': user.city,
          'houseNumber': user.houseNumber,
          'phoneNumber': user.phoneNumber
        }));
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Coba kembali');
    }
    var data = jsonDecode(response.body);
    // Note code 37 kembalian dari api backend
    User.token = data['data']['access_token'];
    // Note code 39 nilai yang dikembalikan sesuai dari backend api
    User value = User.fromJson(data['data']['user']);

    // todo: Upload Profile Picture
    // Note: if pertama untuk cek profilepicture kalau ga kosong
    if (pictureFile != null) {
      // Note Code 52 untuk mengecek kembalian dari upload picturepath
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
      // Note if kedua untuk mengecek hasil dari kembalian dari upload picturepath
      if (result.value != null) {
        // Note code menganti valu lalu menyimpan ke link storage
        value = value.copyWith(
            picturePath:
                "http://foodmarket-backend.buildwithangga.id/storage/" +
                    result.value);
      }
    }

    // Note code 43 mengembalikan apireturnvalue ke variable value
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest request}) async {
    String url = baseURL + 'user/photo';
    var uri = Uri.parse(url);
    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = "Bearer ${User.token}";
    }
    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);
      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: "Gagal Upload Foto");
    }
  }
}
