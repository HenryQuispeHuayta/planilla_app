import 'package:flutter/material.dart';
import 'package:plantilla_app/src/datos.dart';

class Consultas extends StatefulWidget {
  Consultas({Key? key}) : super(key: key);

  @override
  State<Consultas> createState() => _ConsultasState();
}

class _ConsultasState extends State<Consultas> {
  List<String> st = [];
  String data = '';
  String ap = '',
      am = '',
      nom = '',
      cargo = '',
      basico = '',
      ti = '',
      te = '',
      lp = '';
  List<dynamic> listaDatos = [];

  List<DataRow> datosRow = [];
  List<DataRow> datosRow2 = [];

  @override
  void initState() {
    // TODO: implement initState
    _llenar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('CONSULTAS'),
      ),
      body: Container(
        child: ListView(
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
            mostrar(),
          ],
        ),
      ),
    );
  }

  _calcular() {
    List<DataRow> datosRow2 = [];
    String d1 = '',
        d2 = '',
        d3 = '',
        d4 = '',
        d5 = '',
        d6 = '',
        d7 = '',
        d8 = '';
    for (int i = 0; i < planilla.length; i++) {
      List<String> st = planilla[i]
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',');
      if (st[1] == ' ${ci.text}') {
        for (int i = 0; i < personal.length; i++) {
          List<String> st1 = personal[i]
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              .split(',');
          if (st1[0] == ci.text) {
            d1 = st1[1];
            d2 = st1[2];
            d3 = st1[3];
          }
        }
        for (int i = 0; i < cargos.length; i++) {
          List<String> st2 = cargos[i]
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              .split(',');
          if (st[2] == ' ${st2[0]}') {
            d4 = st2[1];
            d5 = st2[2];
            d6 = totalI[int.parse(st[1])]!.toStringAsFixed(2);
            d7 = totalE[int.parse(st[1])]!.toStringAsFixed(2);
            d8 = (double.parse(d5) +
                    totalI[int.parse(st[1])]! -
                    totalE[int.parse(st[1])]!)
                .toStringAsFixed(2);
          }
        }
      }
    }
    datosRow2.add(DataRow(cells: [
      DataCell(Text(d1)),
      DataCell(Text(d2)),
      DataCell(Text(d3)),
      DataCell(Text(d4)),
      DataCell(Text(d5)),
      DataCell(Text(d6)),
      DataCell(Text(d7)),
      DataCell(Text(d8)),
    ]));

    setState(() {
      ap = d1;
      am = d2;
      nom = d3;
      cargo = d4;
      basico = d5;
      ti = d6;
      te = d7;
      lp = d8;
    });
  }

  _llenar() {
    String d1 = '',
        d2 = '',
        d3 = '',
        d4 = '',
        d5 = '',
        d6 = '',
        d7 = '',
        d8 = '';
    for (int i = 0; i < planilla.length; i++) {
      List<String> st = planilla[i]
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',');
      for (int i = 0; i < personal.length; i++) {
        List<String> st1 = personal[i]
            .toString()
            .replaceAll('[', '')
            .replaceAll(']', '')
            .split(',');
        if (int.parse(st1[0]) == int.parse(st[1])) {
          d1 = st1[1];
          d2 = st1[2];
          d3 = st1[3];
        }
      }
      for (int i = 0; i < cargos.length; i++) {
        List<String> st2 = cargos[i]
            .toString()
            .replaceAll('[', '')
            .replaceAll(']', '')
            .split(',');
        if (st[2] == ' ${st2[0]}') {
          d4 = st2[1];
          d5 = st2[2];
          d6 = totalI[int.parse(st[1])]!.toStringAsFixed(2);
          d7 = totalE[int.parse(st[1])]!.toStringAsFixed(2);
          d8 = (double.parse(d5) +
                  totalI[int.parse(st[1])]! -
                  totalE[int.parse(st[1])]!)
              .toStringAsFixed(2);
        }
      }
      datosRow.add(DataRow(cells: [
        DataCell(Text(d1)),
        DataCell(Text(d2)),
        DataCell(Text(d3)),
        DataCell(Text(d4)),
        DataCell(Text(d5)),
        DataCell(Text(d6)),
        DataCell(Text(d7)),
        DataCell(Text(d8)),
      ]));
    }
  }

  Widget mostrar() {
    if (ci.text == '') {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Apellido Parterno')),
            DataColumn(label: Text('Apellido Materno')),
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Cargo')),
            DataColumn(label: Text('Haber Basico')),
            DataColumn(label: Text('Total Ingresos')),
            DataColumn(label: Text('Total Egresos')),
            DataColumn(label: Text('Liquido Pagable'))
          ],
          rows: datosRow,
        ),
      );
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Apellido Parterno')),
          DataColumn(label: Text('Apellido Materno')),
          DataColumn(label: Text('Nombre')),
          DataColumn(label: Text('Cargo')),
          DataColumn(label: Text('Haber Basico')),
          DataColumn(label: Text('Total Ingresos')),
          DataColumn(label: Text('Total Egresos')),
          DataColumn(label: Text('Liquido Pagable'))
        ],
        rows: datosRow2,
      ),
    );
  }
}
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Column(
    //     children: [
    //       Row(
    //         children: [
    //           Column(
    //             children: [
    //               const Text(
    //                 ' Apellido Paterno ',
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               Text(
    //                 ' $ap ',
    //                 style: const TextStyle(fontSize: 25),
    //               ),
    //             ],
    //           ),
    //           Column(
    //             children: [
    //               const Text(
    //                 ' Apellido Materno ',
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               Text(
    //                 ' $am ',
    //                 style: const TextStyle(fontSize: 25),
    //               ),
    //             ],
    //           ),
    //           Column(
    //             children: [
    //               const Text(
    //                 ' Nombre ',
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               Text(
    //                 ' $nom ',
    //                 style: const TextStyle(fontSize: 25),
    //               ),
    //             ],
    //           ),
    //           Column(
    //             children: [
    //               const Text(
    //                 ' Cargo ',
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               Text(
    //                 ' $cargo ',
    //                 style: const TextStyle(fontSize: 25),
    //               ),
    //             ],
    //           ),
    //           Column(
    //             children: [
    //               const Text(
    //                 ' Basico ',
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               Text(
    //                 ' $basico ',
    //                 style: const TextStyle(fontSize: 25),
    //               ),
    //             ],
    //           ),
    //           Column(
    //             children: [
    //               const Text(
    //                 ' Total Ingresos ',
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               Text(
    //                 ' $ti ',
    //                 style: const TextStyle(fontSize: 25),
    //               ),
    //             ],
    //           ),
    //           Column(
    //             children: [
    //               const Text(
    //                 ' Total Egresos ',
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               Text(
    //                 ' $te ',
    //                 style: const TextStyle(fontSize: 25),
    //               ),
    //             ],
    //           ),
    //           Column(
    //             children: [
    //               const Text(
    //                 ' Liquido Pagable ',
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               Text(
    //                 ' $lp ',
    //                 style: const TextStyle(fontSize: 25),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
