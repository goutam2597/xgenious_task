/// Model class representing a service category
class CategoryModel {
  final int id;
  final String name;
  final String image;

  /// Constructor for initializing the category model
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  /// Factory constructor to create a CategoryModel instance from a JSON map
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
