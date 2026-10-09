class GameInfo {
  final String id;
  final String name;
  final String icon;
  final String description;

  GameInfo({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
  });
}

final List<GameInfo> games = [
  GameInfo(
    id: 'vice',
    name: 'Vice City 3D',
    icon: '🌴',
    description: 'Open world Miami 1986 action',
  ),
  GameInfo(
    id: 'racer',
    name: 'Neon Racer',
    icon: '🏎️',
    description: 'High-speed synthwave racing',
  ),
  GameInfo(
    id: 'temple',
    name: 'Temple Runner',
    icon: '🏃',
    description: 'Fast-paced obstacle runner',
  ),
  GameInfo(
    id: 'snake',
    name: 'Cyber Snake',
    icon: '🐍',
    description: 'Classic snake in 3D grid',
  ),
  GameInfo(
    id: 'ox',
    name: 'Neon OX',
    icon: '❌',
    description: 'Tic-tac-toe with AI',
  ),
  GameInfo(
    id: 'bird',
    name: 'Flappy Bird',
    icon: '🐦',
    description: 'Tap to fly arcade game',
  ),
  GameInfo(
    id: 'breaker',
    name: 'Brick Breaker',
    icon: '🧱',
    description: 'Paddle ball brick smasher',
  ),
];
