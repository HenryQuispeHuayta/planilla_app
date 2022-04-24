import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantilla_app/src/Bonos.dart';
import 'package:plantilla_app/src/Consultas.dart';
import 'package:plantilla_app/src/Descuentos.dart';
import 'package:plantilla_app/src/Empleados.dart';
import 'package:plantilla_app/src/Procesar.dart';
import 'dart:async';

import 'package:plantilla_app/src/datos.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool sw1 = true, sw2 = false;

  @override
  void initState() {
    // TODO: implement initState
    cargar();
    // _iniciar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de planillas'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Henry Quispe Huayta',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const Text(
                'Sistema de Planillas',
                style: TextStyle(fontSize: 35),
              ),
              Container(
                height: 70,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Empleados()));
                  },
                  child: const Text('EMPLEADOS')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bonos()));
                  },
                  child: const Text('BONOS')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Descuentos()));
                  },
                  child: const Text('DESCUENTOS')),
              ElevatedButton(
                  onPressed: sw1? null : _iniciar,
                  // () {
                  //   _iniciar();
                  // },
                  child: const Text('INICIALIZAR')),
              ElevatedButton(
                  onPressed: sw2 ? null : _calcular,
                  // () {
                  //   _calcular();
                  // },
                  child: const Text('PROCESAR')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Consultas()));
                  },
                  child: const Text('CONSULTAS')),
            ]),
      ),
    );
  }

  _iniciar() {
    for (int i = 0; i < planilla.length; i++) {
      List<String> st = planilla[i]
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',');
      totalI.addAll({int.parse(st[1]): 0});
      totalE.addAll({int.parse(st[1]): 0});
    }
    setState(() {
      ci.text = '';
      sw1 = true;
      sw2 = false;
    });
  }

  _calcular() {
    for (int i = 0; i < planilla.length; i++) {
      List<String> st = planilla[i]
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',');
      totalI.addAll({int.parse(st[1]): 0});
      totalE.addAll({int.parse(st[1]): 0});
    }
    for (int i = 0; i < bonos.length; i++) {
      List<String> st = bonos[i]
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',');
      if (totalI.containsKey(int.parse(st[0]))) {
        totalI.update(int.parse(st[0]), (value) => value + double.parse(st[1]));
      }
    }
    for (int i = 0; i < descuentos.length; i++) {
      List<String> st = descuentos[i]
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',');
      if (totalE.containsKey(int.parse(st[0]))) {
        totalE.update(int.parse(st[0]), (value) => value + double.parse(st[1]));
      }
    }
    setState(() {
      sw1 = false;
      sw2 = true;
    });
    print(totalI[6776752]);
  }
}
