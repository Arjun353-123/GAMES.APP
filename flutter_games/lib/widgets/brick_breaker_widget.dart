import 'package:flutter/material.dart';

class BrickBreakerWidget extends StatefulWidget {
  const BrickBreakerWidget({super.key});

  @override
  State<BrickBreakerWidget> createState() => _BrickBreakerWidgetState();
}

class _BrickBreakerWidgetState extends State<BrickBreakerWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '🧱',
            style: TextStyle(fontSize: 80),
          ),
          const SizedBox(height: 24),
          const Text(
            'BRICK BREAKER',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Paddle ball brick smasher',
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
