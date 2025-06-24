import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../features/home/data/models/category_model.dart';
import '../features/home/data/models/featured_service_model.dart';
import '../features/home/data/models/service_provider_model.dart';
import '../features/home/data/models/slider_list_model.dart';

/// A controller for managing all home-related API requests and storing

class NetworkController extends GetxController {
  final String _baseUrl = 'https://prohandy.xgenious.com/api/v1/';

  /// Observable lists to hold fetched data from the API
  var sliders = <SliderListModel>[].obs;
  var categories = <CategoryModel>[].obs;
  var featuredServices = <FeaturedServiceModel>[].obs;
  var providers = <ServiceProviderModel>[].obs;

  @override
  void onInit() {
    fetchSliders();
    fetchCategories();
    fetchFeaturedServices();
    fetchProviders();
    super.onInit();
  }

  /// Fetches slider images from the API and updates [sliders]
  void fetchSliders() async {
    final res = await http.get(Uri.parse('${_baseUrl}slider-lists'));
    if (res.statusCode == 200) {
      sliders.value = (jsonDecode(res.body)['sliders'] as List)
          .map((e) => SliderListModel.fromJson(e))
          .toList();
    }
  }

  /// Fetches service categories from the API and updates [categories]
  void fetchCategories() async {
    final res = await http.get(Uri.parse('${_baseUrl}categories'));
    if (res.statusCode == 200) {
      categories.value = (jsonDecode(res.body)['categories'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    }
  }

  /// Fetches featured services from the API and updates [featuredServices]
  void fetchFeaturedServices() async {
    final res = await http.get(Uri.parse('${_baseUrl}service/featured'));
    if (res.statusCode == 200) {
      featuredServices.value = (jsonDecode(res.body)['all_services'] as List)
          .map((e) => FeaturedServiceModel.fromJson(e))
          .toList();
    }
  }

  /// Fetches service providers from the API and updates [providers]
  void fetchProviders() async {
    final res = await http.get(Uri.parse('${_baseUrl}provider-lists'));
    if (res.statusCode == 200) {
      providers.value = (jsonDecode(res.body)['provider_lists'] as List)
          .map((e) => ServiceProviderModel.fromJson(e))
          .toList();
    }
  }
}
