import 'package:flutter/material.dart';

class ProfileUpdate extends StatelessWidget {
  final String text1;
  final String text2;
  const ProfileUpdate({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20),
      child: ListTile(
          shape: RoundedRectangleBorder(
              // side: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 19),
          tileColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text1,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(text2),
            ],
          )),
    );
  }
}
