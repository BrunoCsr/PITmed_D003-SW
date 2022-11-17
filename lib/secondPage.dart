// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:pitmed_app/impl/ExpandableK.dart';
import 'package:pitmed_app/impl/Sistema.dart';

class SecondPage extends StatefulWidget {
  final value;
  const SecondPage({super.key, required this.value});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  ExpandableK expandable = ExpandableK();
  @override
  initState() {
    expandable.adicionarSistema(Sistema('title', 'text', 'path', 'Endócrino'));
    expandable.adicionarSistema(Sistema('asd', 'ffff', 'sddddd', 'Digestório'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff7b4397),
          centerTitle: true,
          title: const Text('D003 - SW'),
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
                      height: 500,
                      width: 500,
                      child: ListView.builder(
                          itemCount: expandable.sistemas.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            if (expandable.sistemas[index].codigo ==
                                widget.value) {
                              return ExpandablePanel(
                                header: Text(expandable.sistemas[index].title
                                    .toString()),
                                collapsed: Text(
                                  expandable.sistemas[index].text.toString(),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                expanded: Text(
                                  expandable.sistemas[index].text.toString(),
                                  softWrap: true,
                                ),
                              );
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
