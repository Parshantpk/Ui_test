import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final String title;
  final String image;
  final String description;
  final bool buttonState;

  const Cat({
    required this.title,
    required this.image,
    required this.description,
    required this.buttonState,
  });

  static Cat fromSnapShot(DocumentSnapshot snapshot) {
    Cat cat = Cat(
        title: snapshot['title'],
        image: snapshot['image'],
        description: snapshot['description'],
        buttonState: snapshot['button_state'],
    );
    return cat;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, image, description, buttonState];
}
