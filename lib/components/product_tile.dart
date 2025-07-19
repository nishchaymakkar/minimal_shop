import 'package:flutter/material.dart';
import 'package:minimal_shop/models/product.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});
    //add to cart

  void addToCart(BuildContext context){
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text('Add this item to your cart?'),
      actions: [
        MaterialButton(onPressed: ()=> Navigator.pop(context), child: Text('No')),
        MaterialButton(onPressed: (){
          Navigator.pop(context);
            context.read<Shop>().addToCart(product);
        }, child: Text('Yes')),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
              aspectRatio: 1,
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(product.imagePath))
            ),
              const SizedBox(height: 25),
              Text(product.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
              const SizedBox(height: 10),
              Text(product.description,
                style:  TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                )),
              const SizedBox(height: 25),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('₹${product.price.toStringAsFixed(2)}'),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                ),
                  child: IconButton(onPressed: () => addToCart(context), icon: Icon(Icons.add)))
            ],
          ),

        ],
      ),
    );
  }
}
