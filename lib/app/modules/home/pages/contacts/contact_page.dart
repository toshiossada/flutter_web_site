import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/contact_widget.dart';
import 'widgets/contact_tile_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // Poderia mostrar um Snackbar ou log de erro aqui

      throw Exception('Could not launch $url'); // Ou lançar uma exceção
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Entre em Contato',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            ContactTileWidget(
              icon: Icons.phone_android,
              title: 'Telefone',
              subtitle: '+55 (19) 99120-0273',
              url: '5519991200273',
              urlType: UrlTypeEnum.tel,
              onPressed: _launchUrl,
            ),
            const Divider(color: Colors.grey, indent: 16, endIndent: 16),
            ContactTileWidget(
              icon: Icons.email_outlined,
              title: 'Email',
              subtitle: 'toshiossada@toshiossada.dev',
              url: 'toshiossada@toshiossada.dev',
              urlType: UrlTypeEnum.email,
              onPressed: _launchUrl,
            ),
            const Divider(color: Colors.grey, indent: 16, endIndent: 16),
            ContactTileWidget(
              icon: Icons.location_pin,
              title: 'Endereço',
              subtitle: 'Americana - SP',
              url:
                  'https://www.google.com/maps/search/?api=1&query=Americana,SP',
              urlType: UrlTypeEnum.link,
              onPressed: _launchUrl,
            ),
            const SizedBox(height: 40),
            const Text(
              'Siga',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ContactWidget(
              onPressed: _launchUrl,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
