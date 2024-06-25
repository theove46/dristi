class SpotEntity {
  String id;
  String title;
  String onImageTitle;
  String district;
  String division;
  String category;
  String image;
  String details;
  List<String>? seasons;
  List<String>? cautions;
  List<String>? specials;
  List<BlogsEntity>? blogs;

  SpotEntity({
    required this.id,
    required this.title,
    required this.onImageTitle,
    required this.district,
    required this.division,
    required this.category,
    required this.image,
    required this.details,
    required this.seasons,
    required this.cautions,
    required this.specials,
    required this.blogs,
  });

  SpotEntity.initial()
      : id = "",
        title = "",
        onImageTitle = "",
        district = "",
        division = "",
        category = "",
        image = "",
        details = "",
        seasons = [],
        cautions = [],
        specials = [],
        blogs = [];
}

class SpotItemsEntity {
  SpotItemsEntity({
    required this.title,
    required this.image,
  });

  String title;
  String image;
}

class BlogsEntity {
  BlogsEntity({
    required this.title,
    required this.url,
    required this.site,
  });

  String title;
  String url;
  String site;
}
