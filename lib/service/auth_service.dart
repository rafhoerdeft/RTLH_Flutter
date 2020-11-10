import 'dart:convert';
// import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get_ip/get_ip.dart';
import 'package:http/http.dart' as http;
// import 'package:http/io_client.dart';
import 'package:latihan_bloc/config/api_config.dart';
import 'package:latihan_bloc/shared/login_shared.dart';

class AuthService {
  Future<dynamic> signIn(String username, String password) async {
    try {
      dynamic ipAdd = await this.getIpAdd();

      dynamic dataPost = {
        'username': username,
        'password': password,
        'ipaddress': ipAdd.toString(),
      };
      // final ioc = new HttpClient();
      // ioc.badCertificateCallback =
      //     (X509Certificate cert, String host, int port) => true;
      // final http = new IOClient(ioc);
      String apiURL = "$api_rtlh/simpkp/service/signIn";
      var apiResult = await http.post(
        apiURL,
        headers: requestHeader,
        body: jsonEncode(dataPost),
      );
      // final int statusCode = apiResult.statusCode;
      Map res = jsonDecode(apiResult.body);
      // print(jsonEncode(dataPost));
      // print('statusCode: ' + statusCode.toString());
      // print(res);
      if (res['respon']) {
        saveLogin(res['data']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Caught error: $e');
      return false;
    }
  }

  Future<String> getIpAdd() async {
    String ipAddress;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      ipAddress = await GetIp.ipAddress;
    } on PlatformException {
      ipAddress = '00.00.00.00';
    }

    return ipAddress;
  }
}
