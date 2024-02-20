import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/spacing.dart';

/// Class messages provides
/// all messages toasts for any categories (Success, Error, Warning)
class Messages {
  static final duration = 2;

  static error(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        borderRadius: BorderRadius.circular(large),
        margin: EdgeInsets.all(large),
        padding: EdgeInsets.all(medium),
        duration: Duration(seconds: duration),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        icon: Icon(
          Icons.error_rounded,
          color: Colors.white,
        ),
        message: message,
        messageColor: Colors.white,
      )..show(context),
    );
  }

  static success(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        borderRadius: BorderRadius.circular(large),
        margin: EdgeInsets.all(large),
        padding: EdgeInsets.all(medium),
        duration: Duration(seconds: duration),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundColor: Colors.green,
        reverseAnimationCurve: Curves.easeInOut,
        icon: Icon(
          FontAwesomeIcons.check,
          color: Colors.white,
        ),
        message: message,
        messageColor: Colors.white,
      )..show(context),
    );
  }

  static void warning(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        borderRadius: BorderRadius.circular(large),
        padding: EdgeInsets.all(medium),
        duration: Duration(seconds: duration),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.yellow,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: Icon(
          Icons.warning_rounded,
          color: Colors.white,
        ),
        message: message,
        messageColor: Colors.white,
      ),
    );
  }
}
