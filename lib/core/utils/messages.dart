import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Messages {
  static final duration = 2;

  static info(title, description, BuildContext context) {
    return toastification.show(
      type: ToastificationType.info,
      context: context,
      title: title,
      description: Text(description),
      autoCloseDuration: Duration(seconds: duration)
    );
  }

  static error(title, description, BuildContext context) {
    return toastification.show(
      type: ToastificationType.error,
      context: context,
      title: title,
      description: Text(description),
      autoCloseDuration: Duration(seconds: duration)
    );
  }

  static warning(title, description, BuildContext context) {
    return toastification.show(
      type: ToastificationType.warning,
      context: context,
      title: title,
      description: Text(description),
      autoCloseDuration: Duration(seconds: duration)
    );
  }

  static success(title, description, BuildContext context) {
    return toastification.show(
      type: ToastificationType.success,
      context: context,
      title: title,
      description: Text(description),
      autoCloseDuration: Duration(seconds: duration)
    );
  }
}
