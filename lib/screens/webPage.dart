  import 'dart:async';
  import 'package:webview_flutter/webview_flutter.dart';
  import 'package:flutter/material.dart';
  import 'webBar.dart';
  import 'details.dart';

  const String webPage = 'resources';

  class WebPage extends StatefulWidget {
    final String? name;
    final String? url;
    final bool? action;
    WebPage({this.name, this.url, this.action});
    @override
    _WebPageState createState() => _WebPageState();
  }

  class _WebPageState extends State<WebPage> {

    final Completer<WebViewController> _controllerCompleter =
        Completer<WebViewController>();

    @override
    Widget build(BuildContext context) {
      return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.blueAccent,
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
                    automaticallyImplyLeading: false,
                    title: Text('${widget.name}',style: TextStyle(fontFamily: 'head'),),
                    actions: [
                     widget.action==true? WebBarController('semail','spassword',eMail,ePass,'${widget.url}',_controllerCompleter.future):WebBarController('username','password',kMail,kPass,'${widget.url}',_controllerCompleter.future),
                    ],
                  ),
                  body: WebView(
                    gestureNavigationEnabled: true,
                    initialUrl: '${widget.url}',
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controllerCompleter.complete(webViewController);
                    },
                  ),
                ));
    }
  }
