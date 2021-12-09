import 'package:flutter/material.dart';
import 'package:flutter_simple_nested_navigation/view_home.dart';
import 'package:simple_url_handler/simple_url_handler.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _path = 'init_screen';

  @override
  Widget build(BuildContext context) {
    return SimpleUrlHandler(
      debugShowCheckedModeBanner: false,
      urlToAppState:
          (BuildContext context, RouteInformation routeInformation) async {
        final String? _location = routeInformation.location;
        if (_location != null) {
          final String? _pathName = _location.substring(1);
          if (_pathName != null) {
            if (_pathName.isNotEmpty) {
              _path = _pathName;

              setState(() {});
            } else {
              SimpleUrlNotifier.of(context).notify();
            }
          }
        }
        return;
      },
      appStateToUrl: () => RouteInformation(location: '/$_path'),
      child: ViewHome(
        pathSource: _path,
        pathListener: (path) {
          _path = path;
          setState(() {});
        },
      ),
    );
  }
}
