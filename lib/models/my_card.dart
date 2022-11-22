import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final title;
  final text;
  final path;
  const MyCard(
      {super.key, required this.title, required this.text, required this.path});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: Colors.redAccent)),
            child: Column(
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        height: 170,
                        width: double.infinity,
                        child: Image(
                          image: AssetImage(widget.path),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ExpandablePanel(
                  header: Text(widget.title),
                  collapsed: Text(
                    widget.text,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  expanded: Text(
                    widget.text,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    maxLines: 11,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
