import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/login_controller.dart';
import 'package:login_gerdau/view/components/espacamento_h.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isLoading = false; // Para mostrar o indicador de carregamento
  LoginController _controller = LoginController();

  // Função para tentar o login
  Future<void> _tentarLogin() async {
    setState(() {
      _isLoading = true; // Ativa o carregamento
    });

    try {
      bool sucesso = await _controller.logar(); // Chama o login

      if (sucesso) {
        // Se o login for bem-sucedido, redireciona para a tela inicial
        Navigator.pushReplacementNamed(context, '/inicio');
      } else {
        // Caso o login falhe
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuário e/ou senha inválidos.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário e/ou senha inválidos.')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(
      //     child: const Text(
      //       'Login - Avaliação Refeitorio',
      //       style: TextStyle(
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      //   backgroundColor: Color.fromRGBO(129, 108, 12, 1),
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/imagem_fundo.jpg'), // Substitua pelo caminho da sua imagem de fundo
              fit: BoxFit.cover, // Ajusta para cobrir toda a tela
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logoGRSA_login.png',
                          width: 150,
                          height: 150,
                        ),
                        EspacamentoH(h: 5),
                        TextField(
                          controller: _controller.chapa_usuario,
                          decoration: InputDecoration(
                            labelText: 'Chapa',
                            prefixIcon:
                                Icon(Icons.badge, color: Colors.blueGrey[800]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        EspacamentoH(h: 17),
                        TextField(
                          controller: _controller.senha_usuario,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            prefixIcon:
                                Icon(Icons.lock, color: Colors.blueGrey[800]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        EspacamentoH(h: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : _tentarLogin, // Desativa o botão enquanto o login está sendo processado
                            child: _isLoading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text('Entrar'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color.fromARGB(255, 187, 156, 82),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                          ),
                        ),
                        EspacamentoH(h: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
