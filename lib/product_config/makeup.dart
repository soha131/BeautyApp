import 'package:beautyapp/product_config/makeup_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class MakeCubit extends Cubit<List<MakeupProduct>> {
  final Dio _dio = Dio();
  List<MakeupProduct> allProducts = [];

  MakeCubit() : super([]);

  Future<void> fetchMakeupProducts() async {
    try {
      final response = await _dio.get(
        'https://makeup-api.herokuapp.com/api/v1/products.json',
        queryParameters: {'brand': 'maybelline'},
      );
      final List<dynamic> data = response.data;
      allProducts = data.map((json) => MakeupProduct.fromJson(json)).toList();
      emit(allProducts);
    } catch (e) {
      print(e);
    }
  }

  void searchProducts(String query) {
    final results = allProducts.where((product) {
      final nameLower = product.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
    emit(results);
  }
}
