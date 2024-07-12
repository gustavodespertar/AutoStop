import 'package:flutter/material.dart';
import 'package:minimalstore2/models/promo.dart';
import "package:provider/provider.dart";
import '../components/my_drawer.dart';
import '../components/my_product_tile.dart';
import '../models/shop.dart';


class PromoPage extends StatelessWidget {
  const PromoPage({super.key});
  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop.where((element) => element.category == "promo").toList();

    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            elevation: 0,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Produtos Em Promoção"),
            actions: [
              IconButton(
                onPressed: () => Navigator.pushNamed(context, "/cart_page"),
                icon: const Icon(Icons.shopping_cart_outlined),
              )
            ],            
            ),
            
        drawer: const MyDrawer(),
        backgroundColor:  Theme.of(context).colorScheme.surface,
        body: ListView(children: [
          const SizedBox(height: 25),
          Center(
              child: Text("Somente Promoção Aqui",
              
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ))),
          SizedBox(
            height: 750,
             child: GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Número de colunas desejado
      crossAxisSpacing: 10, // Espaçamento entre as colunas
      mainAxisSpacing: 0, // Espaçamento entre as linhas
      childAspectRatio: 0.5, // Proporção altura/largura dos itens
    ),
    //maldito seja o gridDelegate
    padding: const EdgeInsets.all(15),
    itemCount: products.length,
    scrollDirection: Axis.vertical, // Ou horizontal, dependendo da sua necessidade
    itemBuilder: (context, index) {
      final product = products[index];

      return MyProductTile(product: product);
    },
  ),
          )
        ]));
  }
}


