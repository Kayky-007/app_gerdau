import 'dart:convert';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:http/http.dart' as http;

class PedidosModel {
  final int idPrato;
  final int idPedido;
  final String dataPedido;
  final String dataAgendamento;
  final int notaPedido;
  final String nomePrato;
  final String descricaoPrato;

  PedidosModel({
    required this.idPrato,
    required this.idPedido,
    required this.dataPedido,
    required this.dataAgendamento,
    required this.notaPedido,
    required this.nomePrato,
    required this.descricaoPrato,
  });

  factory PedidosModel.fromJson(Map<String, dynamic> json) {
    return PedidosModel(
      idPrato: json['id_prato'] ?? 0,
      idPedido: json['id_pedido'] ?? 0,
      dataPedido: json['data_pedido'] ?? '',
      notaPedido: json['nota_pedido'] ?? 0,
      nomePrato: json['nome_prato'] ?? '',
      descricaoPrato: json['descricao_prato'] ?? '',
      dataAgendamento: json['data_do_agendamento'] ?? '',
    );
  }

  static Future<List<PedidosModel>> obterPedidosDia(String token) async {
    final url = Uri.parse('http://10.141.46.20/gerdau-api/api-gerdau/endpoints/listarPedidosPorUsuario.php');
    final response = await http.get(url, headers: {'authorization': token});
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);

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

  // Função para cancelar o pedido
  static Future<bool> cancelarPedido(int idPedido, String token) async {
    try {
      final url = Uri.parse('http://10.141.46.20/gerdau-api/api-gerdau/endpoints/excluirPedidoUsuario.php');
      final response = await http.post(
        url,
        headers: {'authorization': token},
        body: {'id_pedido': idPedido.toString()},
      );

      final responseData = json.decode(response.body);

      if (responseData['dados']['sucesso']) {
        AlertController.show(
          "Pedido Cancelado",
          "Seu pedido foi cancelado com sucesso!",
          TypeAlert.success,
        );
        return true;
      } else {
        AlertController.show(
          "Erro ao Cancelar Pedido",
          responseData['dados']['mensagem'] ?? "Houve um erro ao tentar cancelar o pedido.",
          TypeAlert.error,
        );
        return false;
      }
    } catch (e) {
      AlertController.show(
        "Erro de Conexão",
        "Ocorreu um erro ao tentar se conectar ao servidor.",
        TypeAlert.error,
      );
      return false;
    }
  }
}
