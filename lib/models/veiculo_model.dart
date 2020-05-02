class VeiculoModel {
  int id;
  String nome;
  String modelo;
  String fabricante;
  double motorizacao;
  String combustivel;
  int potencia;
  double torque;
  String direcao;
  String freios;
  double preco;
  int velMaxima;
  String categoria;
  List<dynamic> imagens;
  String conteudo;

  VeiculoModel({
    this.id,
    this.nome,
    this.modelo,
    this.fabricante,
    this.motorizacao,
    this.combustivel,
    this.potencia,
    this.torque,
    this.direcao,
    this.freios,
    this.preco,
    this.velMaxima,
    this.categoria,
    this.imagens,
    this.conteudo,
  });
}