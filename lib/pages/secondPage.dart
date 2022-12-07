// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pitmed_app/impl/ExpandableK.dart';
import 'package:pitmed_app/impl/Sistema.dart';
import 'package:pitmed_app/impl/texts/Textos.dart';
import 'package:pitmed_app/models/my_card.dart';

class SecondPage extends StatefulWidget {
  final value;
  const SecondPage({super.key, required this.value, required});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  ExpandableK expandable = ExpandableK();
  @override
  initState() {
    Textos textos = Textos();

    expandable.adicionarSistema(Sistema(
        'Intolerância à lactose',
        textos.intoleranciaALactose,
        'assets/sistemas/digestorio/intolerancia a lactose/intolerancia_a_lactose.jpg',
        'Digestório'));
    expandable.adicionarSistema(Sistema(
        'Pedra na vesícula',
        textos.pedraNaVesicula,
        'assets/sistemas/digestorio/pedra na vesicula/pedra na vesicula.jpg',
        'Digestório'));
    expandable.adicionarSistema(Sistema('Refluxo', textos.refluxo,
        'assets/sistemas/digestorio/refluxo/refluxo.jpeg', 'Digestório'));
    expandable.adicionarSistema(Sistema('Diabetes', textos.diabetes,
        'assets/sistemas/endocrino/diabetes/Diabetes.png', 'Endócrino'));
    expandable.adicionarSistema(Sistema(
        'Hipertireoidismo',
        textos.hipertireoidismo,
        'assets/sistemas/endocrino/hipertireoidismo/hipertireoidismo.jpg',
        'Endócrino'));
    expandable.adicionarSistema(Sistema(
        'Dislipidemia',
        textos.dislipidemia,
        'assets/sistemas/endocrino/dislipidemia/dislipidemia.jpeg',
        'Endócrino'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff7b4397),
          centerTitle: true,
          title: Text(widget.value),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xff8d5ba4),
          child: Stack(
            children: [
              const Center(
                child: Image(image: AssetImage('assets/brandlogo (1).jpeg')),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: SizedBox(
                      height: 650,
                      width: MediaQuery.of(context).size.width - 20,
                      child: ListView.builder(
                          itemCount: expandable.sistemas.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            if (expandable.sistemas[index].codigo ==
                                widget.value) {
                              return MyCard(
                                  title:
                                      '  ${expandable.sistemas[index].title}',
                                  text: '  ${expandable.sistemas[index].text}',
                                  path: expandable.sistemas[index].path);
                            }

                            return const SizedBox();
                          }),
                    ),
                  ))
            ],
          ),
        ));
  }
}
