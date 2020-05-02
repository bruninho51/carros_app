import 'package:carros_app/models/veiculo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardCarro extends StatefulWidget {
  @override
  _CardCarroState createState() => _CardCarroState();

  CardCarro({this.veiculoModel, this.color});
  final VeiculoModel veiculoModel;
  final Color color;
}

class _CardCarroState extends State<CardCarro> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 5.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 5.0,
          ),
          leading: logoFabricante(widget.veiculoModel.fabricante),
          title: nomeCarro(widget.veiculoModel.nome),
          subtitle: infoBasicas(
            modelo: widget.veiculoModel.modelo, 
            velocidadeMaxima: widget.veiculoModel.velMaxima,
          ),
          trailing: Text(
            widget.veiculoModel.categoria,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {

            Navigator.pushNamed(
              context,
              "/carro_detalhes",
              arguments: widget.veiculoModel,
            );

          },
        ),
      ),
    );
  } 
}

Widget logoFabricante(String fabricante) {
  return Container(
    padding: const EdgeInsets.only(right: 12.0),
      child: SizedBox(
        width: 60,
        height: 60, 
        child: SvgPicture.asset(
          "assets/${fabricante.toLowerCase()}.svg",
          semanticsLabel: fabricante,
        ),
      ),
  );
}

Text nomeCarro(String nome) {
  return Text(
    nome,
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget infoBasicas({String modelo, int velocidadeMaxima}) {
  return Row(
    children: <Widget>[
      Expanded(
        flex: 2,
        child: Container(
          child: Text(
            modelo,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 8
            ),
          )
        ),
      ),
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.drive_eta,
                size: 10.0,
              ),
              Text(
                velocidadeMaxima.toString() + ' Km/h',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 10.0
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}