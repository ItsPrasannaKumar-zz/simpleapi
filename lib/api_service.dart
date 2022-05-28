import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:simpleapi/Models/product_model.dart';
import 'package:simpleapi/app_constants.dart';
import 'package:simpleapi/user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<dynamic> post() async {
    var uri = Uri.parse(
        'http://goskillindia.com/Shahanejwellers/Api/GetGoldProducts.php');
    try {
      var response = await http.post(uri, headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        ProductModel _product = productModelFromJson(response.body);
        return _product;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
