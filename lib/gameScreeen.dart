import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:x_o/homescreen.dart';

class gameScreeen extends StatefulWidget {
  String Player1;
  String Player2;

  gameScreeen({required this.Player1, required this.Player2});

  @override
  State<gameScreeen> createState() => _gameScreeenState();
}

class _gameScreeenState extends State<gameScreeen> {
  late List<List<String>> _board;
  late String _CurrentPlayer;
  late String _Winner;
  late bool _GameOver;

  void initState() {
    super.initState();
    _board = List.generate(3, (_) => List.generate(3, (_) => ""));
    _CurrentPlayer = "X";
    _Winner = "";
    _GameOver = false;
  }

  void resetGame() {
    setState(() {
      _board = List.generate(3, (_) => List.generate(3, (_) => ""));
      _CurrentPlayer = "X";
      _Winner = "";
      _GameOver = false;
    });
  }

  void _makemove(int row, int col) {
    if (_board[row][col] != "" || _GameOver) {
      return;
    }
    setState(() {
      _board[row][col] = _CurrentPlayer;

      if (_board[row][col] == _CurrentPlayer &&
          _board[row][1] == _CurrentPlayer &&
          _board[row][2] == _CurrentPlayer) {
        _Winner = _CurrentPlayer;
        _GameOver = true;
      } else if (_board[0][col] == _CurrentPlayer &&
          _board[1][col] == _CurrentPlayer &&
          _board[2][col] == _CurrentPlayer) {
        _Winner = _CurrentPlayer;
        _GameOver = true;
      } else if (_board[0][0] == _CurrentPlayer &&
          _board[1][1] == _CurrentPlayer &&
          _board[2][2] == _CurrentPlayer) {
        _Winner = _CurrentPlayer;
        _GameOver = true;
      } else if (_board[0][2] == _CurrentPlayer &&
          _board[1][1] == _CurrentPlayer &&
          _board[2][0] == _CurrentPlayer) {
        _Winner = _CurrentPlayer;
        _GameOver = true;
      }

      _CurrentPlayer = _CurrentPlayer == "X" ? "O" : "X";

      if (!_board.any((row) => row.any((cell) => cell == ""))) {
        _GameOver = true;
        _Winner = " It's a Tie";
      }

      if (_Winner != "") {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          btnOkText: "Play Again",
          title: _Winner == "X"
              ? widget.Player1 + " Won!"
              : _Winner == "O"
                  ? widget.Player2 + " Won!"
                  : "It's Tie",
          btnOkOnPress: () {
            resetGame();
          },
        )..show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height:70 ,
            ),
            SizedBox(
              height: 120,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      const Text("Turn : ",
                      style: TextStyle(
                        fontSize: 24 , 
                        fontWeight: FontWeight.bold , 
                        color: Colors.white,
                      ),
                      ),
                      

                      Text
                      (_CurrentPlayer == "X" ? widget.Player1 + " ($_CurrentPlayer)"
                      : widget.Player2 + " ($_CurrentPlayer)",
                      style:  TextStyle(
                        fontSize: 30 , 
                        fontWeight: FontWeight.bold , 
                        color: _CurrentPlayer == "X" ? const Color(0xFFE25041) 
                        : const Color(0xFF1CBD9E),
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                ],
              ),
            ),

               const SizedBox(height: 20),

               Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF5F6884),
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: const EdgeInsets.all(5),
                child: GridView.builder(
                  itemCount: 9,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: 
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3), itemBuilder: (context, index) {
                    int row = index ~/3;
                    int col = index % 3;
                    return GestureDetector(
                      onTap: () => _makemove(row, col),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0E1E3A),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(_board[row][col],
                        style: TextStyle(
                          fontSize: 115,
                          fontWeight: FontWeight.bold,
                          color: _board[row][col] == "X" 
                          ? const Color(0xFFE25041) 
                          : const Color(0xFF1CBD9E)

                        ),),
                      ),
                    );
                  },),
               ),
               const SizedBox(height: 15),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                children: [
                  InkWell(
                    onTap:resetGame ,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 18 , horizontal: 20 ),
                      child: const Text("Reset Game" , 
                      style: TextStyle(
                        fontSize: 24 , 
                        fontWeight: FontWeight.bold , 
                        color: Colors.white,
                      ), 
                      ),
                    ),
                  ),
                             InkWell(
                    onTap:(){
                       Navigator.push(
                      context, MaterialPageRoute(
                        builder:(context) => const HomeScreen(),
                         ));
                         widget.Player1="";
                         widget.Player2="";
                    } ,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 18 , horizontal: 20 ),
                      child: const Text("Restart Game" , 
                      style: TextStyle(
                        fontSize: 24 , 
                        fontWeight: FontWeight.bold , 
                        color: Colors.white,
                      ), 
                      ),
                    ),
                  ),
                ],
               )


          ],
        ),
      ),
    );
  }
}
