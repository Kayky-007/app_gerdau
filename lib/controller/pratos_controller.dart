import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_gerdau/model/pratos_modal.dart';

class PratosController {
  FlutterSecureStorage storage = FlutterSecureStorage();

  // Método para obter dados de pratos usando o token armazenado
  Future<PratosModel> obterDadosPratos() async {
    // Recupera o token do armazenamento seguro
    String? token = await storage.read(key: 'token');

    // Verifica se o token está disponível
    if (token != null && token.isNotEmpty) {
      // Usa o token para buscar os dados dos pratos
      PratosModel pratosModel = await PratosModel.dadosPratos(token);
      
      return pratosModel;
    } else {
      throw Exception('É necessário fazer login.');
    }
  }
}
