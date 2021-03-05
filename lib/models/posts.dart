import 'package:cloud_firestore/cloud_firestore.dart';

class Posts {
  String postId;
  String ownerId;
  String username;
  String mediaUrl;
  String description;
  String location;
  Timestamp timestamp;
  Likes likes;

  Posts(
      {this.postId,
      this.ownerId,
      this.username,
      this.mediaUrl,
      this.description,
      this.location,
      this.likes});

  Map<String, dynamic> toMap() {
    return {
      "postId": postId,
      "ownerId": ownerId,
      "username": username,
      "mediaUrl": mediaUrl,
      "description": description,
      "location": location,
      "timestamp": Timestamp.now(),
      // "likes": Likes.toMap(li),
    };
  }

  factory Posts.fromFirestore(Map<String, dynamic> firestore) {
    if (firestore == null) return null;

    return Posts(
        postId: firestore['postId'],
        ownerId: firestore['ownerId'],
        username: firestore['username'],
        mediaUrl: firestore['mediaUrl'],
        description: firestore['description'],
        location: firestore['location'],
        likes: Likes.fromFirestore(firestore['likes']));
  }
}

class Likes {
  String number;
  String userId;

  Likes({this.number, this.userId});

  Map<String, dynamic> toMap() {
    return {"number": number, "userId": userId};
  }

  factory Likes.fromFirestore(Map<String, dynamic> firestore) {
    if (firestore == null) return null;

    return Likes(
      number: firestore['number'],
      userId: firestore['userId'],
    );
  }
}
