import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Launcher {
  static Future<void> linkLauncher(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> linkEmail(String email) async {
    final String url = 'mailto:$email';
    try {
      await launchUrlString(url);
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: email));
    }
  }

  static Future<void> linkStore(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
