import 'package:carros_app/components/card_carro.dart';
import 'package:flutter/material.dart';
import 'package:carros_app/models/veiculo_model.dart';
import 'package:carros_app/repository/veiculo_repository.dart';
import 'package:carros_app/components/basic_appbar.dart';

class ListagemCarrosView extends StatefulWidget {
  @override
  _ListagemCarrosViewState createState() => _ListagemCarrosViewState();
}

class _ListagemCarrosViewState extends State<ListagemCarrosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text('Carros')
      ),
      body: FutureBuilder<List<VeiculoModel>>(
        future: VeiculoRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListaCarros(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView buildListaCarros(List<VeiculoModel> veiculos) {
    return ListView.builder(
      itemCount: veiculos == null ? 0 : veiculos.length,
      itemBuilder: (BuildContext ctx, int index) {
        return CardCarro(
          veiculoModel: veiculos[index], 
          color: Theme.of(context).primaryColor,
        );
      },
    );
  }
 
}
