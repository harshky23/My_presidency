import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_presidency/screens/aboutMe.dart';
import 'screens/home.dart';
import 'screens/webPage.dart';
import 'screens/details.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget{

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
@override
  void initState() {
    super.initState();
    getData();
  }
  getData() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    eMail = prefs.getString('eMail')!;
    ePass = prefs.getString('ePass')!;
    kMail = prefs.getString('kMail')!;
    kPass = prefs.getString('kPass')!;
  });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Presidency',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'default'
      ),
      initialRoute: home,
      routes: {
        home : (context)=>Home(),
        webPage : (context)=>WebPage(),
        detail : (context)=>Details(),
        aboutMe : (context)=>AboutMe(),
      },
    );
  }
}
