import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mathematics Points Game',
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  GameParty createState() => GameParty();
}

class GameParty extends State<GameScreen> {
  int _currentPlayer = 1;
  int _player1Score = 0;
  int _player2Score = 0;
  // List<Offset> points = [];
  Offset point = Offset.zero;
  final int _nbrePoints = 5;
  int counterForDrawOneSquare = 0;
  // int selectedRow = -1;
  // int selectedCol = -1;

  Player p1 = Player(1, 0, Colors.amber);
  Player p2 = Player(2, 0, const Color.fromRGBO(235, 52, 36, 1.0));

  void selectPoint(int row, int col) {
    setState(() {
      counterForDrawOneSquare = 0;
      // Color? color = selectedPoints.entries.firstWhere((element) => listEquals(element.key, [row, col])).value;
      if (selectedPoints['$row, $col'] == Colors.transparent) {
        if (_currentPlayer == p1.getPlayerId()) {
          selectedPoints['$row, $col'] = p1.getPlayerColor();
          bool squareFormed = checkSquareFormation(row, col, p1);
          if (squareFormed) {
            _currentPlayer == p1.getPlayerId();
            _player1Score++;
            p1.setPlayerScore(_player1Score);
          } else {
            _currentPlayer = p2.getPlayerId();
          }
        } else /*if (_currentPlayer == p2.getPlayerId())*/ {
          selectedPoints['$row, $col'] = p2.getPlayerColor();
          bool squareFormed = checkSquareFormation(row, col, p2);
          if (squareFormed) {
            _currentPlayer = p2.getPlayerId();
            _player2Score++;
            p2.setPlayerScore(_player2Score);
          } else {
            _currentPlayer = p1.getPlayerId();
          }
        }
      }
      // print(counterForDrawOneSquare);
      // selectedRow = row;
      // selectedCol = col;
    });
  }

