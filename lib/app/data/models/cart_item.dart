// To parse this JSON data, do
//
//     final cartItem = cartItemFromJson(jsonString);

import 'dart:convert';

List<CartItem> cartItemFromJson(String str) => List<CartItem>.from(json.decode(str).map((x) => CartItem.fromJson(x)));

String cartItemToJson(List<CartItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItem {
    int? id;
    int? quantity;
    Watches? watches;

    CartItem({
        this.id,
        this.quantity,
        this.watches,
    });

    CartItem copyWith({
        int? id,
        int? quantity,
        Watches? watches,
    }) => 
        CartItem(
            id: id ?? this.id,
            quantity: quantity ?? this.quantity,
            watches: watches ?? this.watches,
        );

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        quantity: json["quantity"],
        watches: json["watches"] == null ? null : Watches.fromJson(json["watches"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "watches": watches?.toJson(),
    };
}

class Watches {
    int? id;
    String? name;
    String? price;
    List<dynamic>? specs;
    Brands? brands;
    List<Image>? images;
    String? description;

    Watches({
        this.id,
        this.name,
        this.price,
        this.specs,
        this.brands,
        this.images,
        this.description,
    });

    Watches copyWith({
        int? id,
        String? name,
        String? price,
        List<dynamic>? specs,
        Brands? brands,
        List<Image>? images,
        String? description,
    }) => 
        Watches(
            id: id ?? this.id,
            name: name ?? this.name,
            price: price ?? this.price,
            specs: specs ?? this.specs,
            brands: brands ?? this.brands,
            images: images ?? this.images,
            description: description ?? this.description,
        );

    factory Watches.fromJson(Map<String, dynamic> json) => Watches(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        specs: json["specs"] == null ? [] : List<dynamic>.from(json["specs"]!.map((x) => x)),
        brands: json["brands"] == null ? null : Brands.fromJson(json["brands"]),
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "specs": specs == null ? [] : List<dynamic>.from(specs!.map((x) => x)),
        "brands": brands?.toJson(),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "description": description,
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
