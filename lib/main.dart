import 'package:flutter/material.dart';
import 'package:jet_news_app/core/di/provider_setting.dart';
import 'package:jet_news_app/presentation/news_home/news_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  final providers = await providerSetting();

  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ResponsiveSizer(
        builder: (context, orientation, deviceType) => const NewsHomeScreen(),
      ),
    );
  }
}
