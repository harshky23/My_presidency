import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebBarController extends StatelessWidget {
  final Future<WebViewController> _controllerFuture;
  final String userName;
  final String password;
  final String url;
  final String inputMail;
  final String inputPass;
  const WebBarController(this.userName,this.password,this.inputMail,this.inputPass,this.url,this._controllerFuture, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<WebViewController>(
      future: _controllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return Row(
            children: <Widget>[
              magic(context, controller),
              _buildHistoryBackBtn(context, controller),
              _buildReloadBtn(controller),
              _buildHistoryForwardBtn(context, controller),
            ],
          );
        }

        return Container();
      },
    );
  }

  IconButton magic( BuildContext context,AsyncSnapshot<WebViewController> controller) {
    return IconButton(
      icon: Tab(icon: Image.asset('images/magic.png')),
      onPressed: () async {
        final String url = (await controller.data!.currentUrl())!;
        if (url == '$url') {
           controller.data!.loadUrl("javascript:var uselessvar =document.getElementById('$userName').value='" +inputMail+ "';", headers: null);
        controller.data!.loadUrl("javascript:var uselessvar =document.getElementById('$password').value='" +inputPass+ "';", headers: null);
        } else {
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Go to Login Screen',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }
        }
      },
    );
  }

  IconButton _buildReloadBtn(AsyncSnapshot<WebViewController> controller) {
    return IconButton(
      icon: Icon(Icons.refresh),
      onPressed: () {
        controller.data!.reload();
      },
    );
  }

  TextButton _buildHistoryForwardBtn(
      BuildContext context, AsyncSnapshot<WebViewController> controller) {
    return TextButton(
      child: Row(children: <Widget>[
        Icon(Icons.keyboard_arrow_right,color: Colors.white,),
      ]),
      onPressed: () async {
        if (await controller.data!.canGoForward()) {
          controller.data!.goForward();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'No forward history',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      },
    );
  }

  TextButton _buildHistoryBackBtn(
      BuildContext context, AsyncSnapshot<WebViewController> controller) {
    return TextButton(
      child:
        Icon(Icons.keyboard_arrow_left,color: Colors.white,),
      onPressed: () async {
        if (await controller.data!.canGoBack()) {
          controller.data!.goBack();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'No back history',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      },
    );
  }
}
