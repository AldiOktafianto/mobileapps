import 'package:flutter/material.dart';
import 'package:netflix_/models/model.dart';
import 'package:netflix_/screens/form_login.dart';
import 'package:netflix_/screens/listview_builder.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LibraryServices>(
      create: (context) => LibraryServices(),
      child: MaterialApp(
        title: 'Vstream',
        debugShowCheckedModeBanner: false,
        //home: HomeScreen(),
        home: formlogin(),
        routes: <String,WidgetBuilder>{
          '/login' :(BuildContext context) => new formlogin(),
          '/listviewbuilder' :(BuildContext context) => new ListViewBuilder(),
        },
      ),
    );
  }
}
