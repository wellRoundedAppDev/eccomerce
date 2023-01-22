import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';

class CustomInput extends StatelessWidget {
  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  final FormFieldSetter<String>? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;


  CustomInput({Key? key,required this.hintText,this.prefixIcon,this.suffixIcon,    this.onSaved,
    this.textInputType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        ////fillColor:Color(AppColors.LIGHT_GREY),
        //filled: true,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconConstraints: BoxConstraints(maxWidth: 30,maxHeight: 30),
        suffixIconConstraints: BoxConstraints(maxWidth: 30,maxHeight: 30),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.black)),

        enabledBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.black)),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
       // focusColor: Color(AppColors.LIGHT_GREY),
      ),
    );
  }
}