import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double?txtSize;
  final FontWeight?fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final Function()? onTap;
  final bool? isSelected;

  const CustomText({super.key, required this.text, this.txtSize, this.fontWeight,
    this.color ,
    this.textAlign=TextAlign.center, this.onTap, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text((text),
          textAlign: textAlign,
          style:  TextStyle(
            color: color,
            fontSize: txtSize??14,
            fontWeight: fontWeight??FontWeight.w400,
            fontFamily: 'Inter',
          )),
    );
  }
}
