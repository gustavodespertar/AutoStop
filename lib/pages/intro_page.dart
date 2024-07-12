
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "../components/my_button.dart";

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                 Image.network("https://firebasestorage.googleapis.com/v0/b/autostop-9a117.appspot.com/o/Design_sem_nome-removebg-preview.png?alt=media&token=9bd519bd-478a-4d2b-a3da-6680582c8b1d",
                 height: 270,),
          // logo
          const SizedBox(height: 10),
          //titulo
          const Text("Sejam bem vindos",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),

          const SizedBox(height: 15),

          Text("Produtos de Qualidade Somente Aqui!!!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              )),

          const SizedBox(height: 25),
          //button
          MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
              child: Icon(Icons.arrow_forward),
            ),
        ])));
  }
}
