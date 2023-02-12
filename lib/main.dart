import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sm_provider/provider.dart';
import 'package:sm_provider/register_screen.dart';
import 'package:sm_provider/result.dart';
import 'package:sm_provider/welcom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (_) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Register(),
      ),
    );
  }
}

