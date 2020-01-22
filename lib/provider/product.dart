import 'package:flutter/foundation.dart';

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

<<<<<<< HEAD
  Future<void> toggleFavourites(String authToken) async {
    // bool oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    try {
      final url =
          'https://flutter-update-b4077.firebaseio.com/products/$id.json?auth=$authToken';
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
=======
  void toggleFavourites() {
    isFavourite = !isFavourite;
    notifyListeners();
>>>>>>> f38b17c755c5a3b1add419838cb3f0529e431b3f
  }
}
