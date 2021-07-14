import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({Key key, this.title}) : super(key: key);
  final String title;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
          child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold,),
                ),
            ))
          ],
      )),
    );
  }
}
