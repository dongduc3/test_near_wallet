import 'dart:convert';

import 'package:assigment/model/near_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NearApi {
  NearModel? dataFromAPI;
  getData() async {
    try {
      String url = "https://wallet.testnet.near.org/login/?";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = NearModel.fromJson(json.decode(res.body));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
