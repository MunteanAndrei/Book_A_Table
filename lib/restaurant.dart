// restaurant.dart
class Restaurant {
  final String name;
  final String cuisine;
  final String address;
  final String? backgroundImage;

  Restaurant({
    required this.name,
    required this.cuisine,
    required this.address,
    this.backgroundImage,
  });
}
  