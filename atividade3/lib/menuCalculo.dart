import 'package:atividade3/Model/carro.dart';
import 'package:atividade3/Model/destino.dart';
import 'package:atividade3/Model/preco_gasolina.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Menucalculo extends StatefulWidget {
  List<carro> listCarro;
  List<destino> listDestino;
  List<preco_gasolina> listPreco;

  Menucalculo(
      {required this.listCarro,
      required this.listDestino,
      required this.listPreco});

  @override
  State<Menucalculo> createState() => _MenucalculoState();
}

class _MenucalculoState extends State<Menucalculo> {
  carro? _carroSelecionado;
  destino? _destinoSelecionado;
  preco_gasolina? _precoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 16, 55, 92),
      ),
      child: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 235, 131, 23),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                ),
                const Text(
                  'Selecione um veículo:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 16, 55, 92),
                  ),
                ),
                DropdownButton<carro>(
                  style: const TextStyle(
                    color: Color.fromARGB(255, 16, 55, 92),
                  ),
                  dropdownColor: const Color.fromARGB(255, 244, 246, 200),
                  hint: const Text('Veículos'),
                  value: _carroSelecionado,
                  onChanged: (carro? novoCarro) {
                    setState(() {
                      _carroSelecionado = novoCarro;
                    });
                  },
                  items: widget.listCarro.map((carro carros) {
                    return DropdownMenuItem<carro>(
                      value: carros,
                      child: Text(carros.toString()),
                    );
                  }).toList(),
                ),
                const Text(
                  'Selecione um Destino:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 16, 55, 92),
                  ),
                ),
                DropdownButton<destino>(
                  style: const TextStyle(
                    color: Color.fromARGB(255, 16, 55, 92),
                  ),
                  dropdownColor: const Color.fromARGB(255, 244, 246, 200),
                  hint: const Text('Destinos'),
                  value: _destinoSelecionado,
                  onChanged: (destino? novoDestino) {
                    setState(() {
                      _destinoSelecionado = novoDestino;
                    });
                  },
                  items: widget.listDestino.map((destino destinos) {
                    return DropdownMenuItem<destino>(
                      value: destinos,
                      child: Text(destinos.toString()),
                    );
                  }).toList(),
                ),
                const Text(
                  'Selecione um combustível:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 16, 55, 92),
                  ),
                ),
                DropdownButton<preco_gasolina>(
                  style: const TextStyle(
                    color: Color.fromARGB(255, 16, 55, 92),
                  ),
                  dropdownColor: const Color.fromARGB(255, 244, 246, 200),
                  hint: const Text('Combustível'),
                  value: _precoSelecionado,
                  onChanged: (preco_gasolina? novoCombustivel) {
                    setState(() {
                      _precoSelecionado = novoCombustivel;
                    });
                  },
                  items: widget.listPreco.map((preco_gasolina precos) {
                    return DropdownMenuItem<preco_gasolina>(
                      value: precos,
                      child: Text(precos.toString()),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.listCarro.add(
                        carro(
                          nome: "Vectra",
                          autonomia: 14.7,
                        ),
                      );
                      widget.listDestino.add(
                        destino(
                          nomeDestino: "Raio que o parta",
                          distancia: 50.01,
                        ),
                      );
                      widget.listPreco.add(
                        preco_gasolina(
                          preco: 5.5,
                          data: DateTime(2024, 10, 24),
                          tipo: "Alcool",
                        ),
                      );
                    });
                  },
                  child: const Text("Adicionar Carro"),
                ),
                Text(
                    "$_carroSelecionado / $_destinoSelecionado / $_precoSelecionado"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
