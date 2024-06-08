class DestinationEntity {
  DestinationEntity({
    required this.id,
    required this.title,
    required this.district,
    required this.division,
    required this.category,
    required this.image,
  });

  String id;
  String title;
  String district;
  String division;
  String category;
  String image;

  DestinationEntity.initial()
      : id = "0008",
        title = "Sundarban",
        district = "Bagerhat",
        division = "Khulna",
        image =
            "https://drive.google.com/uc?export=view&id=1gPmuTI4p5ERlXBxleq7wVMYNlkaC58bY",
        category = "Forest";
}
