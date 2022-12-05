// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String username;
  final String id;
  final String phoneNumber;
  //final String avatar;

  User({
    required this.username,
    required this.id,
    required this.phoneNumber,
    //required this.avatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'id': id,
      'phoneNumber': phoneNumber,
      //'avatar': avatar,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      id: map['id'] as String,
      phoneNumber: map['phoneNumber'] as String,
      //avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'User(name: $username, id: $id, phoneNumber: $phoneNumber , type: $type, address: $address )';
  // }

  User copyWith({
    String? name,
    String? id,
    String? phoneNumber,
    String? type,
    String? address,
    String? avatar,
    String? phone,
  }) {
    return User(
      username: name ?? username,
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      //avatar: avatar ?? this.avatar,
    );
  }
}
