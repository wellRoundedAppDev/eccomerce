import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';
import '../constants/font_sizes/font_sizes.dart';


class PrimaryButton extends StatelessWidget {
  String text;
  Color color;
  Function()? action;
  double textFontSize;
  double height;
  PrimaryButton(
      {Key? key,
      required this.text,
      required this.action,
      this.color = AppColors.APP_MAIN_COLOR,
        this.textFontSize = FontSizes.FONT_SIZE_16,

      this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))
          ),
      onPressed: action,
      child: Text(text,style: TextStyle(fontSize: textFontSize,fontWeight: FontWeight.w500),),
    ));
  }
}
