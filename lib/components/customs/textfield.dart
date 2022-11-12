// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';


class CustomTextField extends StatefulWidget {
  final TextEditingController field_con;
  final String hint_txt;
  const CustomTextField({super.key, required this.field_con, required this.hint_txt});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
                            controller: widget.field_con,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              hintText: widget.hint_txt,
                              hintStyle: const TextStyle(color: Colors.white),
                            ),
                          );
  }
}