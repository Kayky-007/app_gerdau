import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_gerdau/model/pratos_model.dart';

class PratosController {
  FlutterSecureStorage storage = FlutterSecureStorage();

  // Método para obter dados de pratos usando o token armazenado e o dia
  Future<PratosModel?> obterDadosPratos(String diaAPI) async {
    // Recupera o token do armazenamento seguro
    String? token = await storage.read(key: 'token');

    // Verifica se o token está disponível
    if (token != null && token.isNotEmpty) {
      // Usa o token e o diaAPI para buscar os dados dos pratos
      PratosModel? pratosModel = await PratosModel.dadosPratos(token, diaAPI,);
      return pratosModel;
    } else {
      throw Exception('É necessário fazer login.');
    }
  }

  Future<PratosModel?> obterDadosPratoDia(
      BuildContext context, String diaAPI, int idPrato) async {
    try {
      // Recupera o token do armazenamento seguro
      String? token = await storage.read(key: 'token');

      // Verifica se o token está disponível
      if (token != null && token.isNotEmpty) {
        // Usa o token e o diaAPI para buscar os dados dos pratos
        PratosModel? pratosModel =
            await PratosModel.dadosPratosPorDia(context, token, diaAPI, idPrato);

        if (pratosModel == null) {
          // Mostra um alerta caso nenhum prato seja encontrado
          AlertController.show(
            "Erro",
            "Nenhum prato encontrado para a data selecionada.",
            TypeAlert.error,
          );
        }
        return pratosModel;
      } else {
        throw Exception('É necessário fazer login.');
      }
    } catch (e) {
      // Lida com erros gerais
      AlertController.show(
        "Erro",
        e.toString(),
        TypeAlert.error,
      );
      return null;
    }
  }

  // Método para listar pratos do cardápio por dia 
  Future<PratosModel> listarPratoCardapioDia(int idPrato, String dataCardapio) async {
    // Recupera o token do armazenamento seguro
    String? token = await storage.read(key: 'token');

    // Verifica se o token está disponível
    if (token != null && token.isNotEmpty) {
      // Faz a requisição com os parâmetros idPrato e dataCardapio
      return await PratosModel.listarPratoCardapioDia(token, idPrato, dataCardapio);
    } else {
      throw Exception('Token não encontrado. O login é necessário.');
    }
  }
}
