import 'package:url_launcher/url_launcher.dart';

class Launcher {
  static Future<void> linkLauncher(String link) async {
    final Uri _url = Uri.parse(link);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
