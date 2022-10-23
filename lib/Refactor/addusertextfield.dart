import 'package:flutter/material.dart';
import 'package:form1/theme.dart';

class Addusertextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final IconData prefixicon;
  final TextInputType? keyboardtype;

  const Addusertextfield({
    Key? key,
    required this.controller,
    required this.hintext,
    required this.prefixicon,
    this.keyboardtype,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 253, 253, 252),
            borderRadius: BorderRadius.circular(10)),
        height: 45,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          keyboardType: keyboardtype,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 7),
            isDense: true,
            prefixIcon: Icon(prefixicon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            hintText: hintext,
            hintStyle: regularTextStyle2,
          ),
        ),
      ),
    );
  }
}
