import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Messages {
  static final duration = 4;

  static info(title, description, BuildContext context) {
    return _settings(
      title: title,
      description: description,
      context: context,
      type: ToastificationType.info,
    );
  }

  static error(title, description, BuildContext context) {
    return _settings(
      title: title,
      description: description,
      context: context,
      type: ToastificationType.error,
    );
  }

  static warning(title, description, BuildContext context) {
    return _settings(
      title: title,
      description: description,
      context: context,
      type: ToastificationType.warning,
    );
  }

  static success(title, description, BuildContext context) {
    return _settings(
      title: title,
      description: description,
      context: context,
      type: ToastificationType.success,
    );
  }

  static _settings({
    required title,
    required description,
    required BuildContext context,
    required ToastificationType type,
  }) {
    return toastification.show(
        type: type,
        context: context,
        title: Text(title),
        description: Text(description),
        autoCloseDuration: Duration(seconds: duration));
  }
}
