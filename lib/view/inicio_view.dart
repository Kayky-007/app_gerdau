import 'package:flutter/material.dart';
import 'package:login_gerdau/view/components/appbar_components.dart';
import 'package:login_gerdau/view/components/espacamento_h.dart';
import 'package:table_calendar/table_calendar.dart';

class InicioView extends StatefulWidget {
  const InicioView({super.key});

  @override
  State<InicioView> createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
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
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          'Olá, (Nome)!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
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
                    color: const Color.fromARGB(255, 1, 52, 96),
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
                        'Informações do Dia',
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
                TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },

                  calendarStyle: const CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    
                    weekendTextStyle: TextStyle(color: Colors.red),
                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    leftChevronIcon: Icon(Icons.chevron_left),
                    rightChevronIcon: Icon(Icons.chevron_right),
                  ),
                ),
                 EspacamentoH(h: 12),
                const Text(
                  'Aqui está um resumo do seu dia:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                EspacamentoH(h: 12),                    
                // Cartões de resumo
                Card(
                  color: const Color.fromARGB(255, 1, 52, 96),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.fastfood_rounded, color: Color.fromARGB(255, 255, 46, 46)),
                    title: Text('Bora almoçar?', style: TextStyle(color: Color.fromRGBO(255, 204, 0, 1))),
                    subtitle: Text('Faça seu pedido agora mesmo!', style: TextStyle(color: Colors.white)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                  ),
                ),
                    
                EspacamentoH(h: 20),
                Card(
                  color: const Color.fromARGB(255, 1, 52, 96),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.shopping_cart, color: Colors.blueAccent),
                    title: Text('Último Pedido', style: TextStyle(color: Color.fromRGBO(255, 204, 0, 1))),
                    subtitle: Text('Frango Frito - 12:43 PM', style: TextStyle(color: Colors.white)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                  ),
                ),
                    
                EspacamentoH(h: 16),
                Card(
                  color: const Color.fromARGB(255, 1, 52, 96),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.star, color: Color.fromARGB(255, 255, 196, 46)),
                    title: Text('Avaliações', style: TextStyle(color: Color.fromRGBO(255, 204, 0, 1))),
                    subtitle: Text('Avalie o serviço e a comida!', style: TextStyle(color: Colors.white)),
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
