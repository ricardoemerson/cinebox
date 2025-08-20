import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MovieDetailPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MovieDetailPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
