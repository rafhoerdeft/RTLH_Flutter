import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class VersionService {
  Future<dynamic> cekVersion() async {
    try {
      String apiURL = "$api_rtlh/service/cekVersiApp";
      var apiResult = await http.get(
        apiURL,
        headers: requestHeader,
      );
      // final int statusCode = apiResult.statusCode;
      Map res = jsonDecode(apiResult.body);
      // print(jsonEncode(dataPost));
      // print('statusCode: ' + statusCode.toString());
      // print(res);
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
