import 'package:flutter/material.dart';

class VitalPage extends StatelessWidget {
  const VitalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vitals")),
      body: const Center(child: Text("Vital Page")),
    );
  }
}
