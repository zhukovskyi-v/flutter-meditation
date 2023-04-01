class Item {
  final String name;
  final String imagePath;
  final String audioPath;

  Item({required this.name, required this.imagePath, required this.audioPath});
}

final List<Item> audioItems = [
  Item(
      name: 'Forest',
      imagePath: 'images/forest.jpeg',
      audioPath: 'audio/forestd.mp3'),
  Item(
      name: 'Night',
      imagePath: 'images/night.jpeg',
      audioPath: 'audio/night.mp3'),
  Item(
      name: 'Ocean',
      imagePath: 'images/ocean.jpeg',
      audioPath: 'audio/ocean.mp3'),
  Item(
      name: 'Waterfall',
      imagePath: 'images/waterfall.jpeg',
      audioPath: 'audio/waterfall.mp3'),
  Item(
      name: 'Wind',
      imagePath: 'images/wind.jpeg',
      audioPath: 'audio/wind.mp3'),
];