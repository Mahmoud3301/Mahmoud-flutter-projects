import 'package:flutter/material.dart';
import 'package:x_o/gameScreeen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

final TextEditingController player1Controller = TextEditingController();
final TextEditingController player2Controller = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Form(
        key: formKey,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter Player Name",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
            Padding(padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: player1Controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )
              ),
              hintText: "Player 1 Name",
              hintStyle: TextStyle(color: Colors.white),

              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "Please enter Player 1 name";
                }
                return null;
              },
              ),
              ),


                Padding(padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: player2Controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )
              ),
              hintText: "Player 2 Name",
              hintStyle: TextStyle(color: Colors.white),

              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "Please enter Player 2 name";
                }
                return null;
              },
              ),
              ),

              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if(formKey.currentState!.validate()){
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder:(context) => gameScreeen(
                        Player1: player1Controller.text, Player2: player2Controller.text),
                         ));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 17 , horizontal: 20),
                  child: const Text("Start Game", style: TextStyle(
                    fontSize: 24 , 
                    fontWeight: FontWeight.bold , 
                    color: Colors.white,
                  ) ,),
                ),
              )
            ],
              ),

            ),
            );
          
        
    
    
  }
}