import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/endereco.dart';

class EnderecoProvider extends ChangeNotifier {

  List<Endereco> _enderecos = [];

  List<Endereco> get enderecos => _enderecos;

  String uf = 'UF';

  Future<void> buscarEnderecos(String cidade, String logradouro) async {
    final response = await http.get(Uri.parse('https://viacep.com.br/ws/$uf/$cidade/$logradouro/json/'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      _enderecos = jsonList.map((json) => Endereco.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Falha ao buscar endereços');
    }

  }
}