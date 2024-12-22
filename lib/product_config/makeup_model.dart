
class MakeupProduct {
  final String brand;
  final String name;
  final String price;
  final String priceSign;
  final String imageLink;
  final String description;
  final double rating;
  final String category;

  MakeupProduct({
    required this.brand,
    required this.name,
    required this.price,
    required this.priceSign,
    required this.imageLink,
    required this.description,
    required this.rating,
    required this.category,
  });

  factory MakeupProduct.fromJson(Map<String, dynamic> json) {
    return MakeupProduct(
      brand: json['brand'],
      name: json['name'],
      price: json['price'],
      priceSign: json['price_sign'] ?? '',
      imageLink: json['image_link'],
      description: json['description'] ?? '',
      rating: (json['rating'] != null) ? json['rating'].toDouble() : 0.0,
      category: json['category'] ?? '',
    );
  }
}
