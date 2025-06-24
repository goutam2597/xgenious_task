import 'category_model.dart';

///A Model class representing a service provider with profile info,

class ServiceProviderModel {
  final int id;
  final String name;
  final String? image;
  final int completedOrders;
  final double rating;
  final List<CategoryModel> serviceCategories;

  /// Constructor for initializing a ServiceProviderModel instance
  ServiceProviderModel({
    required this.id,
    required this.name,
    this.image,
    required this.completedOrders,
    required this.rating,
    required this.serviceCategories,
  });

  /// Factory constructor to create a ServiceProviderModel from JSON data
  factory ServiceProviderModel.fromJson(Map<String, dynamic> json) {
    return ServiceProviderModel(
      id: json['id'] ?? 0,
      name: json['full_name'] ?? '',
      image: json['image'],
      completedOrders:
      int.tryParse(json['total_service_order_completed']?.toString() ?? '0') ?? 0,
      rating:
      double.tryParse(json['average_rating']?.toString() ?? '0.0') ?? 0.0,
      serviceCategories: (json['service_categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e))
          .toList() ??
          [],
    );
  }
}
