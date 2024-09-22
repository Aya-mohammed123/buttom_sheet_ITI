// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FieldOfText extends StatefulWidget {
  bool? obsecure = false;
  final TextEditingController? controller;
  String hintText;
  final FormFieldValidator<String>? validator;
  Icon? icon;
  FieldOfText({
    Key? key,
    this.obsecure,
    this.controller,
    required this.hintText,
    this.validator,
    this.icon,
  }) : super(key: key);

  @override
  State<FieldOfText> createState() => _FieldOfTextState();
}

class _FieldOfTextState extends State<FieldOfText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        obscureText: widget.obsecure ?? false,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.hintText,
          suffixIcon: widget.icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      ),
    );
  }
}
