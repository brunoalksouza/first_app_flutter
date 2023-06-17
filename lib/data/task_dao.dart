import 'package:first_app_flutter/components/task.dart';
import 'package:first_app_flutter/data/database.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class taskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty, INTEGER, '
      '$_image, TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('convertendo to list: ');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('mapaDeTarefas $tarefas');
    return tarefas;
  }

  save(Task tarefa) async {
    Future<List<Task>> findAll() async {
      print('Acessando o findAll');
      final Database bancoDeDados = await getDatabase();
      final List<Map<String, dynamic>> result =
          await bancoDeDados.query(_tablename);
      print('Procurando no banco de dados... encontrado: $result');
      return toList(result);
    }

    Future<List<Task>> find(String nomeDaTarefa) async {
      final Database bancoDeDados = await getDatabase();
      final List<Map<String, dynamic>> result = await bancoDeDados.query(
        _tablename,
        where: '$_name = ?',
        whereArgs: [nomeDaTarefa],
      );
      print('tarefa encontrada ${toList(result)}');
      return toList(result);
    }

    delete(String nomeDaTarefa) async {}
  }
}
