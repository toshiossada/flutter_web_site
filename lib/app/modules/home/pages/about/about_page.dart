import 'package:flutter/material.dart';
import 'package:homepage/app/modules/home/pages/about/widget/avatar_widget.dart';
import 'package:localization/localization.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/contact_widget.dart';
import 'widget/info_widget.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  static const double _breakpoint = 700.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < _breakpoint;

    return Scaffold(
      appBar: AppBar(
        title: Text('about'.i18n()),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isSmallScreen
                ? _buildSmallLayout(context)
                : _buildLargeLayout(context),
            const SizedBox(height: 32),
            ContactWidget(
              onPressed: _launchUrl,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AvatarWidget(),
        const SizedBox(height: 24),
        InfoWidget(),
      ],
    );
  }

  Widget _buildLargeLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AvatarWidget(),
        const SizedBox(width: 32),
        Expanded(child: InfoWidget()),
      ],
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Não foi possível abrir $urlString')),
        );
      }
    }
  }
}
