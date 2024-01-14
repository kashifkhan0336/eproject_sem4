import 'package:eproject_sem4/app/data/models/product.dart';
import 'package:eproject_sem4/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductService extends GetxService {
  final _supabaseClient = Get.find<SupabaseClient>();

  @override
  Future<void> onReady() async {
    final products = await _supabaseClient
    .from('watches')
    .select("id,watch_data->name")
    .withConverter(
      (products)=>products.map(Product.fromJson).toList()
    );
    print(products[0].name);
    super.onReady();
  }
}
