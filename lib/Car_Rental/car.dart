class Car {
  final int id;
  final String marque;
  final String name;
  final int price;
  final String imageUrl;

  Car({required this.id, required this.marque, required this.name, required this.price, required this.imageUrl});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      marque: json['marque'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}