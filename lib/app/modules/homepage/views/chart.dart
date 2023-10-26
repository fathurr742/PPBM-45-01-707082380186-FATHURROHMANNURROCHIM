import 'package:flutter/material.dart';

class MyChartPage extends StatefulWidget {
  const MyChartPage({super.key});

  @override
  State<MyChartPage> createState() => _MyChartPageState();
}

class _MyChartPageState extends State<MyChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Chart Page'),
      ),
    );
  }
}
