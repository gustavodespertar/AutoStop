import 'package:flutter/material.dart';

class InformPage extends StatelessWidget {
  const InformPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
      ),
      body: const Padding(
        padding:  EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Auto Stop',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'Contato: esportautostop@gmail.com',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'E-mail: esports@autostop.com',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Telefone: +55 11 98362-2983',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Localização: jardim miriam',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Endereço: Rua Av. assembleia, 773',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Cidade: ademar',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'País: brasil',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


