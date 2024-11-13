import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_gerdau/model/pratos_model.dart';

class PratosController {
  FlutterSecureStorage storage = FlutterSecureStorage();

  // Método para obter dados de pratos usando o token armazenado e o dia
  Future<PratosModel> obterDadosPratos(String diaAPI) async {
    // Recupera o token do armazenamento seguro
    String? token = await storage.read(key: 'token');

    // Verifica se o token está disponível
    if (token != null && token.isNotEmpty) {
      // Usa o token e o diaAPI para buscar os dados dos pratos
      PratosModel pratosModel = await PratosModel.dadosPratos(token, diaAPI);
      return pratosModel;
    } else {
      throw Exception('É necessário fazer login.');
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
