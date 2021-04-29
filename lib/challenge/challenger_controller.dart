import 'package:flutter/foundation.dart';

class ChallengeController {
  //ValueNotifier como um setState, para modificar a tela quando atualizar alguma coisa
  final currentPageNotifier = ValueNotifier<int>(1);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  int qtdAnwserRight = 0;
}
