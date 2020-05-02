import 'package:carros_app/utils/utils.dart';

class VeiculosService {

  Future<List<dynamic>> findAllAsync() async {

    return parseJsonFromAssets("datafiles/veiculos.json");
    
  }
}