import 'dart:convert';

import 'package:ecommerce_produict_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {
  // recuperer les informations des produits
  static Future getProductsData() async {
    try {
      final url = Uri.parse(Constants.product_api_url);
      Response response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      print("error in product: $e");
    }
  }

  // recuperer les profiles utilisateurs

  static Future getUserData() async {
    try {
      var url = Uri.parse(Constants.user_api_url);
      Response response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return data;
      }
    } catch (e) {
      print("error in user: $e");
    }
  }
}
