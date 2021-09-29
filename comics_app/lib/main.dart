import 'package:flutter/material.dart';

import 'detail_page/screens/detail_page.dart';
import 'home_page/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        'detail' : ( BuildContext context ) => DetailPage(),
      },
    );
  }
}