import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loginDesign/auth/firestore.dart';
import 'package:loginDesign/models/posts.dart';
import 'package:uuid/uuid.dart';

class UploadService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  createPostInFirestore(
      {String username,
      String uid,
      String mediaUrl,
      String location,
      String description}) {

    FireStoreServices().fetchUser(uid).then((value) {
      username = value.username;
    });
    var postId = Uuid().v4();
    var likes = Likes(number: "1", userId: uid);
    var post = Posts(
        postId: postId,
        ownerId: uid,
        description: description,
        username: username,
        mediaUrl: mediaUrl,
        location: location,
        likes: likes);

    _db
        .collection('user')
        .doc(uid)
        .collection("userPosts")
        .doc(postId)
        .set(post.toMap());
  }

  Future<String> getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    var coordinates = Coordinates(position.latitude, position.longitude);
    var placemarks =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var placemark = placemarks[0];
    // String completeAddress =
    //     '${placemark.subThoroughfare} ${placemark.thoroughfare}, ${placemark.subLocality} ${placemark.locality}, ${placemark.subAdminArea}, ${placemark.adminArea} ${placemark.postalCode}, ${placemark.countryName}';
    String formattedAddress = "${placemark.locality}, ${placemark.countryName}";
    return formattedAddress;
  }
}
