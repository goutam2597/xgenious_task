/// Model class representing a single slider item,
class SliderListModel {
  final int id;
  final String image;

  /// Constructor for initializing a SliderListModel instance
  SliderListModel({required this.id, required this.image});

  /// Factory constructor to create a SliderListModel from JSON data
  factory SliderListModel.fromJson(Map<String, dynamic> json) {
    return SliderListModel(id: json['id'], image: json['image'] ?? '');
  }
}
