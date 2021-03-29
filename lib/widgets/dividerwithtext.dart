import 'package:flutter/material.dart';

class ASDivider extends StatefulWidget {
  ASDivider(this.text,
      {this.style, this.dividerColor = Colors.grey, this.thickness = 1.0});
  String text;
  TextStyle style;
  Color dividerColor;
  double thickness;
  @override
  _ASDividerState createState() => _ASDividerState();
}

class _ASDividerState extends State<ASDivider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: widget.dividerColor,
            thickness: widget.thickness,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.text, style: widget.style ?? widget.style),
        ),
        Expanded(
          child: Divider(
            color: widget.dividerColor,
            thickness: widget.thickness,
          ),
        ),
      ],
    );
  }
}
