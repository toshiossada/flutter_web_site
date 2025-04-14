import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seo_renderer/renderers/link_renderer/link_renderer_web.dart';

class SocialButtonWidget extends StatelessWidget {
  final IconData icon;
  final String url;
  final String text;
  final Color color;
  final String tooltip;
  final Function(String) onPressed;

  const SocialButtonWidget({
    super.key,
    required this.icon,
    required this.url,
    required this.text,
    required this.color,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LinkRenderer(
      text: 'Toshi Ossada Facebook',
      href: url,
      child: IconButton(
        icon: FaIcon(icon, color: color, size: 28.0),
        tooltip: tooltip,
        onPressed: () => onPressed(url),
        splashRadius: 25.0,
        constraints: const BoxConstraints(),
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
