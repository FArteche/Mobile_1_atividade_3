import 'dart:async';

import 'package:atividade3/Model/carro.dart';
import 'package:atividade3/card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Menucarro extends StatefulWidget {
  List<carro> listCarro;

  Menucarro({
    required this.listCarro,
  });

  @override
  State<Menucarro> createState() => _MenucarroState();
}

class _MenucarroState extends State<Menucarro> {
  
  void removerCarro(int index) {
    setState(() {
      widget.listCarro.removeAt(index);
    });
  }

  final StreamController<List<carro>> _streamController = StreamController<List<carro>>();

  @override
  void initState() {
    super.initState();
    _streamController.add(widget.listCarro);
  }

  void __addNovoItem(String nome, double autonomia){
    setState(() {
      widget.listCarro.add(carro(nome: nome, autonomia: autonomia));
      _streamController.add(widget.listCarro);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 16, 55, 92),
      ),
      child: Center(
        child: SizedBox(
          width: 300,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 235, 131, 23),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: StreamBuilder<List<carro>>(
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return ListView.builder(
                    itemCount: widget.listCarro.length,
                    itemBuilder: (context, index) {
                      return CardC(
                        nome: widget.listCarro[index].nome,
                        autonomia: widget.listCarro[index].autonomia,
                        onRemove: () => removerCarro,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _streamController.close(); // Fecha o stream quando o widget for descartado
    super.dispose();
  }
}
