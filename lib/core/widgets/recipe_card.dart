import 'package:flutter/material.dart';
import 'package:recipe_app_withai/core/theme/app_pallet.dart';

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String name;
  final int ingredientsCount;
  final String cookingTime;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onCardTap;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.name,
    required this.ingredientsCount,
    required this.cookingTime,
    this.isFavorite = false,
    this.onFavoriteToggle,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Card(
        color: AppPallet.whiteColor,
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          height: 125,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🖼 صورة
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    imageUrl,
                    height: 85.0,
                    width: 85,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image),
                  ),
                ),
                const SizedBox(width: 12),

                // 📋 التفاصيل
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🧾 التصنيف و اسم الوصفة + القلب
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // النصوص
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: AppPallet.textColor,
                                  ),
                                ),
                                Text(
                                  name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Text(
                                      '$ingredientsCount ingredientes',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      cookingTime,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppPallet.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: List.generate(
                                    5,
                                    (_) => const Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // ❤️ أيقونة المفضلة
                          GestureDetector(
                            onTap: onFavoriteToggle,
                            child: Icon(
                              size: 26,
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite
                                  ? AppPallet.mainColor
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
