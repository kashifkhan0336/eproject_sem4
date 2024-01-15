import 'dart:convert';

import 'package:eproject_sem4/app/data/models/product.dart';
import 'package:eproject_sem4/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductService extends GetxService {
  final _supabaseClient = Get.find<SupabaseClient>();
  Future<List<Product>> getProducts() async {
    List<Product> products = await _supabaseClient
        .from('watches')
        .select("id,watch_data->name")
        .withConverter((products) => products.map(Product.fromJson).toList());
    return products;
  }
  Future<Product> getProduct(int productId)async{
        final Product product = await _supabaseClient
        .from("watches")
        .select("id,watch_data->name")
        .eq("id",productId)
        .single()
        .withConverter<Product>((data) => Product.fromJson(data));
        return product;
  }
  @override
  Future<void> onReady() async {
    final product = await _supabaseClient
        .from("watches")
        .select("id,watch_data->name,watch_data->specs").limit(2);
    print(jsonEncode(product));
    super.onReady();
  }
}
