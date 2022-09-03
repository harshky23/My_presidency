import 'package:flutter/material.dart';
import 'package:my_presidency/resorce.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_presidency/constant.dart';
String detail = 'page';
String eMail ='';
String ePass ='';
String kMail ='';
String kPass ='';
class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
      appBar: AppBar(
    flexibleSpace: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(50),
    bottomLeft: Radius.circular(50)),
    color: Color(0XFF6200EE),
    ),
    ),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(50),
    bottomLeft: Radius.circular(50))
    ),
        title: Text('  Auto Fill',style:TextStyle(fontFamily: 'head')),
      ),
      body:Stack(
        children: [
          Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/secure.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
          Center(
            child: SizedBox(
              width: 300,
              height: 450,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(230),
                    border: Border.all(
                      width: 4,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Tittle('Edhitch Credentials'),
                    Field(hintText: 'Enter edhitch mail ID',
                      onChanged: (value)async{
                      eMail=value;
                      },value: '$eMail',),
                    Field(hintText: 'Password',onChanged: (value){
                      ePass=value;},
                        value: '$ePass'),
                    Flexible(child: SizedBox(height: 30,)),
                    Tittle('Knowledge Pro'),
                    Field(hintText: 'Enter Roll number',onChanged: (value){
                        kMail=value;},
                        value: '$kMail'),
                    Field(hintText: 'Password',onChanged: (value){
                      kPass=value;},
                        value: '$kPass'),
                    Flexible(child: SizedBox(height: 25,)),
                    TextButton(
                        onPressed: ()async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('eMail', eMail);
                      prefs.setString('ePass', ePass);
                      prefs.setString('kMail', kMail);
                      prefs.setString('kPass', kPass);
                      TextEditingController().text = eMail;
                      TextEditingController().text = ePass;
                      TextEditingController().text = kMail;
                      TextEditingController().text = kPass;
                      Navigator.pop(context);
                    },
                        style: TextButton.styleFrom(
                          minimumSize: Size(140,45),
                            primary: Colors.black,
                            backgroundColor: Color(0xFFBB86EC),
                            textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)
                        ),
                        child: Text('Save',style: kHead)
                    )
                  ],
                ),
              ),
            ),
          ),
        ]
      )
    );
  }
}

