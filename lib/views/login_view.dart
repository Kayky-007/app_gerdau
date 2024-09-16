
import 'package:flutter/material.dart';
import 'package:login_gerdau/components/espacamento_h.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login - Avaliação Refeitorio',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromRGBO(9, 68, 121, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo_gerdau.png',
                      width: 150,
                      height: 150,
                    ),
                    EspacamentoH(h: 10),
                    TextField(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('Esqueci minha senha'),
                        ),
                        Row(
                          children: [
                            Text('Lembrar-me'),
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    EspacamentoH(h: 15),
                    
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/painel');
                      },
                      child: const Text('Entrar'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromRGBO(9, 68, 121, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
