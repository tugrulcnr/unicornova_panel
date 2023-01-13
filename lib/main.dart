import 'package:flutter/material.dart';
import 'package:flutter_unicornova_panel/auth/register/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

import 'auth/register/view/register_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RegisterViewModel(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const RegisterView(),
    );
  }
}
