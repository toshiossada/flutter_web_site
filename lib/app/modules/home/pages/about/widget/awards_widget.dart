import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_web.dart';
import 'package:url_launcher/url_launcher.dart';

class AwardsWidget extends StatelessWidget {
  const AwardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(

      children: [
        GestureDetector(
          onTap: () {
            launchUrl(
                Uri.parse(
                    'https://developers.google.com/profile/u/toshiossada'),
                mode: LaunchMode.externalApplication);
          },
          child: ImageRenderer(
            alt: 'Google Developer Expert',
            child: Image.asset(
              'assets/images/awards/gde.png',
              height: 62,
            ),
          ),
        ),
        SizedBox.square(
          dimension: 8,
        ),
        GestureDetector(
          onTap: () {
            launchUrl(
                Uri.parse(
                    'https://mvp.microsoft.com/pt-BR/MVP/profile/670f6b6b-0adf-498c-bb2d-d80b193d4e5d'),
                mode: LaunchMode.externalApplication);
          },
          child: ImageRenderer(
            alt: 'Microsoft Most Value Professional',
            child: Image.asset(
              'assets/images/awards/mvp.png',
              height: 62,
            ),
          ),
        ),
      ],
    );
  }
}
