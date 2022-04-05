import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:rustlib/rustlib.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  bool _splash = true;
  String? _result;

  @override
  initState() {
    super.initState();
    () async {
      // initialize globals here
      setState(() {
        _splash = false;
      });
    }();
  }

  Widget _buildWasmApp() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('click here to run the Rust function...'),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.fire_extinguisher),
            label: const Text('Make it so!'),
            onPressed: () {
              final things = Uint8List(5);
              final result = doStuff(things);
              setState(() {
                _result = result;
              });
            },
          ),
          const SizedBox(height: 20),
          (_result != null)
              ? Text('and the result is: $_result')
              : const Text('(just press it already...)'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rust WASM FFI',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: _splash
            ? const Center(child: CircularProgressIndicator())
            : _buildWasmApp(),
      ),
    );
  }
}
