import 'package:flutter/material.dart';

class IconsOutlineButton extends StatelessWidget {
  IconsOutlineButton({
    required this.onPressed,
    required this.text,
    this.shape,
    this.color,
    this.iconData,
    this.padding = const EdgeInsets.all(4),
    this.iconColor,
    this.textStyle,
  });

  final Function onPressed;

  final OutlinedBorder? shape;

  final Color? color;

  final IconData? iconData;

  final Color? iconColor;

  final String text;

  final TextStyle? textStyle;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed as void Function()?,
      style: OutlinedButton.styleFrom(
          shape: shape, padding: padding, backgroundColor: color),
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
