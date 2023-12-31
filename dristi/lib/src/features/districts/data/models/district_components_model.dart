class DistrictsComponentsModel {
  DistrictsComponentsModel({
    required this.title,
    required this.division,
  });

  final String title;
  final String division;

  static List<DistrictsComponentsModel> fetchAllData() {
    List<DistrictsComponentsModel> allData = [
      // Barishal Division
      DistrictsComponentsModel(title: 'Barguna', division: 'Barishal Division'),
      DistrictsComponentsModel(
          title: 'Barishal', division: 'Barishal Division'),
      DistrictsComponentsModel(title: 'Bhola', division: 'Barishal Division'),
      DistrictsComponentsModel(
          title: 'Jhalokati', division: 'Barishal Division'),
      DistrictsComponentsModel(
          title: 'Patuakhali', division: 'Barishal Division'),
      DistrictsComponentsModel(
          title: 'Pirojpur', division: 'Barishal Division'),

      // Chattogram Division
      DistrictsComponentsModel(
          title: 'Bandarban', division: 'Chattogram Division'),
      DistrictsComponentsModel(
          title: 'Brahmanbaria', division: 'Chattogram Division'),
      DistrictsComponentsModel(
          title: 'Chandpur', division: 'Chattogram Division'),
      DistrictsComponentsModel(
          title: 'Comilla', division: 'Chattogram Division'),
      DistrictsComponentsModel(
          title: 'Chattogram', division: 'Chattogram Division'),
      DistrictsComponentsModel(
          title: "Cox's Bazar", division: 'Chattogram Division'),
      DistrictsComponentsModel(title: 'Feni', division: 'Chattogram Division'),
      DistrictsComponentsModel(
          title: 'Khagrachari', division: 'Chattogram Division'),
      DistrictsComponentsModel(
          title: 'Lakshmipur', division: 'Chattogram Division'),
      DistrictsComponentsModel(
          title: 'Noakhali', division: 'Chattogram Division'),
      DistrictsComponentsModel(
          title: 'Rangamati', division: 'Chattogram Division'),

      // Dhaka Division
      DistrictsComponentsModel(title: 'Dhaka', division: 'Dhaka Division'),
      DistrictsComponentsModel(title: 'Faridpur', division: 'Dhaka Division'),
      DistrictsComponentsModel(title: 'Gazipur', division: 'Dhaka Division'),
      DistrictsComponentsModel(title: 'Gopalganj', division: 'Dhaka Division'),
      DistrictsComponentsModel(
          title: 'Kishoreganj', division: 'Dhaka Division'),
      DistrictsComponentsModel(title: 'Madaripur', division: 'Dhaka Division'),
      DistrictsComponentsModel(title: 'Manikganj', division: 'Dhaka Division'),
      DistrictsComponentsModel(title: 'Munshiganj', division: 'Dhaka Division'),
      DistrictsComponentsModel(
          title: 'Narayanganj', division: 'Dhaka Division'),
      DistrictsComponentsModel(title: 'Narsingdi', division: 'Dhaka Division'),
      DistrictsComponentsModel(title: 'Rajbari', division: 'Dhaka Division'),
      DistrictsComponentsModel(title: 'Shariatpur', division: 'Dhaka Division'),
      DistrictsComponentsModel(title: 'Tangail', division: 'Dhaka Division'),

      // Mymensingh Division
      DistrictsComponentsModel(
          title: 'Mymensingh', division: 'Mymensingh Division'),
      DistrictsComponentsModel(
          title: 'Jamalpur', division: 'Mymensingh Division'),
      DistrictsComponentsModel(
          title: 'Sherpur', division: 'Mymensingh Division'),
      DistrictsComponentsModel(
          title: 'Netrokona', division: 'Mymensingh Division'),

      // Khulna Division
      DistrictsComponentsModel(title: 'Bagerhat', division: 'Khulna Division'),
      DistrictsComponentsModel(title: 'Chuadanga', division: 'Khulna Division'),
      DistrictsComponentsModel(title: 'Jashore', division: 'Khulna Division'),
      DistrictsComponentsModel(title: 'Jhenaidah', division: 'Khulna Division'),
      DistrictsComponentsModel(title: 'Khulna', division: 'Khulna Division'),
      DistrictsComponentsModel(title: 'Kushtia', division: 'Khulna Division'),
      DistrictsComponentsModel(title: 'Magura', division: 'Khulna Division'),
      DistrictsComponentsModel(title: 'Meherpur', division: 'Khulna Division'),
      DistrictsComponentsModel(title: 'Narail', division: 'Khulna Division'),
      DistrictsComponentsModel(title: 'Shatkhira', division: 'Khulna Division'),

      // Rajshahi Division
      DistrictsComponentsModel(title: 'Bogura', division: 'Rajshahi Division'),
      DistrictsComponentsModel(
          title: 'Joypurhat', division: 'Rajshahi Division'),
      DistrictsComponentsModel(title: 'Naogaon', division: 'Rajshahi Division'),
      DistrictsComponentsModel(title: 'Natore', division: 'Rajshahi Division'),
      DistrictsComponentsModel(
          title: 'Nawabganj', division: 'Rajshahi Division'),
      DistrictsComponentsModel(title: 'Pabna', division: 'Rajshahi Division'),
      DistrictsComponentsModel(
          title: 'Rajshahi', division: 'Rajshahi Division'),
      DistrictsComponentsModel(
          title: 'Sirajganj', division: 'Rajshahi Division'),

      // Rangpur Division
      DistrictsComponentsModel(title: 'Rangpur', division: 'Rangpur Division'),
      DistrictsComponentsModel(
          title: 'Nilphamari', division: 'Rangpur Division'),
      DistrictsComponentsModel(title: 'Dinajpur', division: 'Rangpur Division'),
      DistrictsComponentsModel(
          title: 'Panchagarh', division: 'Rangpur Division'),
      DistrictsComponentsModel(
          title: 'Gaibandha', division: 'Rangpur Division'),
      DistrictsComponentsModel(title: 'Kurigram', division: 'Rangpur Division'),
      DistrictsComponentsModel(
          title: 'Lalmonirhat', division: 'Rangpur Division'),
      DistrictsComponentsModel(
          title: 'Thakurgaon', division: 'Rangpur Division'),

      // Sylhet Division
      DistrictsComponentsModel(title: 'Habiganj', division: 'Sylhet Division'),
      DistrictsComponentsModel(
          title: 'Maulvibazar', division: 'Sylhet Division'),
      DistrictsComponentsModel(title: 'Sunamganj', division: 'Sylhet Division'),
      DistrictsComponentsModel(title: 'Sylhet', division: 'Sylhet Division'),
    ];

    // Sort the list alphabetically
    allData.sort((a, b) => a.title.compareTo(b.title));

    return allData;
  }
}
