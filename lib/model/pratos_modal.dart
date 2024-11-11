import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PratosModel {
  String? nomePrato;
  String? descricaoPrato;
  String? ingredientes;
  String? dataCardapio;

  PratosModel(
      {this.nomePrato,
      this.descricaoPrato,
      this.ingredientes,
      this.dataCardapio});

  PratosModel.fromJson(Map<String, dynamic> json) {
    nomePrato = json['nome_prato'];
    descricaoPrato = json['descricao_prato'];
    ingredientes = json['ingredientes'];
    dataCardapio = json['data_cardapio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome_prato'] = this.nomePrato;
    data['descricao_prato'] = this.descricaoPrato;
    data['ingredientes'] = this.ingredientes;
    data['data_cardapio'] = this.dataCardapio;
    return data;
  }

   static Future<PratosModel> dadosPratos(token) async {
    TextEditingController dia_API = TextEditingController();
    
    final url = Uri.parse('http://10.141.46.20/gerdau-api/api-gerdau/endpoints/listarCardapioPorDia.php?data_cardapio=29/11/2024'); 
    final response = await http.get(url, headers: {'authorization': token});
    print(response.body[0]);
      
       if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);

      // Verifica se há dados na chave "dados"
      if (decodedJson.containsKey('dados') && decodedJson['dados'] is List) {
        final dados = decodedJson['dados'] as List;
        if (dados.isNotEmpty) {
          // Retorna o primeiro item como PratosModel
          return PratosModel.fromJson(dados[0]);
        } else {
          throw Exception('Nenhum prato encontrado.');
        }
      } else {
        throw Exception('Formato de JSON inválido.');
      }
       //return PratosModel.fromJson(jsonDecode(response.body)as Map<String, dynamic>);

      } else {
        throw Exception('Falha ao realizar login');
      }

   }
}
