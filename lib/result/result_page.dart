import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int qtdAnwserRight;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.qtdAnwserRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                if (qtdAnwserRight == 0) Image.asset(AppImages.error),
                if (qtdAnwserRight > 0) Image.asset(AppImages.trophy),
                if (qtdAnwserRight == 0)
                  Text(
                    "Falhou!",
                    style: AppTextStyles.heading40,
                  ),
                if (qtdAnwserRight > 0)
                  Text(
                    "Parabéns!",
                    style: AppTextStyles.heading40,
                  ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                      text: "Você concluiu",
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                            text: "\n$title", style: AppTextStyles.bodyBold),
                        TextSpan(
                            text: "\ncom $qtdAnwserRight de $length acertos",
                            style: AppTextStyles.body),
                      ]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share("Veja meu primeiro app Flutter!");
                          }),
                    )),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.white(
                        label: "Voltar ao início",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
