import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rtlh_app/shared/login_shared.dart';
import '../config/api_config.dart';

class ProfilService {
  Future<dynamic> infoDash(String kode_wil, String id_user) async {
    try {
      dynamic dataPost = {
        'kode_wil': kode_wil,
        'id_user': id_user,
      };

      String apiURL = "$api_rtlh/service/getInfoAksiUser";
      var apiResult = await http.post(
        apiURL,
        headers: requestHeader,
        body: jsonEncode(dataPost),
      );

      Map res = jsonDecode(apiResult.body);

      if (res['respon']) {
        return res['data'];
      } else {
        return false;
      }
    } catch (e) {
      print('Caught error: $e');
      return false;
    }
  }

  Future<dynamic> updateProfil(
      {String id_user,
      String nama_user,
      String username,
      String no_hp,
      String password}) async {
    try {
      dynamic dataPost = {
        'id_user': id_user,
        'nama_user': nama_user,
        'username': username,
        'no_hp': no_hp,
        'password': password,
      };

      String apiURL = "$api_rtlh/service/updateProfil";
      var apiResult = await http.post(
        apiURL,
        headers: requestHeader,
        body: jsonEncode(dataPost),
      );

      Map res = jsonDecode(apiResult.body);

      if (res['respon']) {
        setUpdateProfil(
            username: username, nama_user: nama_user, no_telp: no_hp);
        return true;
      } else {
        return res['data'];
      }
    } catch (e) {
      print('Caught error: $e');
      return false;
    }
  }
}
