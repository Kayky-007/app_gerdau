import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/login_controller.dart';
import 'package:login_gerdau/view/components/appbar_components.dart';
import 'package:login_gerdau/view/components/espacamento_h.dart';

class InicioView extends StatefulWidget {
  const InicioView({super.key});

  @override
  State<InicioView> createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  String? nomeUsuario;
  String? emailUsuario;

  final LoginController _controller = LoginController();

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    _carregarDadosPerfil();
  }

   Future<void> _carregarDadosPerfil() async {
    // Recupera os dados armazenados ou da API
    final nome = await _controller.obterNomeUsuario();
    final email = await _controller.obterEmailUsuario();

    setState(() {
      nomeUsuario = nome;
      emailUsuario = email;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          AppbarfotoComponents(title: 'Inicio'),
        ],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 20,
                          child: Image(image: AssetImage('assets/images/redondoPerfil.jpg')),
                        ),
                        const SizedBox(width: 15),
                         Text(
                          'Olá, ${nomeUsuario ?? "Carregando..."}!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
                EspacamentoH(h: 16),
                    Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 126, 112, 51),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: const [
                      Text(
                        'Informações Importante',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Aproveite seu dia com um delicioso almoço e faça seu pedido agora mesmo!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          
                        ),
                        textAlign: TextAlign.center,
                        
                      ),
                      
                    ],
                  ),
                ),
                // Aqui está o calendário usando table_calendar
             
                 EspacamentoH(h: 12),
                const Text(
                  'Aqui está um resumo do seu dia:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 73, 73, 73)
                  ),
                ),
                EspacamentoH(h: 12),                    
                // Cartões de resumo
                GestureDetector(
                  onTap: () {
                   Navigator.pushNamed(context, '/cardapio');
                  },
                  child: Card(
                    color: Color.fromARGB(255, 187, 156, 82),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      leading: Icon(Icons.fastfood_rounded, color: Color.fromARGB(255, 255, 255, 255)),
                      title: Text('Bora almoçar?', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                      subtitle: Text('Faça seu pedido agora mesmo!', style: TextStyle(color: Colors.white70)),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                    ),
                  ),
                ),
                    
                EspacamentoH(h: 20),
                Card(
                  color: Color.fromARGB(255, 187, 156, 82),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.shopping_cart, color: Color.fromARGB(255, 255, 255, 255)),
                    title: Text('Último Pedido', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
                    subtitle: Text('Frango Frito - 12:43 PM', style: TextStyle(color: Colors.white70)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                  ),
                ),
                    
                EspacamentoH(h: 16),
                Card(
                  color: Color.fromARGB(255, 187, 156, 82),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.star, color: Color.fromARGB(255, 255, 255, 255)),
                    title: Text('Avaliações', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
                    subtitle: Text('Avalie o serviço e a comida!', style: TextStyle(color: Colors.white70)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
