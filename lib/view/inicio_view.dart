import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/login_controller.dart';
import 'package:login_gerdau/view/login_view.dart';

class InicioView extends StatefulWidget {
  const InicioView({Key? key}) : super(key: key);

  @override
  State<InicioView> createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  final LoginController _controller = LoginController(); // Instância do controlador

  Future<void> _logout() async {
    // Chama o método de logout do controlador
    await _controller.logout();

    // Redireciona para a tela de login após o logout
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo que cobre toda a tela
          Positioned.fill(
            child: Image.asset(
              'assets/images/imagem_fundo.jpg', // Substitua pelo caminho da imagem de fundo
              fit: BoxFit.cover,
            ),
          ),
          // Conteúdo principal
          Column(
            children: [
              const SizedBox(height: 60), // Espaçamento inicial
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Imagem dentro de um cartão
                        Card(
                          color: Colors.white, // Fundo branco do cartão
                          elevation: 6, // Sombra do cartão
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Bordas arredondadas
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/logo_gr_card.png', // Caminho da imagem
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16), // Espaçamento entre card e texto
                        // Descrição
                        Text(
                          "SOLUÇÕES EM ALIMENTAÇÃO E EM SERVIÇOS DE SUPORTE",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 24), // Espaçamento entre texto e botões
                        // Botões (duas linhas com dois botões cada)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildMenuButton(
                              icon: Icons.menu_book,
                              label: "CARDÁPIO",
                              onTap: () {
                                Navigator.pushNamed(context, '/cardapio');
                              },
                            ),
                            _buildMenuButton(
                              icon: Icons.request_page,
                              label: "PEDIDOS",
                              onTap: () {
                                Navigator.pushNamed(context, '/pedidos');
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16), // Espaçamento entre as linhas
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildMenuButton(
                              icon: Icons.account_circle,
                              label: "PERFIL",
                              onTap: () {
                                Navigator.pushNamed(context, '/perfil');
                              },
                            ),
                            _buildMenuButton(
                              icon: Icons.logout,
                              label: "SAIR",
                              onTap: _logout, // Chama o método de logout
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Método para criar botões do menu
  Widget _buildMenuButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 187, 156, 82),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 150, // Altura fixa para o botão
          width: MediaQuery.of(context).size.width * 0.4, // Largura proporcional
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 40),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