  bool checkSquareFormation(int row, int col, Player player) {
    if ((row > 0 && row < selectedPoints.length - 1) &&
        (col > 0 && col < selectedPoints.length - 1)) {
      if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col - 1}'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, ${col - 1}'] == player.getPlayerColor()) {
        int newRow = row - 1;
        int newCol = col - 1;
        point = Offset(newRow * 1.0, newCol * 1.0);
        // print(point);
        // Offset topLeft = Offset((row - 1) * 1.0, (col - 1) * 1.0);
        // Offset topRight = Offset((row - 1) * 1.0, col * 1.0);
        // Offset bottomLeft = Offset((row) * 1.0, col * 1.0);
        // Offset bottomRight = Offset((row) * 1.0, (col - 1) * 1.0);
        // points.add(topLeft);
        // points.add(topRight);
        // points.add(bottomLeft);
        // points.add(bottomRight);
        return true;
      } else if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col - 1}'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, ${col - 1}'] == player.getPlayerColor()) {
        int newRow = row;
        int newCol = col - 1;
        point = Offset(newRow * 1.0, newCol * 1.0);
        // Offset topLeft = Offset((row) * 1.0, (col - 1) * 1.0);
        // Offset topRight = Offset(row * 1.0, col * 1.0);
        // Offset bottomLeft = Offset((row + 1) * 1.0, (col - 1) * 1.0);
        // Offset bottomRight = Offset((row + 1) * 1.0, (col) * 1.0);
        // points.add(topLeft);
        // points.add(topRight);
        // points.add(bottomLeft);
        // points.add(bottomRight);
        return true;
      } else if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col + 1}'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, ${col + 1}'] == player.getPlayerColor()) {
        int newRow = row - 1;
        int newCol = col;
        point = Offset(newRow * 1.0, newCol * 1.0);
        // Offset topLeft = Offset((row - 1) * 1.0, (col) * 1.0);
        // Offset topRight = Offset((row - 1) * 1.0, (col + 1) * 1.0);
        // Offset bottomLeft = Offset((row) * 1.0, (col) * 1.0);
        // Offset bottomRight = Offset((row) * 1.0, (col + 1) * 1.0);
        // points.add(topLeft);
        // points.add(topRight);
        // points.add(bottomLeft);
        // points.add(bottomRight);
        return true;
      } else if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col + 1}'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, ${col + 1}'] == player.getPlayerColor()) {
        point = Offset(row * 1.0, col * 1.0);
        return true;
      }
    } else if (row == 0 && (col > 0 && col < selectedPoints.length - 1)) {
      if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col - 1}'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, ${col - 1}'] == player.getPlayerColor()) {
        int newRow = row;
        int newCol = col - 1;
        point = Offset(newRow * 1.0, newCol * 1.0);
        // Offset topLeft = Offset((row) * 1.0, (col - 1) * 1.0);
        // Offset topRight = Offset(row * 1.0, col * 1.0);
        // Offset bottomLeft = Offset((row + 1) * 1.0, (col - 1) * 1.0);
        // Offset bottomRight = Offset((row + 1) * 1.0, (col) * 1.0);
        // points.add(topLeft);
        // points.add(bottomLeft);
        // points.add(topRight);
        // points.add(bottomRight);
        return true;
      }
      if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col + 1}'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, ${col + 1}'] == player.getPlayerColor()) {
        int newRow = row;
        int newCol = col + 1;
        point = Offset(newRow * 1.0, newCol * 1.0);
        // Offset topLeft = Offset((row) * 1.0, (col - 1) * 1.0);
        // Offset topRight = Offset(row * 1.0, col * 1.0);
        // Offset bottomLeft = Offset((row + 1) * 1.0, (col - 1) * 1.0);
        // Offset bottomRight = Offset((row + 1) * 1.0, (col) * 1.0);
        // points.add(topLeft);
        // points.add(bottomLeft);
        // points.add(topRight);
        // points.add(bottomRight);
        return true;
      }
    } else if ((row > 0 && row < selectedPoints.length - 1) && col == 0) {
      if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col + 1}'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, ${col + 1}'] == player.getPlayerColor()) {
        int newRow = row - 1;
        int newCol = col;
        point = Offset(newRow * 1.0, newCol * 1.0);
        // Offset topLeft = Offset((row - 1) * 1.0, (col) * 1.0);
        // Offset topRight = Offset((row - 1) * 1.0, (col + 1) * 1.0);
        // Offset bottomLeft = Offset((row) * 1.0, (col) * 1.0);
        // Offset bottomRight = Offset((row) * 1.0, (col + 1) * 1.0);
        // points.add(topLeft);
        // points.add(topRight);
        // points.add(bottomLeft);
        // points.add(bottomRight);
        return true;
      }
      if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col + 1}'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, ${col + 1}'] == player.getPlayerColor()) {
        int newRow = row;
        int newCol = col;
        point = Offset(newRow * 1.0, newCol * 1.0);
        // Offset topLeft = Offset((row - 1) * 1.0, (col) * 1.0);
        // Offset topRight = Offset((row - 1) * 1.0, (col + 1) * 1.0);
        // Offset bottomLeft = Offset((row) * 1.0, (col) * 1.0);
        // Offset bottomRight = Offset((row) * 1.0, (col + 1) * 1.0);
        // points.add(topLeft);
        // points.add(topRight);
        // points.add(bottomLeft);
        // points.add(bottomRight);
        return true;
      }
    } else if (row == (selectedPoints.length - 1) &&
        (col < selectedPoints.length - 1)) {
      if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col - 1}'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, ${col - 1}'] == player.getPlayerColor()) {
        int newRow = row - 1;
        int newCol = col - 1;
        point = Offset(newRow * 1.0, newCol * 1.0);
        // Offset topLeft = Offset((row) * 1.0, (col - 1) * 1.0);
        // Offset topRight = Offset(row * 1.0, col * 1.0);
        // Offset bottomLeft = Offset((row + 1) * 1.0, (col - 1) * 1.0);
        // Offset bottomRight = Offset((row + 1) * 1.0, (col) * 1.0);
        // points.add(topLeft);
        // points.add(bottomLeft);
        // points.add(topRight);
        // points.add(bottomRight);
        return true;
      }
      if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col + 1}'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, ${col + 1}'] == player.getPlayerColor()) {
        int newRow = row - 1;
        int newCol = col;
        point = Offset(newRow * 1.0, newCol * 1.0);
        // Offset topLeft = Offset((row) * 1.0, (col - 1) * 1.0);
        // Offset topRight = Offset(row * 1.0, col * 1.0);
        // Offset bottomLeft = Offset((row + 1) * 1.0, (col - 1) * 1.0);
        // Offset bottomRight = Offset((row + 1) * 1.0, (col) * 1.0);
        // points.add(topLeft);
        // points.add(bottomLeft);
        // points.add(topRight);
        // points.add(bottomRight);
        return true;
      }
    } else if ((row > 0 && row < selectedPoints.length - 1) &&
        col == (selectedPoints.length - 1)) {
      if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col - 1}'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, ${col - 1}'] == player.getPlayerColor()) {
        int newRow = row - 1;
        int newCol = col - 1;
        point = Offset(newRow * 1.0, newCol * 1.0);
        // Offset topLeft = Offset((row - 1) * 1.0, (col) * 1.0);
        // Offset topRight = Offset((row - 1) * 1.0, (col + 1) * 1.0);
        // Offset bottomLeft = Offset((row) * 1.0, (col) * 1.0);
        // Offset bottomRight = Offset((row) * 1.0, (col + 1) * 1.0);
        // points.add(topLeft);
        // points.add(topRight);
        // points.add(bottomLeft);
        // points.add(bottomRight);
        return true;
      }
      if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col - 1}'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, ${col - 1}'] == player.getPlayerColor()) {
        int newRow = row;
        int newCol = col - 1;
        point = Offset(newRow * 1.0, newCol * 1.0);
        // Offset topLeft = Offset((row - 1) * 1.0, (col) * 1.0);
        // Offset topRight = Offset((row - 1) * 1.0, (col + 1) * 1.0);
        // Offset bottomLeft = Offset((row) * 1.0, (col) * 1.0);
        // Offset bottomRight = Offset((row) * 1.0, (col + 1) * 1.0);
        // points.add(topLeft);
        // points.add(topRight);
        // points.add(bottomLeft);
        // points.add(bottomRight);
        return true;
      }
    } else if (row == 0 && col == 0) {
      if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col + 1}'] == player.getPlayerColor() &&
          selectedPoints['${row + 1}, ${col + 1}'] == player.getPlayerColor()) {
        point = Offset(row * 1.0, col * 1.0);
        // Offset topLeft = Offset((row) * 1.0, (col) * 1.0);
        // Offset topRight = Offset((row) * 1.0, (col + 1) * 1.0);
        // Offset bottomLeft = Offset((row + 1) * 1.0, (col) * 1.0);
        // Offset bottomRight = Offset((row + 1) * 1.0, (col + 1) * 1.0);
        // points.add(topLeft);
        // points.add(topRight);
        // points.add(bottomLeft);
        // points.add(bottomRight);
        return true;
      }
    } else if (row == (selectedPoints.length - 1) &&
        col == (selectedPoints.length - 1)) {
      if (selectedPoints['$row, $col'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, $col'] == player.getPlayerColor() &&
          selectedPoints['$row, ${col - 1}'] == player.getPlayerColor() &&
          selectedPoints['${row - 1}, ${col - 1}'] == player.getPlayerColor()) {
        int newRow = row - 1;
        int newCol = col - 1;
        point = Offset(newRow * 1.0, newCol * 1.0);
        // Offset topLeft = Offset((row - 1) * 1.0, (col - 1) * 1.0);
        // Offset topRight = Offset((row - 1) * 1.0, col * 1.0);
        // Offset bottomLeft = Offset((row) * 1.0, col * 1.0);
        // Offset bottomRight = Offset((row) * 1.0, (col - 1) * 1.0);
        // points.add(topLeft);
        // points.add(topRight);
        // points.add(bottomLeft);
        // points.add(bottomRight);
        return true;
      }
    }
    return false;
  }

  Color fillSelectedPoint(int row, int col) {
    // Color? color = selectedPoints.entries.firstWhere((element) => listEquals(element.key, [row, col])).value;
    if (selectedPoints['$row, $col'] == p1.getPlayerColor()) {
      return p1.getPlayerColor();
    } else if (selectedPoints['$row, $col'] == p2.getPlayerColor()) {
      return p2.getPlayerColor();
    }
    return Colors.transparent;
  }

  Color getSquareColor(int row, int col) {
    // print(counterForDrawOneSquare);
    // counterForDrawOneSquare++;
    // print(counterForDrawOneSquare);
    // Color? color = selectedPoints.entries.firstWhere((element) => listEquals(element.key, [row, col])).value;
    if (checkSquareFormation(row, col, p1)) {
      // selectedPoints['$row, $col'] == p1.getPlayerColor()) {
      // counterForDrawOneSquare++;
      if (counterForDrawOneSquare == 0) {
        counterForDrawOneSquare++;
        return p1.getPlayerColor();
      }
    } else if (checkSquareFormation(row, col, p2)) {
      // selectedPoints['$row, $col'] == p2.getPlayerColor()) {
      // counterForDrawOneSquare++;
      if (counterForDrawOneSquare == 0) {
        counterForDrawOneSquare++;
        return p2.getPlayerColor();
      }
    }
    return Colors.transparent;
  }

  Color getBorderColor(int row, int col) {
    if (selectedPoints['$row, $col'] == p1.getPlayerColor()) {
      return p1.getPlayerColor();
    } else if (selectedPoints['$row, $col'] == p2.getPlayerColor()) {
      return p2.getPlayerColor();
    }
    return const Color.fromARGB(255, 0, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mathematics Points Game"),
      ),
      body: /*Stack(children: [*/
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Player 1 Score: $_player1Score',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10, width: 10),
            Text(
              'Player 2 Score: $_player2Score',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10, width: 20),
            for (int row = 0; row < _nbrePoints; row++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int col = 0; col < _nbrePoints; col++)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                          onTap: () {
                            selectPoint(row, col);
                          },
                          child: Stack(children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: fillSelectedPoint(row, col),
                                  border: Border.all(
                                      color: getBorderColor(row, col))),
                            ),
                            // if (counterForDrawOneSquare == 0)
                            // if (checkSquareFormation(row, col, p2))
                            Positioned.fill(
                                child: CustomPaint(
                              painter: LinkPainter(
                                // row: row,
                                // col: col,
                                point: point,
                                // color: Colors.transparent
                                color: getSquareColor(row, col),
                              ),
                            ))
                            // else if (checkSquareFormation(row, col, p1))
                            //   // if (counterForDrawOneSquare == 0)
                            //   Positioned.fill(
                            //       child: CustomPaint(
                            //     painter: LinkPainter(
                            //       // row: row,
                            //       // col: col,
                            //       point: point,
                            //       color: getSquareColor(row, col),
                            //     ),
                            //   ))
                          ])),
                    ),
                ],
              ),
          ],
        ),
      ), /*])*/
    );
  }
}

