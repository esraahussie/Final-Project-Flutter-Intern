abstract class RecipeDetailsEvent {}

class LoadRecipeDetailsEvent extends RecipeDetailsEvent {
  final String recipeId;

  LoadRecipeDetailsEvent(this.recipeId);
}

class ToggleFavoriteEvent extends RecipeDetailsEvent {
  final String recipeId;

  ToggleFavoriteEvent(this.recipeId);
}

class ChangeTab extends RecipeDetailsEvent {
  final int tabIndex;
  ChangeTab(this.tabIndex);
}
