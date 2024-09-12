import 'package:dummycommerce/model/rating_model.dart';

class Product {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  //constructor
  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  //converting json to dart object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: (json['price'] as num).toDouble(),
        description: json['description'],
        category: json['category'],
        image: json['image'] ?? '',
        rating: Rating.fromJson(json['rating']));
  }

  //dart to map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toJson(),
    };
  }
}
