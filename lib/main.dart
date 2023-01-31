import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'layout/home_layout.dart';
import 'shared/constants/constants.dart';


void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatefulWidget {
  const QuranApp({super.key});

  @override
  State<QuranApp> createState() => _QuranAppState();
}

class _QuranAppState extends State<QuranApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async
    {
      await readJson();
      await getSettings();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeLayout(),
    );
  }
}
