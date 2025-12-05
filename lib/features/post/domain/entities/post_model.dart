import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String userId;
  final String userName;
  final String text;
  final String imageUrl;
  final DateTime timeStamp;

  PostModel({
    required this.id,
    required this.text,
    required this.timeStamp,
    required this.userId,
    required this.userName,
    required this.imageUrl,
  });

  PostModel copyWith({String? imageUrl, String? text}) {
    return PostModel(
      id: id,
      text: text ?? this.text,
      timeStamp: timeStamp,
      userId: userId,
      userName: userName,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  //conversion to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      "userName": userName,
      "text": text,
      "imageUrl": imageUrl,
      "timeStamp": Timestamp.fromDate(timeStamp),
    };
  }

  //convert to map
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      userName: json['userName'],
      text: json['text'],
      timeStamp: (json['timeStamp'] as Timestamp).toDate(),
      imageUrl: json['imageUrl'],
    );
  }
}
