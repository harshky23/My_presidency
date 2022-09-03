  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';

  class BigButton extends StatelessWidget {
    BigButton({required this.img,required this.title});
    final String img;
    final String title;
    @override
    Widget build(BuildContext context) {
      return Container(
        width: 110,height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xFFBB86EC),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(flex: 3 ,child: Padding(
              padding:  EdgeInsets.only(top:10.0),
              child: Image.asset('images/$img.png',),
            )),
            Padding(
              padding:  EdgeInsets.all(0),
              child: Text('$title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,),textAlign: TextAlign.center,),
            )
          ],
        ),
      );
    }
  }
  class Field extends StatelessWidget {
  Field({required this.hintText,required this.onChanged,required this.value});
  final String hintText;
  final String value;
  final ValueChanged<String>? onChanged;
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding:  EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          child: TextField(
            onChanged : onChanged,
            controller: TextEditingController(text: '$value'),
            cursorColor: Colors.black,
            style: TextStyle(
                fontSize: 20
            ),
            decoration: InputDecoration(
             labelText: '$hintText',
             labelStyle: TextStyle(fontSize: 17,color: Color(0XFF3700B3),),
             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFBB86EC),width: 2)),
             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.cyan,width: 2)),
            ),
          ),
        ),
      );
    }
  }

  class Tittle extends StatelessWidget {
    Tittle(this.txt);
    final String txt;
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding:  EdgeInsets.all(8.0),
        child: Text('$txt',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.purple,fontFamily: 'head'),),
      );
    }
  }
