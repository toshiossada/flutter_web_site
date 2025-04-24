import 'package:flutter/material.dart';

import 'detail_row_widget.dart';

class InfoWidget extends StatelessWidget {
  final String name;
  final String school;
  final String course;
  final String document;
  final String photo;
  const InfoWidget(
      {super.key,
      required this.name,
      required this.school,
      required this.course,
      required this.document,
      required this.photo});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              DetailRowWidget(label: 'Nome:', value: name),
              DetailRowWidget(label: 'Instituição:', value: school),
              DetailRowWidget(label: 'Curso:', value: course),
              DetailRowWidget(
                  label: 'Documento de Identificação:', value: document),
              DetailRowWidget(label: 'Emissor:', value: 'UNE'),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.network(
              photo,
              height: 150,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  width: 100,
                  color: Colors.grey[200],
                  child: const Center(
                      child: Icon(Icons.person, size: 50, color: Colors.grey)),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
