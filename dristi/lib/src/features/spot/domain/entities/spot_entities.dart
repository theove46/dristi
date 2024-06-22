class SpotEntity {
  String id;
  String title;
  String onImageTitle;
  String district;
  String division;
  String category;
  String image;
  String details;

  SpotEntity({
    required this.id,
    required this.title,
    required this.onImageTitle,
    required this.district,
    required this.division,
    required this.category,
    required this.image,
    required this.details,
  });

  SpotEntity.initial()
      : id = "",
        title = "",
        onImageTitle = "",
        district = "",
        division = "",
        category = "",
        image = "",
        details = "";
}

class SpotItemsEntity {
  SpotItemsEntity({
    required this.title,
    required this.image,
  });

  String title;
  String image;
}
