import 'package:flutter/material.dart';

class LinkWidget extends StatelessWidget {
  final String label;
  final bool isLast;

  const LinkWidget({super.key, required this.label, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    final Color textColor = Theme.of(context).colorScheme.onPrimary;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: textColor,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label),
            ],
          ),
        ),
        const SizedBox(height: 3.0),
        if (!isLast) SizedBox(width: 10),
      ],
    );
  }
}
