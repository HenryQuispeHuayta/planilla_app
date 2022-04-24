import 'package:flutter/material.dart';
import 'package:plantilla_app/src/datos.dart';

Widget buscador() {
  return Center(
    // height: 100,
    // width: 700,
    child: Row(children: [
      const Icon(Icons.search),
      Container(
        // height: 50,
        width: 200,
        child: TextField(
          controller: ci,
          decoration: const InputDecoration(hintText: 'Carnet de Identidad'),
        ),
      ),
      IconButton(onPressed: () {}, icon: const Icon(Icons.search))
    ]),
  );
}

Widget texto(){
  return Container(
    height: 50,
    width: 50,
    child: const Text('1'));
}
