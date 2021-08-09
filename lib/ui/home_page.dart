import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'components/no_connection_view/no_connection_view.dart';
import 'components/web_view/jylky.dart';
import 'elements/progress.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: FutureBuilder<ConnectivityResult>(
        future: Connectivity().checkConnectivity(),
        builder: (context, result) {
          if (!result.hasData) return const Progress();

          return StreamBuilder<ConnectivityResult>(
            initialData: result.data,
            stream: Connectivity().onConnectivityChanged..timeout(Duration(seconds: 5)),
            builder: (context, snaps) {
              if (snaps.hasData) {
                final result = snaps.data;

                switch (result) {
                  case ConnectivityResult.wifi:
                    return const WebExampleTwo();

                  case ConnectivityResult.mobile:
                    return const WebExampleTwo();

                  default:
                    return const NoConnectionView();
                }
              }

              if (snaps.hasError) return const NoConnectionView();

              return const Progress();
            },
          );
        },
      ),
    );
  }
}
