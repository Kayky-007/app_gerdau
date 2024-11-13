import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_gerdau/model/pedidos_model.dart';

class PedidosController {
  FlutterSecureStorage storage = FlutterSecureStorage();

  // Método para obter dados de pedidos
  Future<List<PedidosModel>> obterPedidosDia() async {
    String? token = await storage.read(key: 'token');

    if (token != null && token.isNotEmpty) {
      return await PedidosModel.obterPedidosDia(token);
    } else {
      throw Exception('Token não encontrado. O login é necessário.');
    }
  }

  // Método para cancelar pedido
  Future<bool> cancelarPedido(int idPedido) async {
    String? token = await storage.read(key: 'token');

    if (token != null && token.isNotEmpty) {
      return await PedidosModel.cancelarPedido(idPedido, token);
    } else {
      throw Exception('Token não encontrado. O login é necessário.');
    }
  }

  // Método para enviar a avaliação do pedido
  Future<void> enviarAvaliacao(int idPedido, int notaPedido, Function onSuccess) async {
    String? token = await storage.read(key: 'token');

    if (token != null && token.isNotEmpty) {
      // Passa a função de callback `onSuccess` para o método `enviarAvaliacao`
      await PedidosModel.enviarAvaliacao(idPedido, notaPedido, token, onSuccess);
    } else {
      throw Exception('Token não encontrado. O login é necessário.');
    }
  }
}


