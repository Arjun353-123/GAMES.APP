import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

enum Direction { up, down, left, right }

class SnakeGameWidget extends StatefulWidget {
  const SnakeGameWidget({super.key});

  @override
  State<SnakeGameWidget> createState() => _SnakeGameWidgetState();
}

class _SnakeGameWidgetState extends State<SnakeGameWidget> {
  static const int gridSize = 20;
  List<Point<int>> snake = [Point(10, 10)];
  Point<int> food = Point(15, 15);
  Direction direction = Direction.right;
  Direction nextDirection = Direction.right;
  Timer? gameTimer;
  int score = 0;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    snake = [Point(10, 10)];
    food = _generateFood();
    direction = Direction.right;
    nextDirection = Direction.right;
    score = 0;
    gameOver = false;
    
    gameTimer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        _moveSnake();
      });
    });
  }

  void _moveSnake() {
    if (gameOver) return;
    
    direction = nextDirection;
    Point<int> head = snake.first;
    Point<int> newHead;

    switch (direction) {
      case Direction.up:
        newHead = Point(head.x, (head.y - 1 + gridSize) % gridSize);
        break;
      case Direction.down:
        newHead = Point(head.x, (head.y + 1) % gridSize);
        break;
      case Direction.left:
        newHead = Point((head.x - 1 + gridSize) % gridSize, head.y);
        break;
      case Direction.right:
        newHead = Point((head.x + 1) % gridSize, head.y);
        break;
    }

    if (snake.skip(1).contains(newHead)) {
      gameOver = true;
      gameTimer?.cancel();
      return;
    }

    snake.insert(0, newHead);

    if (newHead == food) {
      score += 10;
      food = _generateFood();
    } else {
      snake.removeLast();
    }
  }

  Point<int> _generateFood() {
    Random random = Random();
    Point<int> newFood;
    do {
      newFood = Point(random.nextInt(gridSize), random.nextInt(gridSize));
    } while (snake.contains(newFood));
    return newFood;
  }

  void _handleSwipe(Direction newDirection) {
    if ((direction == Direction.up && newDirection != Direction.down) ||
        (direction == Direction.down && newDirection != Direction.up) ||
        (direction == Direction.left && newDirection != Direction.right) ||
        (direction == Direction.right && newDirection != Direction.left)) {
      nextDirection = newDirection;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Score
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Score: $score',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              if (gameOver)
                ElevatedButton(
                  onPressed: () => setState(() => startGame()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                  child: const Text('Restart'),
                ),
            ],
          ),
        ),
        
        // Game Board
        Expanded(
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 5) {
                _handleSwipe(Direction.down);
              } else if (details.delta.dy < -5) {
                _handleSwipe(Direction.up);
              }
            },
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx > 5) {
                _handleSwipe(Direction.right);
              } else if (details.delta.dx < -5) {
                _handleSwipe(Direction.left);
              }
            },
            child: Container(
              color: Colors.white,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridSize,
                ),
                itemCount: gridSize * gridSize,
                itemBuilder: (context, index) {
                  int x = index % gridSize;
                  int y = index ~/ gridSize;
                  Point<int> point = Point(x, y);

                  bool isSnake = snake.contains(point);
                  bool isHead = snake.first == point;
                  bool isFood = food == point;

                  return Container(
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: isSnake
                          ? (isHead ? Colors.black : Colors.grey[800])
                          : isFood
                              ? Colors.red
                              : Colors.grey[200],
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 0.5,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        
        // Controls
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildControlButton(Icons.arrow_upward, () => _handleSwipe(Direction.up)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildControlButton(Icons.arrow_back, () => _handleSwipe(Direction.left)),
                  const SizedBox(width: 80),
                  _buildControlButton(Icons.arrow_forward, () => _handleSwipe(Direction.right)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildControlButton(Icons.arrow_downward, () => _handleSwipe(Direction.down)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildControlButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 32),
      ),
    );
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }
}
