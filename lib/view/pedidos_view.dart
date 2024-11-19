import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/pedidos_controller.dart';
import 'package:login_gerdau/view/components/appbar_components.dart';
import 'package:login_gerdau/view/components/cardPedidos.dart';
import 'package:login_gerdau/model/pedidos_model.dart';
import 'package:intl/intl.dart';

class PedidosView extends StatefulWidget {
  const PedidosView({super.key, this.passback});
  final Function? passback;

  @override
  State<PedidosView> createState() => _PedidosViewState();
}

class _PedidosViewState extends State<PedidosView> {
  late List<PedidosModel> _pedidos = [];
  late List<PedidosModel> _pedidosFiltrados = [];
  bool _isLoading = true;
  bool _exibirPedidosNaoAvaliados = false;
  final PedidosController _pedidosController = PedidosController();

  @override
  void initState() {
    super.initState();
    _carregarPedidos();
    PedidosView();
_pedidos;
_pedidosFiltrados;

  
  }

  Future<void> _carregarPedidos() async {
    try {
      final pedidos = await _pedidosController.obterPedidosDia();
      setState(() {
        _pedidos = pedidos;
        _pedidosFiltrados = pedidos; // Inicialmente, todos os pedidos
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
   
    }
  }

  void _atualizarListaPedidos(int idPedidoCancelado) {
    setState(() {
      _pedidos.removeWhere((pedido) => pedido.idPedido == idPedidoCancelado);
      _pedidosFiltrados.removeWhere((pedido) => pedido.idPedido == idPedidoCancelado);
    });
  }

  void _atualizarAvaliacaoPedido(int idPedido, int novaNota) {
    setState(() {
      final pedidoIndex = _pedidos.indexWhere((pedido) => pedido.idPedido == idPedido);
      if (pedidoIndex != -1) {
        _pedidos[pedidoIndex].notaPedido = novaNota;
      }

      // Se os pedidos filtrados estão visíveis (pedidos não avaliados), atualiza também a lista filtrada.
      if (_exibirPedidosNaoAvaliados) {
        _pedidosFiltrados = _pedidos.where((pedido) => pedido.notaPedido == 0).toList();
      } else {
        _pedidosFiltrados = _pedidos;
      }
    });
  }

  // Função para formatar a data
  String formatarData(String data) {
    DateTime dateTime = DateTime.parse(data);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  void _filtrarPedidos(bool exibirNaoAvaliados) {
    setState(() {
      _exibirPedidosNaoAvaliados = exibirNaoAvaliados;
      if (exibirNaoAvaliados) {
        // Filtro para exibir apenas pedidos não avaliados
        _pedidosFiltrados = _pedidos.where((pedido) => pedido.notaPedido == 0).toList();
      } else {
        // Exibe todos os pedidos
        _pedidosFiltrados = _pedidos;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          AppbarfotoComponents(title: 'Pedidos'),
        ],
        body: Column(
          children: [
            // Botões de filtro
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Botão "Todos os Pedidos"
                  GestureDetector(
                    onTap: () => _filtrarPedidos(false),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: !_exibirPedidosNaoAvaliados ? Colors.amber : Colors.transparent,
                            width: 2, // Espessura da borda
                          ),
                        ),
                      ),
                      child: Text(
                        'Todos os Pedidos',
                        style: TextStyle(
                          color: !_exibirPedidosNaoAvaliados ? Colors.black : Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  // Botão "Pedidos Não Avaliados"
                  GestureDetector(
                    onTap: () => _filtrarPedidos(true),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _exibirPedidosNaoAvaliados ? Colors.amber : Colors.transparent,
                            width: 2, // Espessura da borda
                          ),
                        ),
                      ),
                      child: Text(
                        'Pedidos Não Avaliados',
                        style: TextStyle(
                          color: _exibirPedidosNaoAvaliados ? Colors.black : Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Exibição de pedidos
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : _exibirPedidosNaoAvaliados && _pedidosFiltrados.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            'Nenhum pedido não avaliado.',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _pedidosFiltrados.length,
                          itemBuilder: (context, index) {
                            final pedido = _pedidosFiltrados[index];
                            final dataAgendamentoFormatada = formatarData(pedido.dataAgendamento);
                            final dataPedidoFormatada = formatarData(pedido.dataPedido);
                            // Enviando informações pro CardPedidos
                            return Column(
                              children: [
                                CardPedidos(
                                  idPrato: pedido.idPrato,
                                  nomePrato: pedido.nomePrato,
                                  descricao: pedido.descricaoPrato,
                                  dataAgendamento: dataAgendamentoFormatada,
                                  notaPedido: pedido.notaPedido,
                                  dataPedido: dataPedidoFormatada,
                                  imagemPath: 'assets/images/comida_card.png',
                                  idPedido: pedido.idPedido,
                                  onPedidoCancelado: _atualizarListaPedidos,
                                  onAvaliarPedido: (int idPedido) {
                                    // Chama _atualizarAvaliacaoPedido com a nota predeterminada
                                    _atualizarAvaliacaoPedido(idPedido, 5); // Exemplo: Atualizar nota para 5
                                  },
                                ),
                                SizedBox(height: 20),
                              ],
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
      // FloatingActionButton posicionado no canto inferior direito
      floatingActionButton: Positioned(
        bottom: 16,
        right: 16,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _carregarPedidos();
              _filtrarPedidos(false);
            });
          },
          backgroundColor: Color.fromRGBO(129, 108, 12, 1),
          foregroundColor: Colors.white,
          child: Icon(Icons.restart_alt),
        ),
      ),
    );
  }
}
