import 'package:flutter/material.dart';
import '_routing/router.dart' as router;
import '_routing/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: homeViewRoute,
    );
  }
}