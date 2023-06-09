import 'package:first_app_flutter/components/task.dart';
import 'package:first_app_flutter/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: const [
          Task('teste', 'assets/images/1.jpg', 4),
          Task('ride', 'assets/images/2.jpg', 5),
          Task('read', 'assets/images/1.jpg', 2),
          Task('meditation', 'assets/images/2.jpg', 4),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormScreen(),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
