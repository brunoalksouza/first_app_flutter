import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int dificultyLevel;
  final int nivel;

  const Difficulty({
    required this.dificultyLevel,
    required this.nivel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var nivelDificulty = nivel / dificultyLevel;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 200,
            child: LinearProgressIndicator(
              color: Colors.white,
              value: (dificultyLevel > 0) ? nivelDificulty / 10 : 1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Text(
            'nível: $nivel',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
