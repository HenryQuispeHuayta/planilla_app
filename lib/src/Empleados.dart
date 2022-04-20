import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantilla_app/src/datos.dart';
import 'dart:async';

class Empleados extends StatefulWidget {
  const Empleados({Key? key}) : super(key: key);

  @override
  State<Empleados> createState() => _EmpleadosState();
}

class _EmpleadosState extends State<Empleados> {
  List<String> st = [];
  String data = '';
  String ap = '', am = '', nom = '', est = '';
  List<List<dynamic>> listaDatos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de planillas'),
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              controller: ci,
              decoration: const InputDecoration(hintText: 'Canet de Identidad'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                cargar();
              },
              child: const Text('BUSCAR')),
          // Text(data),
          Row(
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
                    'Estado',
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
          )
        ],
      ),
    );
  }

  cargar() async {
    final lDatos = await rootBundle.loadString('assets/data/planilla.txt');
    listaDatos = const CsvToListConverter().convert(lDatos);
    st = lDatos.split(',');
    print(lDatos.length);
  }

  calcular() {}
}
    // for (int i = 0; i < st.length; i++) {
    //   // int j = 1;
    //   if (st[i] == ci.text) {
    //     setState(() {
    //       ap = st[i+1];
    //       am = st[i+2];
    //       nom = st[i+3];
    //     });
    //     // data = data + st[i] + ' ';
    //     // j++;
    //   }
    //   //  else {
    //   //   j = 1;
    //   //   data = data + '\n';
    //   // }
    // }
    // // setState(() {
    // //   data;
    // // });
    // // print(st.length);
