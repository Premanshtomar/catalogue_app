import 'dart:convert';

import 'package:catalogue_app/models/cart.dart';
import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/pages/home/home_utils/catalogue_header.dart';
import 'package:catalogue_app/pages/home/home_utils/catalogue_list.dart';
import 'package:catalogue_app/pages/home/home_utils/drawer_view.dart';
import 'package:catalogue_app/utils/routes.dart';
import 'package:catalogue_app/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../velocityx/vx_store.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogueJson =
        await rootBundle.loadString('assets/files/catalogue.json');
    final decodedJson = jsonDecode(catalogueJson);
    var productsData = decodedJson['myCart'];
    CatalogueModel.items = List.from(productsData)
        .map<Item>((item1) => Item.fromMap(item1))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyVxStore).cart;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: MyTheme.cremeColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      floatingActionButton: VxBuilder(
        builder: (context, store, status) => FloatingActionButton(
          backgroundColor: MyTheme.darkBlue,
          onPressed: () {
            Navigator.pushNamed(context, Routes.cartView);
          },
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.yellow,
          ),
        ).badge(
          color: Colors.grey,
          size: 22,
          count: cart.items.length,
        ),
        mutations: const {RemoveMutation, AddMutation},
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogueHeader(),
              const SizedBox(
                height: 8,
              ),
              (CatalogueModel.items.isNotEmpty)
                  ? const Expanded(child: CatalogueList())
                  : Expanded(
                      child: Center(
                        child:
                            CircularProgressIndicator(color: MyTheme.darkBlue),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
