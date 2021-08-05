import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grosery_store/pages/ui/home.dart';
import 'package:grosery_store/pages/providers/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: MaterialApp(
        title: 'Grosery Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
