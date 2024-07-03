import 'dart:convert';

import 'package:flutter_application_1/product/product.model.dart';
import 'package:http/http.dart' as http;

class AllProductsServices {
  Future<List<Product>> getAllProducts() async {
    http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
  List<dynamic> data =jsonDecode(response.body);
  List <Product> productList =[];
  for(int i=0;i<data.length;i++){
    productList.add(Product.fromJson(data[i]));
  
  } 
  return productList;
}
else {
  throw Exception('Failed to load products ${response.statusCode}');
}
    // Rest of your code
  }
}