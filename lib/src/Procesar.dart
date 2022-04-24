import 'package:flutter/material.dart';

class Procesar extends StatefulWidget {
  Procesar({Key? key}) : super(key: key);

  @override
  State<Procesar> createState() => _ProcesarState();
}

class _ProcesarState extends State<Procesar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROCESAR'),
      ),
      body: Container(),
    );
  }
}