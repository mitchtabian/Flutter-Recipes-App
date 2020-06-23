class Recipe{

  final String id;
  final String title;
  final String publisher;
  final String imageUrl;
  final double socialRank;
  final List<String> ingredients;
  final DateTime timestamp;

  Recipe({
    this.id,
    this.title,
    this.publisher,
    this.imageUrl,
    this.socialRank,
    this.ingredients,
    this.timestamp
    });
}