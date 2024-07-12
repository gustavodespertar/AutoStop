import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  // Construtor da classe MyProductTile, recebe um objeto Product como parâmetro
  const MyProductTile({Key? key, required this.product}) : super(key: key);

  // Função para exibir um AlertDialog ao adicionar o produto ao carrinho
  void addToCart(BuildContext context) {
    // Mostra um AlertDialog com opções de cancelar ou confirmar a adição ao carrinho
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Deseja Adicionar esse item ao carrinho?"),
        actions: [
          // Botão para cancelar a operação
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          // Botão para confirmar a adição ao carrinho
          MaterialButton(
            onPressed: () {
              Navigator.pop(context); // Fecha o AlertDialog
              context.read<Shop>().addToCart(product); // Chama o método addToCart da classe Shop usando Provider
            },
            child: const Text("Confirmar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(10), // Define margem de 10 pixels em todos os lados do Container
      padding: EdgeInsets.all(12), // Define padding de 12 pixels dentro do Container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Widget AspectRatio para exibir a imagem do produto
          AspectRatio(
            aspectRatio: 1.2, // Aspect ratio da imagem
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8), // Padding interno do Container da imagem
              child: Image.network(
                product.imagepath,
                fit: BoxFit.contain, // Ajusta a imagem para caber dentro do espaço disponível
              ),
            ),
          ),
          SizedBox(height: 10), // Espaçamento vertical entre a imagem e o nome do produto
          // Widget Text para exibir o nome do produto
          Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold, // Define negrito para o nome do produto
              fontSize: 18, // Tamanho da fonte do nome do produto
              color: Colors.white, // Cor do texto do nome do produto
            ),
          ),
          SizedBox(height: 6), // Espaçamento vertical entre o nome do produto e a descrição
          // Widget Text para exibir a descrição do produto
          Text(
            product.description,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary, // Cor do texto da descrição
            ),
            maxLines: 2, // Define o número máximo de linhas para a descrição
            overflow: TextOverflow.ellipsis, // Adiciona "..." se houver overflow de texto
          ),
          SizedBox(height: 6), // Espaçamento vertical entre a descrição do produto e o preço
          // Widget Row para exibir o preço do produto e o botão de adicionar ao carrinho
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Widget Text para exibir o preço do produto
              Text(
                "\$${product.price.toStringAsFixed(2)}", // Formata o preço graças a deus funciona
                style: TextStyle(
                  color: Colors.white, // Cor do texto do preço
                  fontSize: 16, // Tamanho da fonte do preço
                ),
              ),
              // Widget Container com um IconButton para adicionar o produto ao carrinho
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () => addToCart(context), // Chama a função addToCart ao pressionar o botão
                  icon: Icon(Icons.add), // Ícone de "+" para o botão
                  color: Colors.white, // Cor do ícone
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
