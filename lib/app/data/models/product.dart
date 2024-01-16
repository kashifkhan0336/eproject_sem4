// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    int? id;
    String? name;
    Brands? brands;
    String? price;
    String? description;
    List<dynamic>? specs;
    List<Image>? images;

    Product({
        this.id,
        this.name,
        this.brands,
        this.price,
        this.description,
        this.specs,
        this.images,
    });

    Product copyWith({
        int? id,
        String? name,
        Brands? brands,
        String? price,
        String? description,
        List<dynamic>? specs,
        List<Image>? images,
    }) => 
        Product(
            id: id ?? this.id,
            name: name ?? this.name,
            brands: brands ?? this.brands,
            price: price ?? this.price,
            description: description ?? this.description,
            specs: specs ?? this.specs,
            images: images ?? this.images,
        );

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        brands: json["brands"] == null ? null : Brands.fromJson(json["brands"]),
        price: json["price"],
        description: json["description"],
        specs: json["specs"] == null ? [] : List<dynamic>.from(json["specs"]!.map((x) => x)),
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brands": brands?.toJson(),
        "price": price,
        "description": description,
        "specs": specs == null ? [] : List<dynamic>.from(specs!.map((x) => x)),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
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
