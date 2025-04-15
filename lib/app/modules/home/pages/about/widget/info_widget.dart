import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextRenderer(
          style: TextRendererStyle.header1,
          child: Text(
            'TOSHI OSSADA',
            style: TextStyle(
              fontSize: 42,
            ),
          ),
        ),
        SizedBox.square(
          dimension: 32,
        ),
        Wrap(
          children: [
            ImageRenderer(
              alt: 'Dart',
              child: Image.asset(
                'assets/images/awards/dart.png',
                height: 52,
              ),
            ),
            SizedBox.square(
              dimension: 32,
            ),
            ImageRenderer(
              alt: 'Flutter',
              child: Image.asset(
                'assets/images/awards/flutter.png',
                height: 52,
              ),
            ),
          ],
        ),
        SizedBox.square(
          dimension: 32,
        ),
        TextRenderer(
          child: SelectableText(
            'main-description'.i18n(),
          ),
        ),
        GestureDetector(
          onTap: () {
            launchUrl(Uri.parse('https://flutterbrasil.com.br/'),
                mode: LaunchMode.externalApplication);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                ImageRenderer(
                  alt: 'Flutter',
                  child: Image.asset(
                    'assets/images/flutterbrasil/dash.png',
                    height: 52,
                  ),
                ),
                ImageRenderer(
                  alt: 'Flutter',
                  child: Image.asset(
                    'assets/images/flutterbrasil/flutter_br.png',
                    height: 52,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
