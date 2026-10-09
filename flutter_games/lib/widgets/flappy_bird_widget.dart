import 'dart:async';
import 'package:flutter/material.dart';

class FlappyBirdWidget extends StatefulWidget {
  const FlappyBirdWidget({super.key});

  @override
  State<FlappyBirdWidget> createState() => _FlappyBirdWidgetState();
}

class _FlappyBirdWidgetState extends State<FlappyBirdWidget> {
  double birdY = 0;
  double velocity = 0;
  double gravity = 0.5;
  int score = 0;
  bool gameStarted = false;
  bool gameOver = false;
  Timer? gameTimer;

  @override
  void initState() {
    super.initState();
  }

  void startGame() {
    setState(() {
      birdY = 0;
      velocity = 0;
      score = 0;
      gameStarted = true;
      gameOver = false;
    });

    gameTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        velocity += gravity;
        birdY += velocity;

        if (birdY > 1.0 || birdY < -1.0) {
          timer.cancel();
          gameOver = true;
          gameStarted = false;
        }
      });
    });
  }

  void jump() {
    if (!gameStarted) {
      startGame();
    } else if (!gameOver) {
      setState(() {
        velocity = -10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: jump,
      child: Container(
        color: Colors.blue[100],
        child: Stack(
          children: [
            // Bird
            AnimatedAlign(
              alignment: Alignment(0, birdY),
              duration: const Duration(milliseconds: 0),
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
                child: const Center(
                  child: Text('🐦', style: TextStyle(fontSize: 30)),
                ),
              ),
            ),

            // Score
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Score: $score',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Start/Game Over
            if (!gameStarted)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'FLAPPY BIRD',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        gameOver ? 'Tap to Restart' : 'Tap to Start',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }
}
