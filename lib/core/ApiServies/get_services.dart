import 'package:dio/dio.dart';
import 'package:shopex/core/Constant/constant.dart';
import 'package:shopex/core/Model/product_model.dart';

class ApiServies {
  var dio = new Dio();

  Future<List<ProductModel>?> getProduct() async {
    var response = await dio.get(AllUri().getProduct);
    print('$response');

    if (response.statusCode == 200) {
      try {
        List<ProductModel> service = ProductModel.fromJsonList(response.data);
        return service;
      } catch (e) {}
    } else {
      return null;
    }
  }
}
