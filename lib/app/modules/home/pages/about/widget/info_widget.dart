import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextRenderer(
          style: TextRendererStyle.header1,
          child: Text(
            'TOSHI OSSADA',
            style: TextStyle(
              fontSize: 42,
            ),
          ),
        ),
        SizedBox.square(
          dimension: 32,
        ),
        Wrap(
          children: [
            ImageRenderer(
              alt: 'Dart',
              child: Image.asset(
                'assets/images/awards/dart.png',
                height: 52,
              ),
            ),
            SizedBox.square(
              dimension: 32,
            ),
            ImageRenderer(
              alt: 'Flutter',
              child: Image.asset(
                'assets/images/awards/flutter.png',
                height: 52,
              ),
            ),
          ],
        ),
        SizedBox.square(
          dimension: 32,
        ),
        TextRenderer(
          child: SelectableText(
            'Profissional reconhecido pelo programa da Microsoft como Most Value Professional e do Google Developer Expert em Flutter e Dart, pós graduado em Engenharia de Software, com formação tecnológica em Jogos Digitais e técnica em Informática com mais de 18 anos de experiência na área, atuando em empresas nacionais e multinacionais de grande porte de tecnologia. Profissional com ampla experiência em desenvolvimento de aplicações mobile utilizando Flutter. Possui conhecimento em programação de software em diversas ferramentas da área. Vivência com gestão de equipes, condução de projeto com equipes multidisciplinares e troca com stakeholders. Como fundador da Flutter Brasil, encontra-se na linha de frente na organização de eventos e atividades, visando expandir e fortalecer a comunidade.',
          ),
        ),
        GestureDetector(
          onTap: () {
            launchUrl(Uri.parse('https://flutterbrasil.com.br/'),
                mode: LaunchMode.externalApplication);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                ImageRenderer(
                  alt: 'Flutter',
                  child: Image.asset(
                    'assets/images/flutterbrasil/dash.png',
                    height: 52,
                  ),
                ),
                ImageRenderer(
                  alt: 'Flutter',
                  child: Image.asset(
                    'assets/images/flutterbrasil/flutter_br.png',
                    height: 52,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
