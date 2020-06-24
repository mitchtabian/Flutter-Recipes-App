class Recipe{

  final String recipe_id;
  final String title;
  final String publisher;
  final String image_url;
  final String social_rank;
  final List<String> ingredients;
  final DateTime timestamp;

  Recipe({
    this.recipe_id,
    this.title,
    this.publisher,
    this.image_url,
    this.social_rank,
    this.ingredients,
    this.timestamp
    });
}