import 'package:get/get.dart';
import '../config/routes/router_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveLogin(dynamic data) async {
  SharedPreferences log = await SharedPreferences.getInstance();

  log.setBool("status", true);
  log.setString("id_user", data['id_user']);
  log.setString("username", data['username']);
  log.setString("kode_wil", data['kode_wil']);
  log.setString("nama_desa", data['desa']);
  log.setString("nama_kecamatan", data['kecamatan']);
  log.setString("nama_user", data['nama_user']);
  log.setString("alamat", data['alamat']);
  log.setString("no_telp", data['no_telp']);
  log.setString("role", data['role']);
}

void logout() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  log.setBool("status", false);
  log.setString("id_user", '');
  log.setString("username", '');
  log.setString("kode_wil", '');
  log.setString("nama_desa", '');
  log.setString("nama_kecamatan", '');
  log.setString("nama_user", '');
  log.setString("alamat", '');
  log.setString("no_telp", '');
  log.setString("role", '');

  Get.offAllNamed(LoginRoute);
}

void setUpdateProfil(
    {String nama_user, String username, String no_telp}) async {
  SharedPreferences log = await SharedPreferences.getInstance();
  log.setString("nama_user", nama_user);
  log.setString("username", username);
  log.setString("no_telp", no_telp);
}

Future<bool> getStatus() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getBool("status") ?? false;
}

Future<String> getIdUser() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getString("id_user") ?? "";
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

Future<String> getDesa() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getString("nama_desa") ?? "";
}

Future<String> getKecamatan() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getString("nama_kecamatan") ?? "";
}

Future<String> getTelp() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getString("no_telp") ?? "";
}

Future<String> getRole() async {
  SharedPreferences log = await SharedPreferences.getInstance();

  return log.getString("role") ?? "";
}
