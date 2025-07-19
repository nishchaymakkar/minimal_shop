import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_button.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(BuildContext context, Product product){
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text('Remove this item from your cart?'),
      actions: [
        MaterialButton(onPressed: ()=> Navigator.pop(context), child: Text('No')),
        MaterialButton(onPressed: (){
          Navigator.pop(context);
          context.read<Shop>().removeFromCart(product);
          }, child: Text('Yes')),
      ],
    ));

    }
  void payButtonPressed(BuildContext context){
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text('User want to pay! Connect this app to your payment backend'),
    ));
  }
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Cart Page'),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: cart.isEmpty ? const Center(child: Text("Your cart is empty...")): ListView.builder(
            itemCount: cart.length,
              itemBuilder: (context,index){
                final item = cart[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('\₹${item.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                      onPressed: () => removeFromCart(context, item),
                      icon: const Icon(Icons.remove)));

              })),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(onTap: ()=> payButtonPressed(context), child: Text('Pay Now')),
          )
        ],
      )
    );
  }
}
