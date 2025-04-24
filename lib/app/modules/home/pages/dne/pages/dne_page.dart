import 'package:flutter/material.dart';
import 'package:homepage/app/modules/home/pages/dne/pages/widegets/info_widget.dart';

import 'widegets/app_bar_widget.dart';
import 'widegets/certificate.dart';
import 'widegets/valid_widget.dart';

class DNEPage extends StatefulWidget {
  final String name;
  final String school;
  final String course;
  final String document;
  final String photo;

  const DNEPage({
    super.key,
    required this.name,
    required this.school,
    required this.course,
    required this.document,
    required this.photo,
  });

  @override
  State<DNEPage> createState() => _DNEPageState();
}

class _DNEPageState extends State<DNEPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBarwidget(),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Validação de CIE (Carteira de Identificação Estudantil)',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF005e9e),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Divider(
                        color: Color(0xFF005e9e),
                        thickness: 2,
                        height: 20,
                      ),
                      const SizedBox(height: 20),
                      ValidWidget(),
                      const SizedBox(height: 25),
                      Text(
                        'UNE atesta que ${widget.name} é estudante e está regularmente matriculado(a) em ${widget.course} da instituição ${widget.school}',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      InfoWidget(
                        name: widget.name,
                        school: widget.school,
                        course: widget.course,
                        document: widget.document.padLeft(15, '0'),
                        photo: widget.photo,
                      ),
                      CertificateWidget(
                        headerText: 'Certificado de Atributo em formato PEM:',
                        certificateText:
                            '''MIID6DCCAiACAgbhweKBhzMBgkqhkiG9w0BAQ0EwJUCCjUbegAMIGA1UECgvKUUNSUlUJUXYXpnbDEmMCQGA1UECwwdVU5JdUgU8gTKFDSU0QUJvigRE9TlEVTlVFTVFVQ5URVMxdTAVBgNVBAIMMddmgbpbU3BNoaW55hcmgtT3NyeW1HRlAlCBZlCBjy6SBByDcBXTEkMAkGA1UEBhMCRzEXARgNVBAoMEAoXMCkICU1CcmFzZWFVBgNVBAsMDE00MTIxOTU3MDMwTAVBMRMwMRkwdYDVQQDLDBwWRI2NVbhZmcZkmVU1hMC4wDAYDVQQDLDAVWOuxJRDEXBgEwHgYDVQQJExcwSUGVzc29hZz9hEp1cmKaWnhNEEzMrgiwFgYDVR0QLDdA9BQyBWQUXdURCbCUkFTsUkJxgNkgNVBAMMHVVOsuFPIIE5BC0jpTKhFMdERVpUBU1RFVREVFOVTMADGCSpSggS3IQD3DQEBBQUAA4GgAgZ6ZXMcjIyDzjuwMvMz4MTQzMIEzMvVHgPfMIAyNjAzMzEyMzU6NTlaMIHNMEYGBWMaA0OBmT0TOzE5MDkxOTkyNDE1MzcyMTc4MDAMWDAaMDAxOTEwMTlhWDAaMDAwMDA0MDOTYzExNjcgICAglCAgAQMHgGBWMaAQoC MW0Ta1ZH3Y3VsZGZGeksZBZsBUzwNzub2x2ihIGRIFEFzXxjvJpFy2ySAgLcbTVVBFUkPuKlAgICAgLcbBbmFSaXNiUGUGRGVvVzVzZb2x2aW1lhWRIFGRIFNB0yVVaWhtbnEgICAglCA glCAgfAQIfNAqmsASGBWMaA0QDTADBMgMDMGA1UdIh0wQmhCgYIKwYIHRoUCHjB6MHUuJ9I1bmUzZGtLZnI3YLXL2nYbcC9I6bmJuY3JSgpPTlMwHQYDVR0OBBYEFMIcLSs9s92KkXVR0N g1zkde73OMCEgcGsqG/uFEWBbwEUUwEwyYWKBQQHMAIIEAY4YFSSFRUUFMDQyJzlhcWcNAOEFAgEHQEBAjyxgq+pj195QySzjVsUDp/dIIKh3K2RoAyDnmrbeUhJ9PnBiN YgUDW4G9aYC9CspPdITspwvVsqyaT3bAUlLRD2YHjnYJ8QW6Gs6R7GsaR7pGUBApGTlNbHQvzaS+OkybiVb7DV4xA8mRvVXYKGjRqvW7f7LdlySbyYtsd475DK8T4fTA113zlbYtdgkgx+kgxEs v2gU5UZZAEOHphBda4PHz4aGmxvMatuyA66UBy9is1Bs3xrltNJUpHQNOZXchCWbGjmG38y7NE5pNA6FWS6uDIOn7yCUwmv6KBkBLtAbLbLc1cxwsuMN7Y7WkcbHeAhWgzvcS3zv3y1he0oQ9dpNQtfpc2o=''',
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
