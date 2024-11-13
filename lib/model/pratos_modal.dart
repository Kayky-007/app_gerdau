import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PratosModel {
  String? nomePrato;
  String? descricaoPrato;
  String? ingredientes;
  String? dataCardapio;

  PratosModel({
    this.nomePrato,
    this.descricaoPrato,
    this.ingredientes,
    this.dataCardapio,
  });

  PratosModel.fromJson(Map<String, dynamic> json) {
    nomePrato = json['nome_prato'];
    descricaoPrato = json['descricao_prato'];
    ingredientes = json['ingredientes'];
    dataCardapio = json['data_cardapio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome_prato'] = nomePrato;
    data['descricao_prato'] = descricaoPrato;
    data['ingredientes'] = ingredientes;
    data['data_cardapio'] = dataCardapio;
    return data;
  }

  static Future<PratosModel> dadosPratos(String token, String diaAPI) async {
    final url = Uri.parse(
      'http://10.141.46.20/gerdau-api/api-gerdau/endpoints/listarCardapioPorDia.php?data_cardapio=$diaAPI',
    ); 
    final response = await http.get(url, headers: {'authorization': token});
    print(response.body[0]);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);

      if (decodedJson.containsKey('dados') && decodedJson['dados'] is List) {
        final dados = decodedJson['dados'] as List;
        if (dados.isNotEmpty) {
          return PratosModel.fromJson(dados[0]);
        } else {
          throw Exception('Nenhum prato encontrado.');
        }
      } else {
        throw Exception('Formato de JSON inválido.');
      }
    } else {
      throw Exception('Falha ao realizar login');
    }
  }
}
