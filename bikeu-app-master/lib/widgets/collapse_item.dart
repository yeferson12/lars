import 'package:bikeu/utils/constants.dart';
import 'package:flutter/material.dart';

class CollapseItem extends StatefulWidget {

  CollapseItem({
    this.title,
    this.text,
  });

  String title;
  String text;

  @override
  _CollapseItemState createState() => _CollapseItemState();
}

class _CollapseItemState extends State<CollapseItem> {

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      color: whiteColor,
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: (){
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if(_expanded) Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            height: 200,
            child: ListView(
              children: [
                Text(widget.text, textAlign: TextAlign.justify,),
              ],
            ),
          )
        ],
      ),
    );
  }
}