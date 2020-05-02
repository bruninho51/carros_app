import 'package:carros_app/models/veiculo_model.dart';
import 'package:carros_app/services/veiculos_service.dart';

class VeiculoRepository {

  Future<List<VeiculoModel>> findAllAsync() async {

    List<VeiculoModel> veiculos = new List<VeiculoModel>();
    
    veiculos = new List<VeiculoModel>();
      
    var service = VeiculosService();
    var arrVeiculos = await service.findAllAsync();

    arrVeiculos.forEach((veiculo) => 
      veiculos.add(
        new VeiculoModel(
          id: veiculo['id'],
          nome: veiculo['nome'],
          modelo: veiculo['modelo'],
          fabricante: veiculo['fabricante'],
          motorizacao: veiculo['motorizacao'],
          combustivel: veiculo['combustivel'],
          potencia: veiculo['potencia'],
          torque: veiculo['torque'],
          direcao: veiculo['direcao'],
          freios: veiculo['freios'],
          preco: veiculo['preco'],
          velMaxima: veiculo['velMaxima'],
          categoria: veiculo['categoria'],
          imagens: veiculo['imagens'],
          conteudo: veiculo['conteudo'],
        )
      )
    );

    return new Future.value(veiculos);
  }

}
