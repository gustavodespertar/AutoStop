import "package:flutter/material.dart";
import "package:minimalstore2/components/my_button.dart";
import "package:minimalstore2/models/product.dart";
import "package:provider/provider.dart";
import "../components/my_drawer.dart";
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Deseja Remover esse item do carrinho"),
        actions: [
          //botão cancelar
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          //botão confirmar
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Confirmar"),
          )
        ],
      ) 
    );
  }
 //função para adicionar ao carrinho
  void addItemToCart(BuildContext context, Product product){
    context.read<Shop>().addToCart(product);
  }

  //diminuir itens no carrinho
  void decreaseItemToCart(BuildContext context, Product product) {
    context.read<Shop>().decreamentQuantity(product);
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: 
        Text("logo conectaremos esse app a uma solução de pagamento. mais obrigado por testar!"),
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    final cart = context.watch<Shop>().cart;
  double totalBill = cart.fold<double>(
    0,(previousValue, element) => previousValue + (element.totalPrice));
    return Scaffold(

      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Carrinho"),
      ),

      drawer: const MyDrawer(),
      body: Column(
        children: [
          //listar o carrinho
          Expanded(
            child: cart.isEmpty 

            ? const Center(child: Text("Seu carrinho esta vazio"))
            : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];

                return ListTile(
                  leading: Image.network(item.imagepath),
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //botão remover do carrinho
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => removeItemFromCart(context, item)
                        ),
                        //botão de diminuir quantidade do carrinho
                        IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: item.quantity >= 2
                        ? () => decreaseItemToCart(context, item)
                        :() => removeItemFromCart(context, item)
                        ,
                        ),
                        //quantidade de itens no carrinho
                        Text(item.quantity.toString()),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => addItemToCart(context, item),
                        )
                    ],
                  ));
               }),
            ),
           Visibility(
          visible: cart.isNotEmpty,
            child: Center(
              child: Padding(
                
             padding: const EdgeInsets.all(50),
             child: Row(
               children: [
                Text(
                  "Total R\$ ${totalBill.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                 SizedBox(width: 100),
                 MyButton(onTap: () => payButtonPressed(context),
                    child: const Text("Pagamento")),
               ],
             ),
                ),
              ),
            )
        ],
        
      ),      
    );
  }
}
