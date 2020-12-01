import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class RtlhService {
  Future<dynamic> listRtlh(String kode_wil, int limit, int offset) async {
    try {
      dynamic dataPost = {
        'kode_wil': kode_wil,
        'limit': limit,
        'offset': offset
      };

      String apiURL = "$api_rtlh/simpkp/service/getListRtlh";
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

  Future<dynamic> lastUpdate(String kode_wil) async {
    try {
      dynamic dataPost = {
        'kode_wil': kode_wil,
      };

      String apiURL = "$api_rtlh/simpkp/service/getLastUpdate";
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
}
