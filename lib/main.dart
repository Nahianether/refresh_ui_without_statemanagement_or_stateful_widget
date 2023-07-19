import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final StreamController<String> _streamController = StreamController<String>();

  MyHomePage({super.key});

  void _refreshText() {
    String newData = "New text from stream!";
    _streamController.add(newData);
  }

  void dispose() {
    _streamController.close();
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Refresh Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String>(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Waiting for data...');
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _refreshText,
              child: const Text('Refresh Text'),
            ),
          ],
        ),
      ),
    );
  }
}
