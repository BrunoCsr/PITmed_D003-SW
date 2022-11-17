import 'package:flutter_test/flutter_test.dart';
import 'package:pitmed_app/impl/ExpandableK.dart';
import 'package:pitmed_app/impl/Sistema.dart';

void main() {
  test('A lista "sistemas" é iniciada vazia', () async {
    ExpandableK expandableK = ExpandableK();
    expect(expandableK.sistemas.length, 0);
  });

  test('Adiciona um Sistema à lista "sistemas"', () async {
    ExpandableK expandableK = ExpandableK();
    Sistema sistema = Sistema(
        'Dica: Comer verduras',
        'Para acabar com a dor de barriga, coma uma beterraba',
        'path',
        'Endócrino');
    expandableK.adicionarSistema(sistema);

    expect(expandableK.sistemas.length, 1);

    expect(expandableK.sistemas[0].title, 'Dica: Comer verduras');

    expect(expandableK.sistemas[0].text,
        'Para acabar com a dor de barriga, coma uma beterraba');

    expect(expandableK.sistemas[0].path, 'path');

    expect(expandableK.sistemas[0].codigo, 'Endócrino');
  });

  test('Remove um item da lista de sistemas', () async {
    ExpandableK expandableK = ExpandableK();
    Sistema sistema = Sistema(
        'Dica: Comer verduras',
        'Para acabar com a dor de barriga, coma uma beterraba',
        'path',
        'Endócrino');

    expect(expandableK.sistemas.length, 0);

    expandableK.adicionarSistema(sistema);

    expect(expandableK.sistemas.length, 1);

    expandableK.removerSistema(sistema);

    expect(expandableK.sistemas.length, 0);
  });
}
