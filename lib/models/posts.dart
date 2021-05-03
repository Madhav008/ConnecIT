import 'package:cloud_firestore/cloud_firestore.dart';

class Posts {
  String postId;
  String ownerId;
  String username;
  String mediaUrl;
  String description;
  String location;
  Timestamp timestamp;
  dynamic likes;

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
      "likes": getLikeCount(likes),
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
        likes: firestore['likes']);
  }

}
  int getLikeCount(likes) {
    // if no likes, return 0
    if (likes == null) {
      return 0;
    }
    int count = 0;
    // if the key is explicitly set to true, add a like
    likes.value.forEach((val) {
      if (val == true) {
        count += 1;
      }
    });
    return count;
  }