class LinkPainter extends CustomPainter {
  final Color color;
  // int row;
  // int col;
  // final List<Offset> points;
  final Offset point;

  LinkPainter({required this.color, required this.point
      // required this.points,
      /*required this.row, required this.col*/
      });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // final adjustedPoint = Offset(point.dx * size.width, point.dy * size.height);
    // final squareSize = Size(size.width / 5, size.height / 5);
    // final squareRect = Rect.fromCenter(
    //     center: adjustedPoint,
    //     width: squareSize.width,
    //     height: squareSize.height);

    final path = Path();
    // print(points);
    path.moveTo(point.dx, point.dy);
    path.lineTo(point.dx + 50.0, point.dy);
    path.lineTo(point.dx + 50.0, point.dy + 50.0);
    path.lineTo(point.dx, point.dy + 50.0);
    path.close();
    canvas.drawPath(path, /*squareRect,*/ paint);
    // print("hello");
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // return /*oldDelegate.row != row || oldDelegate.col != col*/ oldDelegate
    //             .point !=
    //         point ||
    //     oldDelegate.color != color;
    return true;
  }
}

class Player {
  int _playerId;
  Color _playerColor;
  int _playerScore;

  Player(this._playerId, this._playerScore, this._playerColor);

  int getPlayerId() => _playerId;
  Color getPlayerColor() => _playerColor;
  int getPlayerScore() => _playerScore;

