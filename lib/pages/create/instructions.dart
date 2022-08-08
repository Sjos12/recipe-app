import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstructionsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InstructionState();
  }
}

class InstructionState extends State<InstructionsWidget> {
  void onReorder(int oldIndex, int newIndex) {}

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(children: [], onReorder: onReorder);
  }
}
