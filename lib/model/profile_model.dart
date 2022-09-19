import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String title;
  final String image;
  final int age;

  const Profile({required this.title, required this.image, required this.age});

  static Profile fromSnapShot(DocumentSnapshot snapshot) {
    Profile profile = Profile(
        title: snapshot['title'],
        image: snapshot['image'],
        age: snapshot['age']);
    return profile;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, image, age];
}
