import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PedidosModel {
  final int idPedido;
  final String dataPedido;
  final String dataAgendamento;
  final int notaPedido;
  final String nomePrato;
  final String descricaoPrato;

  PedidosModel({
    required this.idPedido,
    required this.dataPedido,
    required this.dataAgendamento,
    required this.notaPedido,
    required this.nomePrato,
    required this.descricaoPrato,
  });

  factory PedidosModel.fromJson(Map<String, dynamic> json) {
    return PedidosModel(
      idPedido: json['id_pedido'] ?? 0,
      dataPedido: json['data_pedido'] ?? '',
      notaPedido: json['nota_pedido'] ?? 0,
      nomePrato: json['nome_prato'] ?? '',
      descricaoPrato: json['descricao_prato'] ?? '',
      dataAgendamento: json['data_agendamento'] ?? '',
    );
  }

  static Future<List<PedidosModel>> obterPedidosDia(String token) async {
    final url = Uri.parse('http://10.141.46.20/gerdau-api/api-gerdau/endpoints/listarPedidosPorUsuario.php');
    final response = await http.get(url, headers: {'authorization': token});
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);

      // Verifica se a chave 'dados' existe e contém uma lista
      if (decodedJson.containsKey('dados') && decodedJson['dados'] is List) {
        final List<dynamic> dados = decodedJson['dados'];
        return dados.map((pedidoJson) => PedidosModel.fromJson(pedidoJson)).toList();
      } else {
        throw Exception('Formato de resposta inválido ou dados ausentes.');
      }
    } else {
      throw Exception('Falha ao carregar os pedidos.');
    }
  }
}
