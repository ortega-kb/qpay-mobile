import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:qpay/utils/spacing.dart';

/// Class messages provides
/// all messages toasts for any categories (Success, Error, Warning)
class Messages {
  static final duration = 2;

  static void error(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        borderRadius: BorderRadius.circular(large),
        padding: EdgeInsets.all(medium),
        duration: Duration(seconds: duration),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: Icon(
          Icons.error_rounded,
          color: Colors.white,
        ),
        message: message,
        messageColor: Colors.white,
      ),
    );
  }

  static void success(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        borderRadius: BorderRadius.circular(large),
        padding: EdgeInsets.all(medium),
        duration: Duration(seconds: duration),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.green,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: Icon(
          Icons.check_rounded,
          color: Colors.white,
        ),
        message: message,
        messageColor: Colors.white,
      ),
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
