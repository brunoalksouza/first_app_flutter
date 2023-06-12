import 'package:flutter/material.dart';

import 'difficulty.dart';

// ignore: must_be_immutable
class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {Key? key}) : super(key: key);

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: assetOrNetwork()
                              ? Image.asset(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldade >= 1)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldade >= 2)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldade >= 3)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldade >= 4)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldade >= 5)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.nivel++;
                          });
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.arrow_drop_up),
                            Text(
                              'Up',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Difficulty(
                dificultyLevel: widget.dificuldade,
                nivel: widget.nivel,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
