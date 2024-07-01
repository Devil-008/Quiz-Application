import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final IconData icons;
  // final IconData icon2;
  final TextEditingController onchange;

  const MyTextField({
    super.key,
    required this.label,
    required this.icons,
    required this.onchange,
    // required this.icon2
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          controller: onchange,
          decoration: InputDecoration(
              prefixIcon: Icon(icons),
              // suffixIcon: Icon(icon2),
              fillColor: Colors.white,
              filled: true,
              hintText: label,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none)),
        ))
      ],
    );
  }
}
