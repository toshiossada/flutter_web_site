import 'package:flutter/material.dart';

class AppBarwidget extends StatelessWidget {
  const AppBarwidget({super.key});

  @override
  Widget build(BuildContext context) {
    const Color orangeColor = Color(0xFFF5A623);
    const Color blueColor = Color(0xFF0056B3);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 5,
          color: orangeColor,
        ),
        Container(
          height: 100,
          color: blueColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              SizedBox(
                width: 100,
              ),
              Image.asset(
                'assets/images/meia_entrada.png',
              ),
              const Spacer(),

              Icon(Icons.menu, color: Colors.white),
              // LayoutBuilder(
              //   builder: (context, constraints) {
              //     if (constraints.maxWidth > 600) {
              //       return Row(
              //         children: [
              //           LinkWidget(
              //             label: 'Lei da Meia-entrada',
              //           ),
              //           LinkWidget(
              //             label: 'Validação',
              //           ),
              //           LinkWidget(
              //             label: 'Chaves públicas',
              //           ),
              //           LinkWidget(
              //             label: 'FAQ',
              //           ),
              //           LinkWidget(
              //             label: 'Notícias',
              //           ),
              //         ],
              //       );
              //     } else {
              //       return Icon(Icons.menu, color: Colors.white);
              //     }
              //   },
              // )
            ],
          ),
        ),
      ],
    );
  }
}
