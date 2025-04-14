import 'package:flutter/material.dart';

class ExperiencesPage extends StatefulWidget {
  const ExperiencesPage({super.key});

  @override
  State<ExperiencesPage> createState() => _ExperiencesPageState();
}

class _ExperiencesPageState extends State<ExperiencesPage> {
  TextEditingController txt = TextEditingController();
  TextEditingController txt2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: txt2,
              maxLines: 10,
              readOnly: true,
            ),
            TextFormField(
              controller: txt,
              maxLines: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  final companyRegex = RegExp(
                    r'^(.+) – (\d\d\/\d\d\d\d) até (\d\d\/\d\d\d\d)$',
                    multiLine: true,
                  );
                  final roleRegex = RegExp(
                    r'^Cargo: (.+)$',
                    multiLine: true,
                  );
                  final descriptionRegex = RegExp(
                    r'^• (.+)$',
                    multiLine: true,
                  );
                  final companyMatch = companyRegex.allMatches(txt.text);
                  final roleMatch = roleRegex.allMatches(txt.text);
                  final descriptionMatch =
                      descriptionRegex.allMatches(txt.text);

                  final company = companyMatch.first.group(1);
                  final start = companyMatch.first.group(2);
                  final end = companyMatch.first.group(3);
                  final role = roleMatch.first.group(1);
                  final description =
                      descriptionMatch.map((e) => '"${e.group(1)}"').toList();

                  final json = '''{
    "company": "$company",
    "start": "$start",
    "end": "$end",
    "role": "$role",
    "description": [
        ${description.join(',')}
    ]
}''';

                  txt2.text = json;
                },
                child: Text('click')),
          ],
        ),
      ),
    );
  }
}
