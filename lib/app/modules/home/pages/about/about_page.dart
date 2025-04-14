import 'package:flutter/material.dart';
import 'package:homepage/app/modules/home/pages/about/widget/avatar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/contact_widget.dart';
import 'widget/info_widget.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                AvatarWidget(),
                Expanded(child: InfoWidget()),
              ],
            ),
            ContactWidget(
              onPressed: _launchUrl,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
