import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_web.dart';

class AwardsWidget extends StatelessWidget {
  const AwardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageRenderer(
          alt: 'Google Developer Expert',
          child: Image.asset(
            'assets/images/awards/gde.png',
            height: 62,
          ),
        ),
        SizedBox.square(
          dimension: 8,
        ),
        ImageRenderer(
          alt: 'Microsoft Most Value Professional',
          child: Image.asset(
            'assets/images/awards/mvp.png',
            height: 62,
          ),
        ),
      ],
    );
  }
}
