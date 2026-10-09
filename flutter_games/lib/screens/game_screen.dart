import 'package:flutter/material.dart';
import '../games/game_list.dart';
import '../widgets/snake_game_widget.dart';
import '../widgets/flappy_bird_widget.dart';
import '../widgets/brick_breaker_widget.dart';
import '../widgets/tic_tac_toe_widget.dart';

class GameScreen extends StatelessWidget {
  final GameInfo game;

  const GameScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(game.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    game.description,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _buildGameWidget(),
    );
  }

  Widget _buildGameWidget() {
    switch (game.id) {
      case 'snake':
        return const SnakeGameWidget();
      case 'bird':
        return const FlappyBirdWidget();
      case 'breaker':
        return const BrickBreakerWidget();
      case 'ox':
        return const TicTacToeWidget();
      default:
        return _buildComingSoon();
    }
  }

  Widget _buildComingSoon() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            game.icon,
            style: const TextStyle(fontSize: 80),
          ),
          const SizedBox(height: 24),
          Text(
            game.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            game.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'COMING SOON',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
