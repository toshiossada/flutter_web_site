import 'package:flutter/material.dart';
import 'package:homepage/app/modules/home/pages/about/widget/awards_widget.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_web.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageRenderer(
          alt: 'Toshi Ossada Logo',
          child: Image.asset(
            'assets/images/toshi.png',
          ),
        ),
        AwardsWidget(),
      ],
    );
  }
}
