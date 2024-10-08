class preco_gasolina {
  DateTime data;
  String tipo;
  double preco;

  preco_gasolina({
    required this.preco,
    required this.data,
    required this.tipo,
  });

    String toString(){
    return "$tipo /$preco Reais";
  }
}
