import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkingHelper {
  final Uri uri;

  NetworkingHelper(this.uri);

  Future<dynamic> getNetworkData() async {
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw HttpException('Responded with ${response.statusCode}', uri: uri);
    }
  }
}
