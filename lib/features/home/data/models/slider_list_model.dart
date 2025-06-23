class SliderListModel {
  final int id;
  final String image;

  SliderListModel({required this.id, required this.image});

  factory SliderListModel.fromJson(Map<String, dynamic> json) {
    return SliderListModel(id: json['id'], image: json['image'] ?? '');
  }
}
