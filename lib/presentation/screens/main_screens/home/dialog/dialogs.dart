import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';

import 'custom_position.dart';
import 'dialog_widget.dart';

class Dialogs {
  static const TextStyle titleStyle =
  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  static const Widget holder = const SizedBox(
    height: 0,
  );

  static const ShapeBorder dialogShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)));

  static const ShapeBorder BottomSheetShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)));

  static const CustomViewPosition customViewPosition =
      CustomViewPosition.BEFORE_TITLE;


  static Future<void> materialDialog({
    required BuildContext context,
    Function(dynamic value)? onClose,
    String? title,
    String? msg,
    List<Widget>? actions,
    Widget customView = holder,
     CustomViewPosition customViewPosition = CustomViewPosition.BEFORE_TITLE,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    ShapeBorder dialogShape = dialogShape,
    TextStyle titleStyle = titleStyle,
    TextStyle? msgStyle,
    TextAlign? titleAlign,
    TextAlign? msgAlign,
     // Color color = bcgColor,
    double? dialogWidth,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (context) {
        return Dialog(
          backgroundColor: ColorResources.background,
          shape: dialogShape,
          child: DialogWidget(
            title: title,
            dialogWidth: dialogWidth,
            msg: msg,
            actions: actions,
            customView: customView,
             customViewPosition: customViewPosition,
            titleStyle: titleStyle,
            msgStyle: msgStyle,
            titleAlign: titleAlign,
            msgAlign: msgAlign,
            // color: color,
          ),
        );
      },
    ).then((value) => onClose?.call(value));
  }

  static void bottomMaterialDialog({
    required BuildContext context,
    Function(dynamic value)? onClose,
    String? title,
    String? msg,
    List<Widget>? actions,
    Widget customView = holder,
    CustomViewPosition customViewPosition = CustomViewPosition.BEFORE_TITLE,
    bool barrierDismissible = true,
    ShapeBorder dialogShape = BottomSheetShape,
    TextStyle titleStyle = titleStyle,
    TextStyle? msgStyle,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
  }) {
    showModalBottomSheet(
      context: context,
      shape: dialogShape,
      backgroundColor: ColorResources.background,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: DialogWidget(
          title: title,
          msg: msg,
          actions: actions,
          customView: customView,
           customViewPosition: customViewPosition,
          titleStyle: titleStyle,
          msgStyle: msgStyle,
        ),
      ),
    ).then((value) => onClose?.call(value));
  }
}