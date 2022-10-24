import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  final String? label;
  final String validation;
  final TextInputType type;
  final double radius;
  final bool isPassword;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final int maxLength;
  const MyForm({
    Key? key,
    this.label,
    required this.validation,
    required this.type,
    required this.controller,
    this.radius = 15,
    this.isPassword= false,
    this.prefix,
    this.suffix,
    this.maxLength=10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 282,
      child: TextFormField(

        obscureText:  isPassword,
        keyboardType: type,
        controller: controller,
        validator: (value){
          if (value!.isEmpty)
          {
            return validation;
          }
        },
        decoration: InputDecoration(
          suffix: suffix,

          contentPadding: EdgeInsets.all( 20),
          prefix: prefix,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
          labelText: label,
        ),
      ),
    );
  }
}