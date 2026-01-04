import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  static Future<void> launchExternalUrl(String url) async {
    final trimmedUrl = url.trim();
    if (trimmedUrl.isEmpty) {
      debugPrint("URL is empty");
      return;
    }

    final uri = Uri.tryParse(trimmedUrl);
    if (uri != null && await canLaunchUrl(uri)) {
      final success =
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!success) {
        debugPrint("Failed to launch: $trimmedUrl");
      }
    } else {
      debugPrint("Invalid or unlaunchable URL: $trimmedUrl");
    }
  }

  static Future<void> openEmail(String email) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (!await launchUrl(uri)) {
      throw 'Could not launch email client';
    }
  }
}