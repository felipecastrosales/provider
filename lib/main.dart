import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'change_notifier/change_notifier_page.dart';
import 'change_notifier/provider_controller.dart';
import 'provider/provider_page.dart';
import 'provider/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => UserModel(
            name: 'Felipe Sales',
            imgAvatar: 'assets/i.png',
            birthDate: '26/12/2003',
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderController(),
        ),
      ],
      child: MaterialApp(
        title: 'Provider Package',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/provider': (context) => const ProviderPage(),
          '/change-notifier': (context) => const ChangeNotifierPage(),
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/change-notifier');
                    },
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