  void setPlayerId(int playerId) => _playerId = playerId;
  void setPlayerColor(Color color) => _playerColor = color;
  void setPlayerScore(int score) => _playerScore = score;
}

Map<String, Color> selectedPoints = {
  '0, 0': Colors.transparent,
  '0, 1': Colors.transparent,
  '0, 2': Colors.transparent,
  '0, 3': Colors.transparent,
  '0, 4': Colors.transparent,
  '1, 0': Colors.transparent,
  '1, 1': Colors.transparent,
  '1, 2': Colors.transparent,
  '1, 3': Colors.transparent,
  '1, 4': Colors.transparent,
  '2, 0': Colors.transparent,
  '2, 1': Colors.transparent,
  '2, 2': Colors.transparent,
  '2, 3': Colors.transparent,
  '2, 4': Colors.transparent,
  '3, 0': Colors.transparent,
  '3, 1': Colors.transparent,
  '3, 2': Colors.transparent,
  '3, 3': Colors.transparent,
  '3, 4': Colors.transparent,
  '4, 0': Colors.transparent,
  '4, 1': Colors.transparent,
  '4, 2': Colors.transparent,
  '4, 3': Colors.transparent,
  '4, 4': Colors.transparent
};

//Flutter shortcuts
//--->Ctrl+Alt+L (reformat code <==> Ctrl+K Ctrl+F in VSCode)