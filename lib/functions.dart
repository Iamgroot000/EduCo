import 'package:url_launcher/url_launcher.dart';

void launchEmail() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'recipient@example.com', // Replace with your default email address
    query: 'subject=Regarding%20Your%20App&body=Hello,%20I%20have%20a%20question...', // You can customize the subject and body here
  );

  final String emailUrl = params.toString();

  if (await canLaunch(emailUrl)) {
    await launch(emailUrl);
  } else {
    final Uri fallbackParams = Uri(
      scheme: 'mailto',
      path: 'gaurprmr12@gmail.com', // Replace with your fallback/default email address
      query: 'subject=Regarding%20Your%20App&body=Hello,%20I%20have%20a%20question...',
    );
    final String fallbackEmailUrl = fallbackParams.toString();

    if (await canLaunch(fallbackEmailUrl)) {
      await launch(fallbackEmailUrl);
    } else {
      throw 'Could not launch email';
    }
  }
}