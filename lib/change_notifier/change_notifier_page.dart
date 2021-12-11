import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'provider_controller.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      context.read<ProviderController>().changeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    //var user = context.watch<ProviderController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifierPage'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<ProviderController, String>(
                selector: (_, controller) => controller.imgAvatar,
                builder: (_, imgAvatar, __) {
                  print('BUILD imgAvatar');
                  return Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imgAvatar),
                      radius: 60,
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.name,
                    builder: (_, name, __) {
                      print('BUILD name');
                      return Text(name);
                    },
                  ),
                  const SizedBox(width: 8),
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.birthDate,
                    builder: (_, birthDate, __) {
                      print('BUILD birthDate');
                      return Text(birthDate);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  context.read<ProviderController>().changeName();
                },
                child: const Text('Change name'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
