import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginModel {
  String? chapa_usuario;
  String? senha_usuario;
  final storage = FlutterSecureStorage(); // Instância do storage

  LoginModel({this.chapa_usuario, this.senha_usuario});

  // Método para logar e obter o token
  Future<String?> logar() async {
    // Verificação de dados vazios ou nulos
    if (chapa_usuario == null || chapa_usuario!.isEmpty) {
      throw Exception('Por favor, forneça o email.');
    }

    if (senha_usuario == null || senha_usuario!.isEmpty) {
      throw Exception('Por favor, forneça a senha.');
    }

    try {
      // Criando o corpo da requisição no formato 'x-www-form-urlencoded'
      final body = {
        'chapa_usuario': chapa_usuario!,
        'senha_usuario': senha_usuario!,
      };

      // Realizando a requisição POST com o formato de formulário
      final response = await http.post(
        Uri.parse('http://192.168.0.72/api-gerdau/endpoints/loginPorChapa.php'),
        body: body, // Corpo no formato x-www-form-urlencoded
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded', // Cabeçalho indicando que o corpo é 'x-www-form-urlencoded'
        },
      );

      // Log de status da resposta
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      // Verificando se a resposta foi bem-sucedida (status 200)
      if (response.statusCode == 200) {
        try {
          // Tentando decodificar a resposta (pode ser JSON)
          Map<String, dynamic> resposta = jsonDecode(response.body);

          // Log da resposta decodificada
          // print('Resposta da API (decodificada): $resposta');

          // Verificando se o login foi bem-sucedido e se o token está presente
          if (resposta['sucesso'] == true) {
            // Garantindo que o token está presente na resposta
            if (resposta['token'] != null) {
              String token = resposta['token'];

              // Armazenar o token no FlutterSecureStorage
              await storage.write(key: 'token', value: token);

              // Armazenar nome e e-mail do usuário
              await storage.write(key: 'nome_usuario', value: resposta['nome_usuario']);
              await storage.write(key: 'chapa_usuario', value: resposta['chapa_usuario']);

              return token;
            } else {
              throw Exception('Token não encontrado na resposta');
            }
          } else {
            throw Exception('Falha no login: ${resposta['mensagem']}');
          }
        } catch (e) {
          // Captura de erro ao processar JSON
          throw Exception('Erro ao processar a resposta JSON: $e');
        }
      } else {
        // Caso a resposta não seja 200, mostramos a mensagem de erro retornada pela API
        throw Exception('Falha ao Logar: Status ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      // Tratando erros de requisição (tempo de rede, etc.)
      throw Exception('Erro ao fazer requisição: $e');
    }
  }

  // Método para recuperar o token armazenado
  Future<String?> obterToken() async {
    return await storage.read(key: 'token');
  }

  // Método para recuperar o nome do usuário armazenado
  Future<String?> obterNomeUsuario() async {
    return await storage.read(key: 'nome_usuario');
  }

  // Método para recuperar o e-mail do usuário armazenado
  Future<String?> obterChapaUsuario() async {
    return await storage.read(key: 'chapa_usuario');
  }
}
