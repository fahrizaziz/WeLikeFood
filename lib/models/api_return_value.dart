part of 'models.dart';

// Note value untuk berhasil ambil data dari api
class ApiReturnValue<T> {
  final T value;
  final String message;

  ApiReturnValue({this.message, this.value});
}
