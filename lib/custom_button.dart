import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

class CustomButton extends StatefulWidget {
  CustomButton({
    Key? key,
    required this.showAddButton,
    required this.title,
    required this.image,
    required this.description,
    required this.docId,
  }) : super(key: key);
  bool showAddButton;
  String title, description, image, docId;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late bool button_state;
  final CollectionReference _featured =
      FirebaseFirestore.instance.collection('featured');
  final CollectionReference _cats =
      FirebaseFirestore.instance.collection('cats');
  final CollectionReference _myCats =
      FirebaseFirestore.instance.collection('mycats');

  @override
  Widget build(BuildContext context) {
    if (widget.showAddButton == false) {
      return Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFE0E0E0).withOpacity(0.0),
                const Color(0xFFE0E0E0).withOpacity(1.0),
              ],
            ),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () async {
              await _myCats.doc(widget.docId).delete();
              await _cats.doc(widget.docId).update({'button_state': true});
              button_state = await _cats.doc(widget.docId).get().then(
                  (DocumentSnapshot documentSnapshot) =>
                      documentSnapshot['button_state']);
              log(button_state.toString());
              setState(() {
                log('false set state called');
                widget.showAddButton = button_state;
              });
            },
            child: const Text(
              'Remove',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.0, 1.0],
            colors: [
              Color(0xFFFFAB91),
              Color(0xFFFF6F43),
            ],
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () async {
            String myCatId, catId;
            var catIdFinal;
            myCatId = _myCats.doc(widget.docId).toString();
            catId = _cats.doc(widget.docId).toString();
            catIdFinal =  catId.substring(catId.length-21,catId.length-1);
            log(catId);
            log(catIdFinal);
            log(myCatId);
            await _cats.doc(widget.docId).update({'button_state': false});
            await _myCats.doc(catIdFinal).set({
              'title': widget.title,
              'description': widget.description,
              'image': widget.image,
              'button_state': false
            });
            // await _myCats.add({
            //   'title': widget.title,
            //   'description': widget.description,
            //   'image': widget.image,
            //   'button_state': false
            // });
            button_state = await _myCats.doc(widget.docId).get().then(
                (DocumentSnapshot documentSnapshot) =>
                    documentSnapshot['button_state']);
            setState(() {
              widget.showAddButton = button_state;
            });
          },
          child: const Text(
            'Add',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
