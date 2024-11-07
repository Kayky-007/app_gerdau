import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_gerdau/model/login_model.dart';

class LoginController {
  TextEditingController email_usuario = TextEditingController();
  TextEditingController senha_usuario = TextEditingController();
  FlutterSecureStorage storage = FlutterSecureStorage();
  LoginModel loginModel = LoginModel();
  String? token;

  // Método para fazer login
  Future<bool> logar() async {
    loginModel.email_usuario = email_usuario.text;
    loginModel.senha_usuario = senha_usuario.text;

    // Obtendo o token e outros dados após o login
    String? token = await loginModel.logar();

    if (token != null && token.isNotEmpty) {
      // Armazenando o token no armazenamento seguro
      await storage.write(key: 'token', value: token);

      // Armazenando o nome e e-mail do usuário
      String? nomeUsuario = await loginModel.obterNomeUsuario();
      String? emailUsuario = await loginModel.obterEmailUsuario();

      if (nomeUsuario != null && emailUsuario != null) {
        await storage.write(key: 'nome_usuario', value: nomeUsuario);
        await storage.write(key: 'email_usuario', value: emailUsuario);
      }

      return true; // Login bem-sucedido
    }

    return false; // Caso o login falhe
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

  // Método para limpar dados (logout)
  Future<void> logout() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'nome_usuario');
    await storage.delete(key: 'email_usuario');
  }
}
