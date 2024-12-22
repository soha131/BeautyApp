import 'package:flutter/cupertino.dart';

class Makeup {
  final String brand;
  final String name;
  final double price;
  final String priceSign;
  final String imageLink;
  final String description;
  final double rating;
  final String category;
  final String product_type;

  Makeup({
    required this.brand,
    required this.name,
    required this.price,
    required this.priceSign,
    required this.imageLink,
    required this.description,
    required this.rating,
    required this.category,
    required this.product_type,
  });

  factory Makeup.fromJson(Map<String, dynamic> json) {
    return Makeup(
      brand: json['brand'],
      name: json['name'],
      price: (json['price'] != null) ? double.parse(json['price']) : 0.0,
      priceSign: json['price_sign'] ?? '',
      imageLink: json['image_link'],
      description: json['description'] ?? '',
      rating: (json['rating'] != null) ? json['rating'].toDouble() : 0.0,
      category: json['category'] ?? '',
      product_type: json['product_type'] ?? '',


    );
  }
}
