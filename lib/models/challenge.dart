// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Challenge {
  final String title;
  final String description;
  final int startTime;
  final int endTime;
  final List<String> images;
  final int maximumParticipants;
  // final int currentPaticipants;
  final String? id;
  final String address;
  final String userId;

  Challenge({
    required this.title,
    required this.description,
    required this.startTime,
    required this.images,
    required this.endTime,
    required this.maximumParticipants,
    // required this.currentPaticipants,
    this.id,
    required this.address,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'startTime': startTime,
      'endTime': endTime,
      'images': images,
      'maximumParticipants': maximumParticipants,
      '_id': id,
      'address': address,
      'user_id': userId,
    };
  }

  factory Challenge.fromMap(Map<String, dynamic> map) {
    return Challenge(
      title: map['title'] as String,
      description: map['description'] as String,
      startTime: map['startTime'] as int,
      endTime: map['endTime'] as int,
      id: map['_id'] as String,
      maximumParticipants: map['maximumParticipants'] as int,
      images: List<String>.from(map['images']),
      address: map['address'] as String,
      userId: map['user_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Challenge.fromJson(String source) =>
      Challenge.fromMap(json.decode(source));

  Challenge copyWith({
    String? title,
    String? description,
    int? startTime,
    int? endTime,
    List<String>? images,
    int? maximumParticipants,
    String? userId,
    String? address,
  }) {
    return Challenge(
      description: description ?? this.description,
      title: title ?? this.title,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      images: images ?? this.images,
      maximumParticipants: maximumParticipants ?? this.maximumParticipants,
      address: address ?? this.address,
      userId: userId ?? this.userId,
    );
  }
}
