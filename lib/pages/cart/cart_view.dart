import 'package:catalogue_app/models/cart.dart';
import 'package:catalogue_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../velocityx/vx_store.dart';


class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cart',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Column(

        children:[Expanded(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: const CartList(),
          ),
        ),
        const Divider(),
          const CardTotal(),
        ]
      ),
    );
  }
}


class CardTotal extends StatelessWidget {

  const CardTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyVxStore).cart;
    return Container(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            VxConsumer(builder: (context, store, status) =>
              Text(cart.totalPrice.toString(),
                textScaleFactor: 3,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyTheme.darkBlue
                ),
              )
            , mutations: const {RemoveMutation}),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.32,
              height: MediaQuery.of(context).size.height*0.05,
              child: ElevatedButton(onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Buying Not Supported yet!')));
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const StadiumBorder()),
                backgroundColor:
                MaterialStateProperty.all(MyTheme.lightBlack),
              ),
                  child: const Text('Buy',
                    style:TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel cart = (VxState.store as MyVxStore).cart;
    return cart.items.isEmpty ? const Center(
      child: Text(
        'Nothing to show', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30
      ),
      ),
    ) : ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) =>
          SingleChildScrollView(
            child: ListTile(
              leading: const Icon(Icons.done),
              title: Text(cart.items[index].name),
              trailing: IconButton(
                icon: const Icon(
                    Icons.remove_circle_outline
                ),
                onPressed: () {
                  RemoveMutation(cart.items[index]);
                },

              ),
            ),
          ),
    );
  }
}
