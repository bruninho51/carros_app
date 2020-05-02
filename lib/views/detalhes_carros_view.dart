import 'package:carros_app/components/cross_image.dart';
import 'package:carros_app/components/custom_dialog.dart';
import 'package:carros_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carros_app/models/veiculo_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetalhesCarrosView extends StatefulWidget {
  @override
  _DetalhesCarrosViewState createState() => _DetalhesCarrosViewState();
}

class _DetalhesCarrosViewState extends State<DetalhesCarrosView> {
  @override
  Widget build(BuildContext context) {

    final VeiculoModel veiculoModel = ModalRoute.of(context).settings.arguments;

    Widget preco(BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(7.0),
        child: Center(
          child: new Text(
            currency(veiculoModel.preco),
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );
    }

    Widget headerInformacoesCarro(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40.0),
          SizedBox(
            width: 90,
            height: 90, 
            child: SvgPicture.asset(
              "assets/${veiculoModel.fabricante.toLowerCase()}.svg",
              semanticsLabel: veiculoModel.fabricante,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            veiculoModel.nome,
            style: TextStyle(
              color: Colors.white,
              fontSize: 45.0,
            ),
          ),
          Text(
            veiculoModel.modelo,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 22.7),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  veiculoModel.motorizacao.toString(),
                  style: TextStyle(color: Colors.white)),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(children: <Widget>[
                      Icon(
                        Icons.local_gas_station,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      Text(
                        veiculoModel.combustivel,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: preco(context),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomDialog(
                    title: "Informações Técnicas",
                    image: SvgPicture.asset(
                      "assets/${veiculoModel.fabricante.toLowerCase()}.svg",
                      semanticsLabel: veiculoModel.fabricante,
                    ),
                    info: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: informacoesTecnicas(veiculoModel),
                        ),
                      ],
                    ),
                    buttonText: "Fechar",
                  ),
                ),
              },  
              child: new Text("Informações Técnicas"),
            ),
          ),
        ],
      );
    }

    Widget header(BuildContext context) {
      return Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: CrossImage(veiculoModel.imagens),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: const EdgeInsets.all(40.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
            child: Center(
              child: headerInformacoesCarro(context),
            ),
          ),
          Positioned(
            left: 8.0,
            top: 60.0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          )
        ],
      );
    }

    Widget sobreCarro(BuildContext context) {
      return Text(
        veiculoModel.conteudo,
        style: TextStyle(fontSize: 18.0),
        textAlign: TextAlign.justify,
      );
    }

    Widget body(BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: <Widget>[
              sobreCarro(context),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          header(context),
          body(context),
        ],
      ),
    );
  }
}

Widget informacoesTecnicas(VeiculoModel veiculo) {

  return Column(children: <Widget>[
    Row(
      children: <Widget>[
        Text(
          'Velocidade Máxima: ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
          ),
        ),
        Text(veiculo.velMaxima.toString() + ' Km/h'),
      ],
    ),
    Row(
      children: <Widget>[
        Text(
          'Potência: ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
          ),
        ),
        Text(veiculo.potencia.toString() + ' Cavalos'),
      ],
    ),
    Row(
      children: <Widget>[
        Text(
          'Torque: ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
          ),
        ),
        Text(veiculo.torque.toString()),
      ],
    ),
    Row(
      children: <Widget>[
        Text(
          'Direção: ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
          ),
        ),
        Text(veiculo.direcao.toString()),
      ],
    ),
    Row(
      children: <Widget>[
        Text(
          'Freios: ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
          ),
        ),
        Text(veiculo.freios.toString()),
      ],
    ),
  ]);
}