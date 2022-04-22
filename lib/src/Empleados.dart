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
  List<dynamic> listaDatos = [];

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      cargar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMPLEADOS'),
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
                _calcular();
              },
              child: const Text('BUSCAR')),
          // Text(data),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
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

  _calcular() {
    String d1 = '', d2 = '', d3 = '', d4 = '';
    for (int i = 0; i < personal.length; i++) {
      List<String> st = personal[i]
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',');
      if (st[0] == ci.text) {
        d1 = st[1];
        d2 = st[2];
        d3 = st[3];
        d4 = 'No esta en Planilla';
        if (planilla.toString().contains(ci.text)) d4 = 'En Planilla';
      }
    }
    setState(() {
      ap = d1;
      am = d2;
      nom = d3;
      est = d4;
    });
  }
}
