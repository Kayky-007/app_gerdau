import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:http/http.dart' as http;

class PratosModel {
  final String? nomePrato;
  final String? descricaoPrato;
  final String? ingredientes;
  final String? dataCardapio;
  final int? idPrato;

  PratosModel({
    this.nomePrato,
    this.descricaoPrato,
    this.ingredientes,
    this.dataCardapio,
    this.idPrato,
  });

 factory PratosModel.fromJson(Map<String, dynamic> json) {
    return PratosModel(
      idPrato: json['id_prato'],
      nomePrato: json['nome_prato'],
      descricaoPrato: json['descricao_prato'],
      ingredientes: json['ingredientes'],
    );
  }


  // static Future<PratosModel?> dadosPratos(String token, String diaAPI) async {
  //   final url = Uri.parse(
  //       'http://192.168.0.72/api-gerdau/endpoints/listarCardapioPorDia.php?data_cardapio=$diaAPI');
  //   final response = await http.get(url, headers: {'authorization': token});
  //   print(response.body);
  //   final mensagem = json.decode(response.body);
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> decodedJson = jsonDecode(response.body);

  //     // Verifica se há dados na chave "dados"
  //     if (decodedJson.containsKey('dados') && decodedJson['dados'] is List) {
  //       final dados = decodedJson['dados'] as List;
  //       if (dados.isNotEmpty) {
  //         // Retorna o primeiro item como PratosModel
  //         return PratosModel.fromJson(dados[0]);
  //       } else {
  //         print(mensagem);
  //         return mensagem;
  //       }
  //     } else {
  //        AlertController.show(
  //         "Realizar Pedido",
  //         mensagem[1] ?? "Não há pratos cadastrados para esse dia",
  //         TypeAlert.error,
  //         //  Navigator.pop();
  //       );

  //     }
  //   } else {
  //     throw Exception('Falha ao realizar requisição');
  //   }
  // }

  static Future<PratosModel?> dadosPratoPorDiaGet(
      String token, String diaAPI, int idPrato) async {
    final url = Uri.parse(
        'http://192.168.0.72/api-gerdau/endpoints/listarCardapioPorDiaGet.php?data_cardapio=$diaAPI&id_prato=$idPrato');

    // Realiza a requisição GET com o token no cabeçalho
    final response = await http.get(url, headers: {'authorization': token});

    print("Url enviada para API: $url");
    print("Resposta da API: ${response.body}");

    // Verifica o status da resposta HTTP
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);

      // Verifica se há a chave 'dados' na resposta
      if (decodedJson.containsKey('dados') && decodedJson['dados'] is List) {
        final dados = decodedJson['dados'] as List;

        // Se houverem dados na lista, retorna o primeiro item como objeto PratosModel
        if (dados.isNotEmpty) {
          return PratosModel.fromJson(dados[0]);
        } else {
          // Se não houver dados, exibe a mensagem de erro
          print("Sem pratos cadastrados para este dia.");
          AlertController.show(
            "Erro",
            "Não há pratos cadastrados para este dia.",
            TypeAlert.error,
          );
          return null;
        }
      } else {
        // Caso o JSON não tenha a chave 'dados' ou ela não seja uma lista
        print("Erro na estrutura dos dados retornados pela API.");
        AlertController.show(
          "Erro",
          "Erro ao processar os dados retornados.",
          TypeAlert.error,
        );
        return null;
      }
    } else {
      // Se a requisição falhar (status code diferente de 200)
      print("Falha na requisição: ${response.statusCode}");
      throw Exception('Falha ao realizar requisição');
    }
  }

  static Future<PratosModel?> dadosPratosPorDia(
      BuildContext context, String token, String diaAPI, int idPrato) async {
    final url = Uri.parse(
        'http://192.168.0.72/api-gerdau/endpoints/listarPratoCardapioDia.php');
    final response = await http.post(
      url,
      headers: {'authorization': token},
      body: {
        'data_cardapio': diaAPI.toString(),
        'id_prato': idPrato.toString(),
      },
    );
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
          return null; // Retorna null se não há pratos
        }
      } else {
        AlertController.show(
          "Realizar Pedido",
          mensagem[1] ?? "Não há pratos cadastrados para esse dia",
          TypeAlert.error,
        );

        // Adiciona um atraso para exibir o alerta antes de fechar a página
        Future.delayed(Duration(milliseconds: 500), () {
          Navigator.pop(context);
        });
        return null; // Retorna null se não há dados válidos
      }
    } else {
      throw Exception('Falha ao realizar requisição');
    }
  }

  // Método para listar prato do cardápio por dia, aceitando idPrato e dataCardapio como parâmetros
  static Future<PratosModel> listarPratoCardapioDia(
      String token, int idPrato, String dataCardapio) async {
    final url = Uri.parse(
        'http://192.168.0.72/api-gerdau/endpoints/listarPratoCardapioDia.php');
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
