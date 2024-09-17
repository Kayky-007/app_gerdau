import 'package:flutter/material.dart';
import 'package:login_gerdau/components/espacamento_h.dart';

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
        title: const Text('Perfil'),
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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/redondoPerfil.jpg',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const EspacamentoH(h: 10),
                        const Text(
                          'Kayky da Silva Costa',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const EspacamentoH(h: 10),
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
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
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
            )
          ],
        ),
      ),
    );
  }
}