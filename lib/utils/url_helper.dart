import 'package:url_launcher/url_launcher.dart';

/// Otvara URL u eksternom browseru (radi na web, Android, iOS).
Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

/// Otvara Google Maps pretragu za veterinare na datoj lokaciji.
Future<void> openVetSearch({double? lat, double? lng}) async {
  final query = Uri.encodeComponent('veterinar');
  final url = lat != null && lng != null
      ? 'https://www.google.com/maps/search/$query/@$lat,$lng,14z'
      : 'https://www.google.com/maps/search/${Uri.encodeComponent("veterinar near me")}';
  await openUrl(url);
}
