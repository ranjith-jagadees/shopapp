import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    @required this.id,
    @required this.description,
    @required this.imageUrl,
    this.isFavourite = false,
    @required this.price,
    @required this.title,
  });

  Future<void> toggleFavourites() async {
    // bool oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    try {
      final url =
          'https://flutter-update-b4077.firebaseio.com/products/$id.jso';
      final response = await http.patch(url,
          body: json.encode({
            'isFavourite': isFavourite,
          }));
      if (response.statusCode >= 400) {
        isFavourite = !isFavourite;
        notifyListeners();
      }
    } catch (err) {
      isFavourite = !isFavourite;
      notifyListeners();
    }
  }
}
