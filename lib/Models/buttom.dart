// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatefulWidget {
  String text;
  Color color;
  double fontSize;
  Color fontColor;
  final VoidCallback? onPressed;
  double vertical;
  double herizontal;

  ButtonWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontColor,
    this.onPressed,
    required this.vertical,
    required this.herizontal,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0), // Circular radius
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(widget.color),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: widget.vertical, horizontal: widget.herizontal),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.fontSize,
            color: widget.fontColor,
          ),
        ),
      ),
    );
  }
}
