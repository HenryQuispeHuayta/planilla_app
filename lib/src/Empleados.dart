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
  bool sw = true;
  int cont = 0;
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
          _mostrar(),
        ],
      ),
    );
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
        ),
      );
    }
    return Container();
  }

  _calcular() {
    String d1 = '', d2 = '', d3 = '', d4 = '';
    for (int i = 0; i < personal.length; i++) {
      cont++;
      List<String> st = personal[i]
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',');
      if (st[0] == ci.text) {
        sw = false;
        cont++;
        d1 = st[1];
        d2 = st[2];
        d3 = st[3];
        d4 = 'No esta en Planilla';
        if (planilla.toString().contains(ci.text)) d4 = 'En Planilla';
      }
    }
    if (sw) {
      setState(() {
        AlertDialog(
          title: const Text('No existe'),
          content: const Text('Quiere volver a buscar?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'No'),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Si'),
              child: const Text('Si'),
            ),
          ],
        );
      });
    }
    setState(() {
      ap = d1;
      am = d2;
      nom = d3;
      est = d4;
    });
  }
}
