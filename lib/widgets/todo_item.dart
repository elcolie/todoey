import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String itemName;
  bool isChecked = false;

  TodoItem({@required this.itemName = '', this.isChecked = false});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isChecked == true
              ? Text(
                  widget.itemName,
                  style: TextStyle(
                      fontSize: 20.0, decoration: TextDecoration.lineThrough),
                )
              : Text(widget.itemName, style: TextStyle(fontSize: 20.0)),
          Transform.scale(
            scale: 2.0,
            child: Checkbox(
              checkColor: Colors.white,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
