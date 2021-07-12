import 'package:ds1/Managers/ClientManager.dart';
import 'package:ds1/Managers/UserManager.dart';
import 'package:ds1/screens/Home/components/CardTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(builder: (context, userManager, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            '${userManager.user?.email ?? 'Home'}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: Text(
                '${userManager.isLoggedIn ? 'Sair' : 'ENTRAR'}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: Consumer<ClientManager>(
          builder: (context, clientManager, child) {
            final clients = clientManager.clients;
            return ListView.builder(
              padding: EdgeInsets.all(4),
              itemCount: clients.length,
              itemBuilder: (context, index) {
                return CardTile(clients[index]);
              },
            );
          },
        ),
      );
    });
  }
}
