// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTileWidget extends StatefulWidget {
  Icon? icon;
  String formName;
  String text;
  ListTileWidget({
    Key? key,
    required this.icon,
    required this.formName,
    required this.text,
  }) : super(key: key);

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Column(
            children: [
              Text(
                widget.text,
                style: const TextStyle(
                    fontWeight: FontWeight.w100, color: Color(0xFF050522)),
              ),
              Text(
                widget.formName,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF050522),
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: widget.icon ?? const Icon(Icons.closed_caption_off_outlined),
            onPressed: () {},
            color: const Color(0xFFEF5858),
          ),
        )
      ],
    );
  }
}
