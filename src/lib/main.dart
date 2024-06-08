import 'package:avaliacao_seven_pay/providers/endereco_provider.dart';
import 'package:avaliacao_seven_pay/view/pages/address_search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EnderecoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '7PAY',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.red),
      ),
      home: const AddressSearchPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
