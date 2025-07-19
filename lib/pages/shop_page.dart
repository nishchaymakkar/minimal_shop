import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_drawer.dart';
import 'package:provider/provider.dart';

import '../components/product_tile.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {


    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Shop Page'),
        elevation: 0,
        actions: [
          IconButton(onPressed: ()=> Navigator.pushNamed(context, '/cart_page'), icon: Icon(Icons.shopping_cart))
        ],
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const  MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(height: 25),

          Center(child: Text(
              "Pick from a selected list of premium products",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold
            ),
            )),
          
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
                itemCount: products.length,
                itemBuilder: (context,index){
              final product = products[index];
                return MyProductTile(product: product);
            }),
          ),
        ],
      ),
    );
  }
}

