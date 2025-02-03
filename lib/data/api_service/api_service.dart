import 'dart:convert';

import 'package:codeedex_task/data/shared.dart';
import 'package:codeedex_task/model/product_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  static Future<bool> loginUserAccount() async {
    try {
      String url = "https://prethewram.pythonanywhere.com/api/login/";
      Response response = await Dio().post(
        url,
        data: ({
          'email': "prithew.codeedex@gmail.com",
          'password': "12345",
        }),
      );
      if ((response.statusCode ?? 0) == 200) {
        Map<String, dynamic> responseDataMap = json.decode('$response');
        if (responseDataMap['status'] == true) {
          final pref = await Shared().loadPref();
          pref.setString('token', responseDataMap['token']);
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } on DioException catch (e, st) {
      return false;
    }
  }

  static Future<List<Product>> getProduct() async {
    String url = "https://prethewram.pythonanywhere.com/api/parts_categories/";
    final pref = await Shared().loadPref();
    String token = pref.getString('token') ?? "";
    try {
      Response response = await Dio().get(
        Uri.encodeFull(url),
        options: Options(
          headers: {
            'authorization': "Bearer $token",
          },
        ),
      );

      List<dynamic> jsonList = response.data;
      if (response.statusCode == 200) {
        final product =
            List<Product>.from(jsonList.map((x) => Product.fromJson(x)));
        return product;
      } else {
        return [];
      }
    } on DioException catch (e, st) {
      print(st);
      print(e.response?.data);
      return [];
    }
  }
  static Future<List<Product>> getProductDtl(int id) async {
    String url = "https://prethewram.pythonanywhere.com/api/parts_categories/$id";
    final pref = await Shared().loadPref();
    String token = pref.getString('token') ?? "";
    try {
      Response response = await Dio().get(
        Uri.encodeFull(url),
        options: Options(
          headers: {
            'authorization': "Bearer $token",
          },
        ),
      );
      Map<String, dynamic> jsonData = response.data;
      if (response.statusCode == 200) {
        final product = Product.fromJson(jsonData);
        return [product];
      } else {
        return [];
      }
    } on DioException catch (e, st) {
      print(st);
      print(e.response?.data);
      return [];
    }
  }
}
