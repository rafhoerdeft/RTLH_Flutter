import 'package:get/get.dart';
import '../config/routes/router_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveLogin(dynamic data) async {
  SharedPreferences log = await SharedPreferences.getInstance();

  log.setBool("status", true);
  log.setString("username", data['username']);
  log.setString("kode_wil", data['kode_wil']);
  log.setString("nama_user", data['nama_user']);
  log.setString("alamat", data['alamat']);
  log.setString("no_telp", data['no_telp']);
  log.setString("role", data['role']);
}

void logout() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  log.setBool("status", false);
  log.setString("username", '');
  log.setString("kode_wil", '');
  log.setString("nama_user", '');
  log.setString("alamat", '');
  log.setString("no_telp", '');
  log.setString("role", '');

  Get.offAllNamed(LoginRoute);
}

Future<bool> getStatus() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getBool("status") ?? false;
}

Future<String> getUsername() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getString("username") ?? "";
}

Future<String> getAlamat() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getString("alamat") ?? "";
}

Future<String> getNamaUser() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getString("nama_user") ?? "";
}

Future<String> getKodeWil() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getString("kode_wil") ?? "";
}

Future<String> getTelp() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getString("no_telp") ?? "";
}

Future<String> getRole() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getString("role") ?? "";
}
