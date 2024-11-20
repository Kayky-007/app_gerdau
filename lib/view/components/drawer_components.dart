import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/login_controller.dart';
import 'package:login_gerdau/view/login_view.dart';

class CustomDrawer extends StatelessWidget {
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FutureBuilder<Map<String, String?>>(
            future: _carregarDadosUsuario(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Mostra um indicador de progresso enquanto os dados estão sendo carregados
                return DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 187, 156, 82),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                );
              } else if (snapshot.hasData) {
                // Dados do usuário carregados com sucesso
                final nomeUsuario = snapshot.data?['nome'] ?? 'Usuário';
                return DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 187, 156, 82),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Fecha o Drawer
                          Navigator.pushReplacementNamed(context, '/perfil'); // Navega para a tela de perfil
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            'assets/images/redondoPerfil.jpg',
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Bem-vindo, $nomeUsuario!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                // Caso ocorra algum erro ao carregar os dados
                return DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 187, 156, 82),
                  ),
                  child: Center(
                    child: Text(
                      'Erro ao carregar dados',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
            },
          ),
          // Itens do menu
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  context: context,
                  icon: Icons.home,
                  label: 'Início',
                  route: '/inicio',
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.menu_book,
                  label: 'Cardápio',
                  route: '/cardapio',
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.request_page,
                  label: 'Pedidos',
                  route: '/pedidos',
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.person,
                  label: 'Perfil',
                  route: '/perfil',
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text(
              'Sair',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => _logout(context), // Chama o método de logout
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String route,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        label,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () {
        Navigator.pop(context); // Fecha o Drawer
        Navigator.pushReplacementNamed(context, route); // Navega para a rota
      },
    );
  }

  // Método para carregar dados do usuário
  Future<Map<String, String?>> _carregarDadosUsuario() async {
    final nome = await _controller.obterNomeUsuario();
    final email = await _controller.obterEmailUsuario();
    return {'nome': nome, 'email': email};
  }

  // Método para logout
  Future<void> _logout(BuildContext context) async {
    // Chama o método de logout do controlador
    await _controller.logout();

    // Redireciona para a tela de login após o logout
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }
}
