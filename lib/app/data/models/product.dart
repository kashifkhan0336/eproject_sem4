class Product {
    int id;
    String name;

    Product({
        required this.id,
        required this.name,
    });

    Product copyWith({
        int? id,
        String? name,
    }) => 
        Product(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}