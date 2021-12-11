import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'provider/provider_page.dart';
import 'provider/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        return UserModel(
          name: 'Felipe Sales',
          imgAvatar: 'assets/i.png',
          birthDate: '26/12/2003',
        );
      },
      child: MaterialApp(
        title: 'Provider Package',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/provider': (context) => const ProviderPage(),
        },
        home: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Provider Package'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/provider');
                    },
                    child: const Text('Provider'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Change Notifier'),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
