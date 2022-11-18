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
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(width: 2, color: Colors.black)),
      child: Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            color: Colors.yellow,
          ),
          const SizedBox(
            height: 8,
          ),
          ExpandablePanel(
            header: Text(widget.title),
            collapsed: Text(
              widget.text,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.fade,
            ),
            expanded: Text(
              widget.text,
              overflow: TextOverflow.fade,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
