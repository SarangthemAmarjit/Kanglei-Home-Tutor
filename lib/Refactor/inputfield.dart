import 'package:flutter/material.dart';

class Namefield extends StatelessWidget {
  final TextEditingController usercon;
  Namefield({Key? key, required this.usercon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: TextFormField(
          controller: usercon,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.black),
              icon: const Icon(
                Icons.person,
                color: Colors.blue,
              )),
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Name is required';
            }
            if (!RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                .hasMatch(value)) {
              return "Please Enter a Valid Name";
            }
          }),
    );
  }
}

class Emailfield extends StatelessWidget {
  final TextEditingController emailcon;
  const Emailfield({Key? key, required this.emailcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: emailcon,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            labelText: 'Email',
            labelStyle: const TextStyle(color: Colors.black),
            icon: const Icon(
              Icons.mail,
              color: Colors.red,
            )),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required';
          }
          if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value)) {
            return "Please Enter a Valid Email Address";
          }
        },
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final TextEditingController passcon;

  PasswordField({Key? key, required this.passcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: passcon,
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            labelText: 'Password',
            labelStyle: const TextStyle(color: Colors.black),
            icon: const Icon(
              Icons.lock,
              color: Colors.black,
            )),
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required';
          }
        },
      ),
    );
  }
}

class ConfirmPasswordField extends StatelessWidget {
  final TextEditingController conpasscon;
  final TextEditingController passcon;

  ConfirmPasswordField({
    Key? key,
    required this.conpasscon,
    required this.passcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: conpasscon,
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            labelText: 'Confirm Password',
            labelStyle: const TextStyle(color: Colors.black),
            icon: const Icon(
              Icons.lock,
              color: Colors.black,
            )),
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required';
          }
          if (value != passcon.text) {
            return 'Password Not Match';
          }
        },
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const ProfileField({Key? key, required this.label, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field cannot be Empty';
          }
        },
      ),
    );
  }
}
