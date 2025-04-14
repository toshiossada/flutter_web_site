import 'package:flutter/material.dart';

class ContactTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String url;
  final UrlTypeEnum urlType;
  final Function(String) onPressed;

  const ContactTileWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.url,
    required this.urlType,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.tealAccent[400]),
      title: Text(title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle:
          SelectableText(subtitle, style: TextStyle(color: Colors.grey[400])),
      onTap: () {
        String launchUrlString;
        if (urlType == UrlTypeEnum.tel) {
          launchUrlString = 'https://wa.me/$url';
        } else if (urlType == UrlTypeEnum.email) {
          launchUrlString = 'mailto:$url';
        } else {
          launchUrlString = url;
        }
        onPressed(launchUrlString);
      },
      contentPadding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    );
  }
}

enum UrlTypeEnum {
  tel,
  email,
  link;
}
