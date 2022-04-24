import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ci = TextEditingController();
List<dynamic> bonos = [];
List<dynamic> cargos = [];
List<dynamic> descuentos = [];
List<dynamic> personal = [];
List<dynamic> planilla = [];

// Map<int, double> total = {};
Map<int, double> totalI = {};
Map<int, double> totalE = {};

cargar() async {
  final bonosDatos = await rootBundle.loadString('assets/data/bonos.txt');
  final cargosDatos = await rootBundle.loadString('assets/data/cargos.txt');
  final descuentosDatos =
      await rootBundle.loadString('assets/data/descuentos.txt');
  final personalDatos = await rootBundle.loadString('assets/data/personal.txt');
  final planillaDatos = await rootBundle.loadString('assets/data/planilla.txt');

  bonos = const CsvToListConverter().convert(bonosDatos);
  cargos = const CsvToListConverter().convert(cargosDatos);
  descuentos = const CsvToListConverter().convert(descuentosDatos);
  personal = const CsvToListConverter().convert(personalDatos);
  planilla = const CsvToListConverter().convert(planillaDatos);
}
