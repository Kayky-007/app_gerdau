import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginModel {
  String? email_usuario;
  String? senha_usuario;
  final storage = FlutterSecureStorage(); // Instância do storage

  LoginModel({this.email_usuario, this.senha_usuario});

  // Método para logar e obter o token
  Future<String?> logar() async {
    // Verificação de dados vazios ou nulos
    if (email_usuario == null || email_usuario!.isEmpty) {
      throw Exception('Por favor, forneça o email.');
    }

    if (senha_usuario == null || senha_usuario!.isEmpty) {
      throw Exception('Por favor, forneça a senha.');
    }

    try {
      // Criando o corpo da requisição no formato 'x-www-form-urlencoded'
      final body = {
        'email_usuario': email_usuario!,
        'senha_usuario': senha_usuario!,
      };

      // Realizando a requisição POST com o formato de formulário
      final response = await http.post(
        Uri.parse('http://10.141.46.20/gerdau-api/api-gerdau/endpoints/login.php'),
        body: body, // Corpo no formato x-www-form-urlencoded
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded', // Cabeçalho indicando que o corpo é 'x-www-form-urlencoded'
        },
      );

      // Log de status da resposta
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Verificando se a resposta foi bem-sucedida (status 200)
      if (response.statusCode == 200) {
        try {
          // Tentando decodificar a resposta (pode ser JSON)
          Map<String, dynamic> resposta = jsonDecode(response.body);

          // Log da resposta decodificada
          print('Resposta da API (decodificada): $resposta');

          // Verificando se o login foi bem-sucedido e se o token está presente
          if (resposta['sucesso'] == true) {
            // Garantindo que o token está presente na resposta
            if (resposta['token'] != null) {
              String token = resposta['token'];

              // Armazenar o token no FlutterSecureStorage
              await storage.write(key: 'token', value: token);

              // Armazenar nome e e-mail do usuário
              await storage.write(key: 'nome_usuario', value: resposta['nome_usuario']);
              await storage.write(key: 'email_usuario', value: resposta['email_usuario']);

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
  Future<String?> obterEmailUsuario() async {
    return await storage.read(key: 'email_usuario');
  }
}
