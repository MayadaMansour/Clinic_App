import 'package:flutter/material.dart';

import '../../../../utils/color_resource/color_resources.dart';


class TitleText extends StatelessWidget {
  final String text;
  final double?txtSize;
  final FontWeight?fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final Function()? onTap;
  final bool? isSelected;

  const TitleText({super.key, required this.text, this.txtSize, this.fontWeight,
    this.color ,
    this.textAlign=TextAlign.center, this.onTap, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        text,
        style: TextStyle(
          color: ColorResources.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,

        ),
      ),
    );
  }
}
