import 'package:flutter/material.dart';

class ASTextFormField extends StatefulWidget {
  const ASTextFormField(
      {this.validator,
      this.hintText,
      this.helperText,
      this.labelText,
      this.keyboardType,
      this.controller});
  final String hintText;
  final String labelText;
  final String helperText;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  @override
  _ASTextFormFieldState createState() => _ASTextFormFieldState();
}

class _ASTextFormFieldState extends State<ASTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              labelStyle: TextStyle(),
              filled: false,
              hintText: widget.hintText,
              labelText: widget.labelText,
              helperText: widget.helperText,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)))),
          keyboardType: widget.keyboardType,
        ),
      ),
    );
  }
}
