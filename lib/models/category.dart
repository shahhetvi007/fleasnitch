class Category {
  final String mainCategoryName;
  final List<SubCategory> subCategories;

  Category({required this.mainCategoryName, required this.subCategories});
}

class SubCategory {
  final String? subCategoryHeading;
  final String subCategoryName;
  final String image;

  SubCategory(
      {this.subCategoryHeading, required this.subCategoryName, required this.image});
}
