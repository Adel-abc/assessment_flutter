import 'package:flutter/material.dart';

class TextFormCustom extends StatelessWidget {
  final IconData icon;
  final String lable;
  final validator;
  final TextEditingController controllerName;
  final bool isSecure;
  const TextFormCustom({super.key, required this.controllerName, required this.icon, required this.lable, required this.validator, required this.isSecure});

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.all(15),
       child: TextFormField(
        validator: validator,
        controller: controllerName,
        decoration: InputDecoration(
          labelText: lable,
          border: OutlineInputBorder(),
          prefixIcon: Icon(icon)
        ),
        obscureText: isSecure,
       ),
    );
  }
}