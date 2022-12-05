import 'dart:convert';

class Garbage {
  final String? id;
  final String name;
  final double price;
  final String type;
  final String description;
  final String url;

  Garbage({
    this.id,
    required this.name,
    required this.price,
    required this.type,
    required this.description,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'type': type,
      'description': description,
      'id': id,
      'url': url
    };
  }

  factory Garbage.fromMap(Map<String, dynamic> map) {
    return Garbage(
      id: map['_id'],
      name: map['name'],
      price: double.parse(map['price'].toString()),
      type: map['type'],
      description: map['description'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Garbage.fromJson(String source) =>
      Garbage.fromMap(json.decode(source));

  Garbage copyWith({
    String? id,
    String? name,
    double? price,
    String? type,
    String? description,
    String? url,
  }) {
    return Garbage(
      name: name ?? this.name,
      id: id ?? this.id,
      price: price ?? this.price,
      type: type ?? this.type,
      description: description ?? this.description,
      url: url ?? this.url,
      //avatar: avatar ?? this.avatar,
    );
  }
}
