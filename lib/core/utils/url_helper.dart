import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;

class UrlHelper {
  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> sendEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  
  static void downloadResume() {
  final assetUrl = Uri.base
      .resolve('assets/resume/amalFlutterDevResume.pdf')
      .toString();

  final anchor = html.AnchorElement(href: assetUrl)
    ..setAttribute('download', 'Amal_Flutter_Resume.pdf')
    ..style.display = 'none';

  html.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
}
