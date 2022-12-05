// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Schedule {
  final String user;
  final String? id;
  final int startDate;
  final int endDate;
  final String time;
  final String type;
  final String address;
  final String status;

  Schedule({
    required this.user,
    this.id,
    required this.time,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.address,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'id': id,
      'endDate': endDate,
      'startDate': startDate,
      'type': type,
      'time': time,
      'address': address,
      'status': status,
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      time: map['time'] as String,
      user: map['user'] as String,
      type: map['type'] as String,
      startDate: map['startDate'] as int,
      endDate: map['endDate'] as int,
      address: map['address'] as String,
      id: map['_id'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'User(name: $username, id: $id, phoneNumber: $phoneNumber , type: $type, address: $address )';
  // }

  // Schedule copyWith({
  //   String? name,
  //   String? id,
  //   String? phoneNumber,
  //   String? type,
  //   String? address,
  //   String? avatar,
  //   String? phone,
  // }) {
  //   return Schedule(
  //     username: name ?? username,
  //     id: id ?? this.id,
  //     phoneNumber: phoneNumber ?? this.phoneNumber,
  //     //avatar: avatar ?? this.avatar,
  //   );
  // }
}
