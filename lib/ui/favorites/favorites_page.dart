import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoritesPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FavoritesPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
