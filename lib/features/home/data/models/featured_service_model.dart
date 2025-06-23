class FeaturedServiceModel {
  final int id;
  final String title;
  final String image;
  final int price;
  final int discountPrice;
  final double rating;
  final String category;
  final String? providerName;
  final String? providerImage;

  FeaturedServiceModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.discountPrice,
    required this.rating,
    required this.category,
    this.providerName,
    this.providerImage,
  });

  factory FeaturedServiceModel.fromJson(Map<String, dynamic> json) {
    final provider = json['provider'];
    final admin = json['admin'];

    return FeaturedServiceModel(
      id: json['id'],
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? 0,
      discountPrice: json['discount_price'] ?? 0,
      rating: double.tryParse(json['average_rating']?.toString() ?? '0.0') ?? 0.0,
      category: json['category']?['name'] ?? '',
      providerName: provider != null
          ? provider['full_name']
          : admin != null
          ? admin['name']
          : 'Unknown',
      providerImage: provider != null
          ? provider['image']
          : admin != null
          ? admin['image']
          : null,
    );
  }
}
