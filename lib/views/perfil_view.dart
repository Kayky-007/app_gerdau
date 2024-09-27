import 'package:flutter/material.dart';
import 'package:login_gerdau/views/components/espacamento_h.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Ação para editar o perfil
            },
          ),
        ],
      ),
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
                      padding: EdgeInsets.all(20.0),
                      child: Column(children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/redondoPerfil.jpg',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        EspacamentoH(h: 10),
                        const Text(
                          'Kayky da Silva Costa',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        EspacamentoH(h: 10),
                        const Text(
                          'kayky7costa@hotmail.com',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 40, thickness: 1),
            EspacamentoH(h: 15),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Cargo'),
              subtitle: const Text('Encarregado Deposito'),
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Departamento'),
              subtitle: const Text('Administrativo'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Localização'),
              subtitle: const Text('Pindamonhangaba - SP'),
            ),
            ListTile(
              leading: const Icon(Icons.badge),
              title: const Text('Chapa'),
              subtitle: const Text('023211-0'),
            ),
            EspacamentoH(h: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text('Sair'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(121, 9, 9, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}