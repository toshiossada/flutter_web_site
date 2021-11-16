import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            Image.asset('assets/images/logo_toshi.png', height: 400,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(onPressed: () =>
                  _launchURL('https://www.facebook.com/ToshiOssada/'), icon: const FaIcon(FontAwesomeIcons.facebook)),
                IconButton(onPressed: () => _launchURL('https://github.com/toshiossada/'), icon: const FaIcon(FontAwesomeIcons.github)),
                IconButton(onPressed: () => _launchURL('https://www.linkedin.com/in/toshiossada/'), icon: const FaIcon(FontAwesomeIcons.linkedin)),
                IconButton(onPressed: () => _launchURL('https://www.instagram.com/toshiossada/'), icon: const FaIcon(FontAwesomeIcons.instagram)),
                IconButton(onPressed: () => _launchURL('https://toshiossada.medium.com/'), icon: const FaIcon(FontAwesomeIcons.medium)),
                const IconButton(onPressed: launchMailto, icon: const Icon(Icons.mail_sharp)),
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
        to: ['toshiossada@gmail.com'],
        cc: [],
        subject: 'Contato',
    );

    await launch('$mailtoLink');
}