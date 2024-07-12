import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";

class UserProvider extends ChangeNotifier {
  User? _user;

  UserProvider() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }
//get para verificar se usuário está logado - retorna "true ou false"
  bool get isAuthenticated => _user != null;

// get para obter os dados do usuário
  User? get user => _user;

//Função para deslogar o usuário
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}