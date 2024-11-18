import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:http/http.dart' as http;

class PratosModel {
  String? nomePrato;
  String? descricaoPrato;
  String? ingredientes;
  String? dataCardapio;
  int? idPrato;

  PratosModel({
    this.nomePrato,
    this.descricaoPrato,
    this.ingredientes,
    this.dataCardapio,
    this.idPrato,
  });

  PratosModel.fromJson(Map<String, dynamic> json) {
    nomePrato = json['nome_prato'];
    descricaoPrato = json['descricao_prato'];
    ingredientes = json['ingredientes'];
    dataCardapio = json['data_cardapio'];
    idPrato = json['id_prato'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome_prato'] = this.nomePrato;
    data['descricao_prato'] = this.descricaoPrato;
    data['ingredientes'] = this.ingredientes;
    data['data_cardapio'] = this.dataCardapio;
    return data;
  }

  static Future<PratosModel?> dadosPratos(String token, String diaAPI) async {
    final url = Uri.parse(
        'http://10.141.46.20/gerdau-api/api-gerdau/endpoints/listarCardapioPorDia.php?data_cardapio=$diaAPI');
    final response = await http.get(url, headers: {'authorization': token});
    print(response.body);
    final mensagem = json.decode(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);

      // Verifica se há dados na chave "dados"
      if (decodedJson.containsKey('dados') && decodedJson['dados'] is List) {
        final dados = decodedJson['dados'] as List;
        if (dados.isNotEmpty) {
          // Retorna o primeiro item como PratosModel
          return PratosModel.fromJson(dados[0]);
        } else {
          print(mensagem);
          return mensagem;
        }
      } else {
         AlertController.show(
          "Realizar Pedido",
          mensagem[1] ?? "Não há pratos cadastrados para esse dia",
          TypeAlert.error,
        );
      }
    } else {
      throw Exception('Falha ao realizar requisição');
    }
  }

  // Método para listar prato do cardápio por dia, aceitando idPrato e dataCardapio como parâmetros
  static Future<PratosModel> listarPratoCardapioDia(
      String token, int idPrato, String dataCardapio) async {
    final url = Uri.parse(
        'http://10.141.46.20/gerdau-api/api-gerdau/endpoints/listarPratoCardapioDia.php');
    final response = await http.post(
      url,
      headers: {'authorization': token},
      body: {
        'id_prato': idPrato.toString(),
        'data_cardapio': dataCardapio,
      },
    );
    print(dataCardapio);
    print(idPrato);
    print('Resposta da API: ${response.body}');

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
    } else {
      throw Exception('Falha ao realizar requisição.');
    }
  }
}
