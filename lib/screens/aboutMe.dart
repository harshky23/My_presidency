import 'package:flutter/material.dart';
 String aboutMe='';
class AboutMe extends StatelessWidget {

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
          title: Text('About Me'),
        ),
        body: Column(
          children: [
            Expanded(flex: 3,child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/back.JPG'),
                fit: BoxFit.cover,
              ),
            ),
            )),
            Expanded(flex: 4,child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                child: Text('Hi guys,\n I am Harsh a student of Presidency University , I faced many issue while login into my edhitch and Knowledge Pro account , so this app makes it easy for every one to do login on the go with a beautiful user interface , and also  in the future I will add Chat feature so that we can absorb some knowledge from our seniors.',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                ),
              ),
            )),
          ],
        )
    );
  }
}
