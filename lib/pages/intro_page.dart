import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.shopping_bag,size: 72,color: Theme.of(context).colorScheme.inversePrimary),

            const SizedBox(height: 25),


            //title
            const Text("Minimal Shop",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
            const SizedBox(height: 10),
            //subtitle
            Text("Premium Quality Products",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
            ),),
            const SizedBox(height: 10,),
            // button
            MyButton(onTap: ()=> Navigator.pushNamed(context, '/shop_page'), child: const Icon(Icons.arrow_forward))
          ],
        ),
      ) ,
    );
  }
}

