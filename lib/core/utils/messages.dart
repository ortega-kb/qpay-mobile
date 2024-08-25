import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Messages {
  static final duration = 2;

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
        alignment: Alignment.center,
        context: context,
        showProgressBar: false,
        title: Text(title),
        style: ToastificationStyle.flat,
        description: Text(description));
  }
}
