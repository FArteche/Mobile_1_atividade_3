import 'package:flutter/material.dart';

class CardC extends StatelessWidget {
  final String nome;
  final double autonomia;
  final Function() onRemove;

  CardC({required this.nome, required this.autonomia, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 254, 186),
      shadowColor: Colors.black45,
      elevation: 20,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.car_crash_sharp),
                const SizedBox(width: 50,),
                Column(
                  children: [
                    Text("Veículo: $nome"),
                    Text("Autonomia: $autonomia"),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {
              onRemove();
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
