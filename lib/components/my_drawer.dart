import "package:flutter/material.dart";
import "package:minimalstore2/themes/theme_provider.dart";
import "package:minimalstore2/themes/themes.dart";
import "package:provider/provider.dart";
import "../services/auth_provider.dart";
import "my_list_tile.dart";



class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>().themeData;
    final userLogedIn = context.watch<UserProvider>().isAuthenticated;    
    
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                DrawerHeader(
                    child: Center(
                 child: const Icon(Icons.car_repair_outlined, 
                 size: 100,
                 
                 ))),
                const SizedBox(height: 35),
                MyListTile(
                  text: "Comprar",
                  icon: Icons.home,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/shop_page");
                  },
                ),
                MyListTile(
                    text: "promoções", 
                    icon: Icons.add_reaction, 
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/promo_page");
                    }),
                MyListTile(
                    text: "Carrinho",
                    icon: Icons.shopping_cart,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/cart_page");
                    }),
                MyListTile(
                    text: "informações", 
                    icon: Icons.add_ic_call, 
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/inform_page");
                    }),
                     MyListTile(
                    text: "Cadastre-se", 
                    icon: Icons.account_circle, 
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/register_page");
                    }),
                 
              ]),
               const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Column(
                    children: [
                      MyListTile(
                         text: userLogedIn
                          ? "Sair"
                          : "login",
                          icon: userLogedIn
                           ? Icons.logout
                           : Icons.account_circle_outlined,
                          onTap: () {
                            if (userLogedIn) {
                              Navigator.pop(context);
                              context.read<UserProvider>().signOut();
                            } else {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/login_page');
                            }
                          }),
                      MyListTile(
                        text: theme == lightMode ?"Modo escuro" : "Modo claro",
                        icon: theme == lightMode
                        ? Icons.toggle_off
                        : Icons.toggle_on_outlined,
                        onTap: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                             .toggleTheme();
                        },                        
                      )
                    ],
                  ))
            ]));
  }
}
