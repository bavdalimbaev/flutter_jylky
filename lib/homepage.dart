import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:full_webview/check_internet.dart';
import 'webview/jylky.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  int checkInt = 0;

  var options = InAppBrowserClassOptions(
      crossPlatform:
          InAppBrowserOptions(toolbarTopBackgroundColor: Colors.blue),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          javaScriptEnabled: true,
          cacheEnabled: true,
          transparentBackground: true,
        ),
      ));

  @override
  void initState() {
    super.initState();
    Future<int> a = CheckInternet().checkInternetConnection();
    a.then((value) {
      if (value == 0) {
        setState(() {
          checkInt = 0;
        });
        print('Нет соединение к сети');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Нет соединение к сети!'),
        ));
      } else {
        setState(() {
          checkInt = 1;
        });
        print('Интернет подключен');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Интернет подключен'),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          toolbarHeight: 0,
        ),
      body: WebExampleTwo()
    );
  }
}