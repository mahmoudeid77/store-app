import 'package:flutter_application_1/product/product.model.dart';
import 'package:http/http.dart' as http; 
import 'dart:convert';
class GetProductByCategoryService{
  Future <List<dynamic>> getProductByCategory(String category) async {

    http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products/category/$category'));
    List<dynamic> data = jsonDecode(response.body);
    List<Product> productList = [];
    for(int i =0;i<data.length;i++){
      productList.add(Product.fromJson(data[i]));
    }
    return data;
  }
}