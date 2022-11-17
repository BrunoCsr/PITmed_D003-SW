import 'package:pitmed_app/impl/Sistema.dart';

class ExpandableK {
  List<Sistema> sistemas = [];

  void adicionarSistema(Sistema sistema) {
    sistemas.add(sistema);
  }

  void removerSistema(Sistema sistema) {
    sistemas.remove(sistema);
  }
}
