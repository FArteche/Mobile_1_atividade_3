import 'package:atividade3/Model/carro.dart';
import 'package:atividade3/Model/destino.dart';
import 'package:atividade3/Model/preco_gasolina.dart';
import 'package:atividade3/menuCalculo.dart';
import 'package:atividade3/menuCarro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cálculo de Combustível',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

  List<carro> listCarro = [];
  List<destino> listDestino = [];
  List<preco_gasolina> listPreco = [];

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  static final List<Widget> _paginas = <Widget>[
    Menucalculo(
      listCarro: listCarro,
      listDestino: listDestino,
      listPreco: listPreco,
      ),
    Menucarro(listCarro: listCarro),
  ];

  void adicionarDestino(String nomeDestino, double distancia) {
    setState(() {
      listDestino.add(destino(nomeDestino: nomeDestino, distancia: distancia));
    });
  }

  void adicionarCombustivel(String tipo, double preco, DateTime data) {
    setState(() {
      listPreco.add(preco_gasolina(preco: preco, data: data, tipo: tipo));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Cálculo de Combustível',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 16, 55, 92),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 131, 23),
      ),
      body: IndexedStack(
        index: _index,
        children: _paginas,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: 'Calcular',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_crash_outlined),
            label: 'Veículo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Destino',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop_outlined),
            label: 'Combustível',
          ),
        ],
        currentIndex: _index,
        backgroundColor: const Color.fromARGB(255, 235, 131, 23),
        unselectedItemColor: const Color.fromARGB(255, 235, 131, 23),
        selectedItemColor: const Color.fromARGB(255, 16, 55, 92),
        onTap: _onItemTapped,
      ),
    );
  }
}
