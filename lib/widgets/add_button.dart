import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key, required this.onPressed}) : super(key: key);
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {
            onPressed();
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
