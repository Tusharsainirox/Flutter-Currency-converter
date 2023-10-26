import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (BuildContext context, int index) {
          final cartitem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartitem['imageUrl'] as String),
            ),
            title: Text((cartitem['title']) as String,
                style: Theme.of(context).textTheme.titleSmall),
            subtitle: Text(
              ("Size: ${cartitem['sizes']}"),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Delete Product',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: const Text(
                          'Are you sure you want to remove this product from your cart?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "NO",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context,listen: false).removeProduct(cartitem) ;
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "YES",
                              style: TextStyle(color: Colors.red),
                            ),)
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.black54,
              ),
            ),
          );
        },
      ),
    );
  }
}
