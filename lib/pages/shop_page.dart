import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_drawer.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Shop Page'),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const  MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}

