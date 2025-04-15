import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';

import 'social_button_widget.dart';

class ContactWidget extends StatelessWidget {
  final Function(String) onPressed;
  const ContactWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: <Widget>[
        SocialButtonWidget(
          text: 'Flutter Brasil Youtube Channel',
          icon: FontAwesomeIcons.youtube,
          url: 'https://youtube.flutterbrasil.com.br',
          color: Colors.red,
          tooltip: 'YouTube',
          onPressed: onPressed,
        ),
        SocialButtonWidget(
          text: 'Toshi Ossada Facebook',
          icon: FontAwesomeIcons.facebook,
          url: 'https://facebook.com/toshiossada',
          color: Colors.blue,
          tooltip: 'Facebook',
          onPressed: onPressed,
        ),
        SocialButtonWidget(
          text: 'Toshi Ossada GitHub',
          icon: FontAwesomeIcons.github,
          url: 'https://github.com/toshiossada',
          color: Colors.white,
          tooltip: 'GitHub',
          onPressed: onPressed,
        ),
        SocialButtonWidget(
          text: 'Toshi Ossada Linkedin',
          icon: FontAwesomeIcons.linkedin,
          url: 'https://linkedin.com/in/toshiossada',
          color: Colors.lightBlue.shade300,
          tooltip: 'LinkedIn',
          onPressed: onPressed,
        ),
        SocialButtonWidget(
          text: 'Toshi Ossada Instagram',
          icon: FontAwesomeIcons.instagram,
          url: 'https://instagram.com/toshiossada',
          color: Colors.pinkAccent,
          tooltip: 'Instagram',
          onPressed: onPressed,
        ),
        SocialButtonWidget(
          text: 'Toshi Ossada Medium Article',
          icon: FontAwesomeIcons.medium,
          url: 'https://toshiossada.medium.com/',
          color: Colors.white,
          tooltip: 'Medium',
          onPressed: onPressed,
        ),
        SocialButtonWidget(
          text: 'Toshi Ossada Contato Email',
          icon: FontAwesomeIcons.solidEnvelope,
          url: 'mailto:toshiossada@toshiossada.dev',
          color: Colors.grey[400]!,
          tooltip: 'send_email'.i18n(),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
