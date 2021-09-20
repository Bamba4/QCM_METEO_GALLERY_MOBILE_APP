import 'dart:ui';

import 'package:flutter/material.dart';
class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion=0;
  int score = 0;
  var quiz = [
      {"title": "Quelles seront les valeurs des variables A et B après exécution des instructions suivantes ?\n Variables A, B : Entier \n Début \n A←1 \n B←A+3 \n A←3 \n Fin", "answers": [
        {"answer": "A←3 B←4", "correct": true},
        {"answer": "A←1 B←4", "correct": false},
        {"answer": "A←3 B←6", "correct": false}
      ]
    },
    {"title": "Quelles seront les valeurs des variables A et B après exécution des instructions suivantes ? \n Variables A, B : Entier \n Début \n A←5 \n B←A+4 \n A←A+1 \n B←A–4 \n Fin", "answers": [
        {"answer": "A←5 B←9", "correct": true},
        {"answer": "A←6 B←2", "correct": true},
        {"answer": "A←6 B←9", "correct": false}
      ]
    },
    {"title": "Quelles seront les valeurs des variables A, B et C après exécution des instructions suivantes ? \n Variables A, B, C \n Début \n A←5 \n B←3 \n C←A+B \n A←2 \n C←B–A \n Fin", "answers": [
        {"answer": "A←2 B←3 C←-2", "correct": false},
        {"answer": "A←2 B←3 C←8", "correct": false},
        {"answer": "A←2 B←3 C←1", "correct": true}
      ]
    },
    {"title": "Quelles seront les valeurs des variables A, B et C après exécution des instructions suivantes ? \n Variables A, B, C \n Début \n A←3 \n B←10 \n C←A+B \n B←A+B \n A←C \n Fin", "answers": [
        {"answer": "A←13 B←13 C←3", "correct": false},
        {"answer": "A←13 B←13 C←8", "correct": false},
        {"answer": "A←13 B←13 C←13", "correct": true}
      ]
    },  
    {"title": "Quelles seront les valeurs des variables A, B et C après exécution des instructions suivantes ? \n Variables A, B \n Début \n A←5 \n B←2 \n A←B \n B←A \n A←C \n Fin", "answers": [
        {"answer": "A←2 B←2", "correct": true},
        {"answer": "A←5 B←2", "correct": false},
        {"answer": "A←2 B←5", "correct": false}
      ]
    },
    {"title": "Les deux dernières instructions permettent-elles d’échanger les deux valeurs de B et A ? \n Variables A, B \n Début \n A←5 \n B←2 \n A←B \n B←A \n A←C \n Fin", "answers": [
        {"answer": "Oui", "correct": false},
        {"answer": "Non", "correct": true},
        {"answer": "Erreur", "correct": false}
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,),
      body: 
      (this.currentQuestion >= quiz.length) ?
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (this.score > 2) ?
            Image.asset('images/bravo.png')
            : Image.asset('images/perdu.jpg'),
            Text("Score: ${score} / ${quiz.length}", style: TextStyle(fontSize: 22, color: Colors.deepOrange),
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  currentQuestion = 0;
                  score = 0;
                });
              },
              child: Text("Restart..."),
              textColor: Colors.white,
              color: Colors.deepOrange,
            )
          ])
        )
        : ListView(
          children: [
            ListTile(
              title: Center(child: Text("Question ${currentQuestion+1}/${quiz.length}", style: TextStyle(fontSize: 22, color: Colors.deepOrange, fontWeight: FontWeight.bold),))
            ),
            ListTile(
              title: Text(quiz[currentQuestion]["title"], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
            ),
            ...(quiz[currentQuestion]["answers"] as List<Map<String, Object>>).map((answer) => ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                    onPressed: (){
                      setState(() {
                        if(answer["correct"] == true) {
                          ++score;
                        }               
                        ++currentQuestion;                        
                      });
                    },
                    child: Text(answer["answer"], style: TextStyle(fontSize: 22),)
                  ),
                ),
              ),
            ),
          ]
        )
    );
  }
}