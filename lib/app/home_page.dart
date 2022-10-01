import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mailto/mailto.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            ImageRenderer(
              alt: 'Toshi Ossada Logo',
              child: Image.asset(
                'assets/images/logo_toshi.png',
                height: 400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LinkRenderer(
                  text: 'Toshi Ossada Facebook',
                  href: 'https://www.facebook.com/ToshiOssada/',
                  child: IconButton(
                      onPressed: () =>
                          _launchURL('https://www.facebook.com/ToshiOssadaa/'),
                      icon: const FaIcon(FontAwesomeIcons.facebook)),
                ),
                LinkRenderer(
                  text: 'Toshi Ossada gITHUB',
                  href: 'https://github.com/toshiossada/',
                  child: IconButton(
                      onPressed: () =>
                          _launchURL('https://github.com/toshiossada/'),
                      icon: const FaIcon(FontAwesomeIcons.github)),
                ),
                LinkRenderer(
                  text: 'Toshi Ossada Linkedin',
                  href: 'https://www.linkedin.com/in/toshiossada/',
                  child: IconButton(
                      onPressed: () => _launchURL(
                          'https://www.linkedin.com/in/toshiossada/'),
                      icon: const FaIcon(FontAwesomeIcons.linkedin)),
                ),
                LinkRenderer(
                  text: 'Toshi Ossada instagram',
                  href: 'https://www.instagram.com/toshiossada/',
                  child: IconButton(
                      onPressed: () =>
                          _launchURL('https://www.instagram.com/toshiossada/'),
                      icon: const FaIcon(FontAwesomeIcons.instagram)),
                ),
                LinkRenderer(
                  text: 'Toshi Ossada Medium Article',
                  href: 'https://toshiossada.medium.com/',
                  child: IconButton(
                      onPressed: () =>
                          _launchURL('https://toshiossada.medium.com/'),
                      icon: const FaIcon(FontAwesomeIcons.medium)),
                ),
                const LinkRenderer(
                  text: 'Toshi Ossada Contato Email',
                  href: 'toshiossada@toshiossada.dev',
                  child: IconButton(
                      onPressed: launchMailto, icon: Icon(Icons.mail_sharp)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

launchMailto() async {
  final mailtoLink = Mailto(
    to: ['toshiossada@toshiossada.dev'],
    cc: [],
    subject: 'Contato',
  );

  await launch('$mailtoLink');
}
