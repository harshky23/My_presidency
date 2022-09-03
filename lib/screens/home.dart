import 'package:flutter/material.dart';
import 'package:my_presidency/constant.dart';
import 'package:my_presidency/screens/aboutMe.dart';
import 'package:my_presidency/screens/details.dart';
import 'package:my_presidency/screens/webPage.dart';
import 'package:my_presidency/resorce.dart';

const String home = 'home';
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
              color: Colors.blue,),
              child: Text('Hi,',style: TextStyle(fontSize: 40,color:Colors.white ))),
            ListTile(
              title: Text('About me',style: TextStyle(fontSize: 20),),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, aboutMe);
              },
            )
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
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
          centerTitle: true,
          title: Text('My Presidency University',style: kHead,),
        ),
      ),
      body: Stack(
        children : [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/back.JPG'),
                  fit: BoxFit.cover,
                ),
              ),
                   ),
           Container(
                color: Colors.white.withAlpha(200),
              child: Padding(
                padding:  EdgeInsets.only(top: 250.0,left: 16,right: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context){
                                  return WebPage(name: 'Edhitch',url: 'https://www.edhitch.com/login.html',action: true);
                                }
                            ));
                          },
                          child: BigButton(img: 'edthich',title: 'Edhitch',),
                           ),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context){
                                return WebPage(name: 'Knowledge Pro',url: 'https://my-pgi.com/KnowledgePro/StudentLogin.do',action: false);
                              }
                            ));
                          },
                          child: BigButton(img: 'kPro',title: 'Knowledge Pro',),
                        )
                      ],
                    ),
                SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: (){
                   Navigator.pushNamed(context, detail);
                  },
                  child: BigButton(img: 'magic',title: 'Auto Fill',),

            ),
       ]
      ),
    ))]));
  }
}
