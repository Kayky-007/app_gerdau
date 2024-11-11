import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_gerdau/model/pedidos_model.dart';

class PedidosController {
  FlutterSecureStorage storage = FlutterSecureStorage();

  // Método para obter dados de pedidos usando o token armazenado
  Future<List<PedidosModel>> obterPedidosDia() async {
    // Recupera o token do armazenamento seguro
    String? token = await storage.read(key: 'token');

    if (token != null && token.isNotEmpty) {
      // Chama o método para obter a lista de pedidos
      return await PedidosModel.obterPedidosDia(token);
    } else {
      throw Exception('Token não encontrado. O login é necessário.');
    }
  }
}
