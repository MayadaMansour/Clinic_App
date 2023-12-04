import 'package:flutter/material.dart';

const RoundedRectangleBorder btnShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)));

class IconsButton extends StatelessWidget {
  IconsButton({
    required this.onPressed,
    required this.text,
    this.shape = btnShape,
    this.padding = const EdgeInsets.all(4),
    this.color,
    this.iconData,
    this.iconColor,
    this.textStyle,
  });

  final Function onPressed;

  final ShapeBorder shape;

  final Color? color;

  final IconData? iconData;

  final Color? iconColor;

  final String text;

  final TextStyle? textStyle;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed as void Function()?,
        shape: shape,
        color: color,
        padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: iconData != null,
            child: Icon(
              iconData,
              color: iconColor,
              size: 18,
            ),
          ),
          Visibility(
            visible: iconData != null,
            child: SizedBox(
              width: 4,
            ),
          ),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
