import 'package:login_gerdau/model/pratos_modal.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PratosController {
  final storage = FlutterSecureStorage();

  Future<PratosModel> obterDadosPratos(String diaAPI) async {
    // Recupera o token do armazenamento seguro
    String? token = await storage.read(key: 'token');

    // Verifique se o token está disponível
    if (token != null && token.isNotEmpty) {
      // Usa o token e a data para buscar os dados dos pratos
      PratosModel pratosModel = await PratosModel.dadosPratos(token, diaAPI);
      print(pratosModel.ingredientes);
      print(pratosModel.nomePrato);
      return pratosModel;
    } else {
      throw Exception('É necessário fazer login.');
    }
  }
}
