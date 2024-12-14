import 'package:flutter/material.dart';
import 'package:flutter_application_exam/model/product_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  bool isLoading = false;

  List<ProductModel> listofProducts = [];
  Future<void> getAllProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://api.restful-api.dev/objects");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        listofProducts = productModelFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
