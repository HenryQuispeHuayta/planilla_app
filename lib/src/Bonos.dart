import 'package:flutter/material.dart';
import 'package:plantilla_app/src/datos.dart';
import 'package:plantilla_app/src/widgets.dart';

class Bonos extends StatefulWidget {
  Bonos({Key? key}) : super(key: key);

  @override
  State<Bonos> createState() => _BonosState();
}

class _BonosState extends State<Bonos> {
  int cont = 0;
  List<String> st = [];
  String data = '';
  String ap = '', am = '', nom = '', est = '';
  List<dynamic> listaDatos = [];

  @override
  void initState() {
    // TODO: implement initState
    cargar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BONOS'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: ci,
                  decoration:
                      const InputDecoration(hintText: 'Canet de Identidad'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    _calcular();
                  },
                  child: const Text('BUSCAR')),
              _mostrar(),
            ],
          ),
        ));
  }

  Widget _mostrar() {
    if (cont == personal.length) {
      cont = 0;
      return const Text(
        'NO EXISTE ',
        style: TextStyle(fontSize: 70),
      );
    }
    if (cont > personal.length) {
      cont = 0;
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              children: const [
                Text(
                  'Apellido Paterno',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'Apellido Materno',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'Nombre',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'Bonos',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            Column(
              children: const [
                Text(
                  ':',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  ':',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  ':',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  ':',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  ap,
                  style: const TextStyle(fontSize: 25),
                ),
                Text(
                  am,
                  style: const TextStyle(fontSize: 25),
                ),
                Text(
                  nom,
                  style: const TextStyle(fontSize: 25),
                ),
                Text(
                  est,
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return Container();
  }

  _calcular() {
    String d1 = '', d2 = '', d3 = '', d4 = '';
    double sum = 0;
    for (int i = 0; i < personal.length; i++) {
      cont++;
      List<String> st = personal[i]
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',');
      if (st[0] == ci.text) {
        cont++;
        d1 = st[1];
        d2 = st[2];
        d3 = st[3];
      }
    }
    for (int i = 0; i < bonos.length; i++) {
      List<String> st = bonos[i]
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',');
      if (st[0] == ci.text) {
        sum = sum + double.parse(st[1]);
      }
    }
    d4 = '${sum.toStringAsFixed(2)} Bs';
    if (sum == 0) {
      d4 = 'No tiene bonos';
    }
    setState(() {
      ap = d1;
      am = d2;
      nom = d3;
      est = d4;
    });
  }
}
