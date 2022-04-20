import 'package:flutter/material.dart';
import 'package:plantilla_app/src/Empleados.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de planillas'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
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
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Empleados())
                    );
                },
                child: const Text('EMPLEADOS')),
            ElevatedButton(
                onPressed: () {
                },
                child: const Text('BONOS')),
            ElevatedButton(onPressed: () {}, child: const Text('DESCUENTOS')),
            ElevatedButton(onPressed: () {}, child: const Text('INICIALIZAR')),
            ElevatedButton(onPressed: () {}, child: const Text('PROCESAR')),
            ElevatedButton(onPressed: () {}, child: const Text('CONSULTAS')),
          ]),
    );
  }
}
