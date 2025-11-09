import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HooplyApp extends ConsumerWidget {
  const HooplyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Hooply',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purpleAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Hooply')),
        body: Center(child: Text('Welcome to Hooply!')),
      ),
    );
  }
}
