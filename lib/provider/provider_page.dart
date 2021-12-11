import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'product_model.dart';
import 'product_widget.dart';
import 'user_model.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);
    // return instance without listen alterations
    //   var user = context.read<UserModel>();
    // var imgAvatar = context.select<UserModel, String>(
    //   (userModel) => userModel.imgAvatar,
    // );
    // var user = context.watch<UserModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(user.imgAvatar),
                  radius: 60,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.name),
                  const SizedBox(width: 8),
                  Text(user.birthDate),
                ],
              ),
              const SizedBox(height: 24),
              Provider(
                create: (_) => ProductModel(name: 'Mentoring'),
                child: const ProductWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
