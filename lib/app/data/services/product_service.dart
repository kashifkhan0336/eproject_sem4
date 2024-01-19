import 'dart:convert';

import 'package:eproject_sem4/app/data/models/product.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductService extends GetxService {
  final _supabaseClient = Get.find<SupabaseClient>();
  Future<List<Product>> getProducts({int limit = 8}) async {
    List<Product> products = await _supabaseClient
        .from('watches')
        .select(
            "id,watch_data->name,watch_data->price,watch_data->description,watch_data->description,watch_data->specs,brands (name)")
        .limit(limit)
        .withConverter((products) => products.map(Product.fromJson).toList());
    return products;
  }

  Future<Product> getProduct(int productId) async {
    final Product product = await _supabaseClient
        .from("watches")
        .select(
            "id,watch_data->name,watch_data->price,watch_data->description,watch_data->description,watch_data->specs,brands (name)")
        .eq("id", productId)
        .single()
        .withConverter<Product>((data) => Product.fromJson(data));
    return product;
  }

  @override
  Future<void> onReady() async {
    List<ProductExample> products = await _supabaseClient
        .from("watches")
        .select(
            "id,watch_data->name,watch_data->price,watch_data->description,watch_data->description,watch_data->specs,brands (name)")
        .withConverter((data) => data.map(ProductExample.fromJson).toList());
    print(jsonEncode(products[0].brands));
    super.onReady();
  }
}
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

// To parse this JSON data, do
//
//     final productExample = productExampleFromJson(jsonString);
// To parse this JSON data, do
//
//     final productExample = productExampleFromJson(jsonString);

List<ProductExample> productExampleFromJson(String str) =>
    List<ProductExample>.from(
        json.decode(str).map((x) => ProductExample.fromJson(x)));

String productExampleToJson(List<ProductExample> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductExample {
  int? id;
  String? name;
  Brands? brands;
  String? price;
  String? description;
  List<dynamic>? specs;
  List<Image>? images;

  ProductExample({
    this.id,
    this.name,
    this.brands,
    this.price,
    this.description,
    this.specs,
    this.images,
  });

  ProductExample copyWith({
    int? id,
    String? name,
    Brands? brands,
    String? price,
    String? description,
    List<dynamic>? specs,
    List<Image>? images,
  }) =>
      ProductExample(
        id: id ?? this.id,
        name: name ?? this.name,
        brands: brands ?? this.brands,
        price: price ?? this.price,
        description: description ?? this.description,
        specs: specs ?? this.specs,
        images: images ?? this.images,
      );

  factory ProductExample.fromJson(Map<String, dynamic> json) => ProductExample(
        id: json["id"],
        name: json["name"],
        brands: json["brands"] == null ? null : Brands.fromJson(json["brands"]),
        price: json["price"],
        description: json["description"],
        specs: json["specs"] == null
            ? []
            : List<dynamic>.from(json["specs"]!.map((x) => x)),
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brands": brands?.toJson(),
        "price": price,
        "description": description,
        "specs": specs == null ? [] : List<dynamic>.from(specs!.map((x) => x)),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class Brands {
  String? name;

  Brands({
    this.name,
  });

  Brands copyWith({
    String? name,
  }) =>
      Brands(
        name: name ?? this.name,
      );

  factory Brands.fromJson(Map<String, dynamic> json) => Brands(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Image {
  String? src;

  Image({
    this.src,
  });

  Image copyWith({
    String? src,
  }) =>
      Image(
        src: src ?? this.src,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        src: json["src"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
      };
}
