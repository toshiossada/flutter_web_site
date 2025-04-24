import 'package:flutter/material.dart';

class ValidWidget extends StatelessWidget {
  const ValidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: const Color(0xFFDFF0D8),
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: const Color(0xFFD6E9C6)),
      ),
      child: const Center(
        child: Text(
          'Documento válido!',
          style: TextStyle(
            color: Color(0xFF3C763D),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
