import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/login_controller.dart';
import 'package:login_gerdau/view/components/appbar_components.dart';
import 'package:login_gerdau/view/components/espacamento_h.dart';
import 'package:login_gerdau/view/login_view.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  String? nomeUsuario;
  String? emailUsuario;

  final LoginController _controller = LoginController();

  @override
  void initState() {
    super.initState();
    _carregarDadosPerfil();
  }

  // Método para carregar dados do perfil (nome e email)
  Future<void> _carregarDadosPerfil() async {
    // Recupera os dados armazenados ou da API
    final nome = await _controller.obterNomeUsuario();
    final email = await _controller.obterEmailUsuario();

    setState(() {
      nomeUsuario = nome;
      emailUsuario = email;
    });
  }

  // Método para chamar o logout e redirecionar para a tela de login
  Future<void> _logout() async {
    // Chama o método de logout
    await _controller.logout();

    // Limpa as variáveis de perfil
    setState(() {
      nomeUsuario = null;
      emailUsuario = null;
    });

    // Redireciona para a tela de login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          AppbarfotoComponents(title: 'Perfil'),
        ],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/images/redondoPerfil.jpg',
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const EspacamentoH(h: 10),
                            Text(
                              nomeUsuario ?? 'Nome não disponível',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const EspacamentoH(h: 10),
                            Text(
                              emailUsuario ?? 'E-mail não disponível',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 40, thickness: 1),
              const EspacamentoH(h: 15),
              const ListTile(
                leading: Icon(Icons.work),
                title: Text('Cargo'),
                subtitle: Text('Encarregado Deposito'),
              ),
              const ListTile(
                leading: Icon(Icons.business),
                title: Text('Departamento'),
                subtitle: Text('Administrativo'),
              ),
              const ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Localização'),
                subtitle: Text('Pindamonhangaba - SP'),
              ),
              const ListTile(
                leading: Icon(Icons.badge),
                title: Text('Chapa'),
                subtitle: Text('023211-0'),
              ),
              const EspacamentoH(h: 23),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _logout, // Chama o método de logout
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromRGBO(121, 9, 9, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                    ),
                    child: const Text('Sair'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
