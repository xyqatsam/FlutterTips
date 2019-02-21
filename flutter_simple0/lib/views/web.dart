import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
class WebPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<WebPage> {
final Completer<WebViewController> _controller =Completer<WebViewController>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('webview'),),
      body: WebView(
          initialUrl: 'http://www.baidu.com',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        )
    );
  }
} 