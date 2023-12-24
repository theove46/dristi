class DistrictsModel {
  DistrictsModel({
    required this.title,
    required this.division,
  });

  final String title;
  final String division;

  static List<DistrictsModel> fetchAllData() {
    List<DistrictsModel> allData = [
      // Barishal Division
      DistrictsModel(title: 'Barguna', division: 'Barishal Division'),
      DistrictsModel(title: 'Barishal', division: 'Barishal Division'),
      DistrictsModel(title: 'Bhola', division: 'Barishal Division'),
      DistrictsModel(title: 'Jhalokati', division: 'Barishal Division'),
      DistrictsModel(title: 'Patuakhali', division: 'Barishal Division'),
      DistrictsModel(title: 'Pirojpur', division: 'Barishal Division'),

      // Chattogram Division
      DistrictsModel(title: 'Bandarban', division: 'Chattogram Division'),
      DistrictsModel(title: 'Brahmanbaria', division: 'Chattogram Division'),
      DistrictsModel(title: 'Chandpur', division: 'Chattogram Division'),
      DistrictsModel(title: 'Comilla', division: 'Chattogram Division'),
      DistrictsModel(title: 'Chattogram', division: 'Chattogram Division'),
      DistrictsModel(title: "Cox's Bazar", division: 'Chattogram Division'),
      DistrictsModel(title: 'Feni', division: 'Chattogram Division'),
      DistrictsModel(title: 'Khagrachari', division: 'Chattogram Division'),
      DistrictsModel(title: 'Lakshmipur', division: 'Chattogram Division'),
      DistrictsModel(title: 'Noakhali', division: 'Chattogram Division'),
      DistrictsModel(title: 'Rangamati', division: 'Chattogram Division'),

      // Dhaka Division
      DistrictsModel(title: 'Dhaka', division: 'Dhaka Division'),
      DistrictsModel(title: 'Faridpur', division: 'Dhaka Division'),
      DistrictsModel(title: 'Gazipur', division: 'Dhaka Division'),
      DistrictsModel(title: 'Gopalganj', division: 'Dhaka Division'),
      DistrictsModel(title: 'Kishoreganj', division: 'Dhaka Division'),
      DistrictsModel(title: 'Madaripur', division: 'Dhaka Division'),
      DistrictsModel(title: 'Manikganj', division: 'Dhaka Division'),
      DistrictsModel(title: 'Munshiganj', division: 'Dhaka Division'),
      DistrictsModel(title: 'Narayanganj', division: 'Dhaka Division'),
      DistrictsModel(title: 'Narsingdi', division: 'Dhaka Division'),
      DistrictsModel(title: 'Rajbari', division: 'Dhaka Division'),
      DistrictsModel(title: 'Shariatpur', division: 'Dhaka Division'),
      DistrictsModel(title: 'Tangail', division: 'Dhaka Division'),

      // Mymensingh Division
      DistrictsModel(title: 'Mymensingh', division: 'Mymensingh Division'),
      DistrictsModel(title: 'Jamalpur', division: 'Mymensingh Division'),
      DistrictsModel(title: 'Sherpur', division: 'Mymensingh Division'),
      DistrictsModel(title: 'Netrokona', division: 'Mymensingh Division'),

      // Khulna Division
      DistrictsModel(title: 'Bagerhat', division: 'Khulna Division'),
      DistrictsModel(title: 'Chuadanga', division: 'Khulna Division'),
      DistrictsModel(title: 'Jashore', division: 'Khulna Division'),
      DistrictsModel(title: 'Jhenaidah', division: 'Khulna Division'),
      DistrictsModel(title: 'Khulna', division: 'Khulna Division'),
      DistrictsModel(title: 'Kushtia', division: 'Khulna Division'),
      DistrictsModel(title: 'Magura', division: 'Khulna Division'),
      DistrictsModel(title: 'Meherpur', division: 'Khulna Division'),
      DistrictsModel(title: 'Narail', division: 'Khulna Division'),
      DistrictsModel(title: 'Shatkhira', division: 'Khulna Division'),

      // Rajshahi Division
      DistrictsModel(title: 'Bogura', division: 'Rajshahi Division'),
      DistrictsModel(title: 'Joypurhat', division: 'Rajshahi Division'),
      DistrictsModel(title: 'Naogaon', division: 'Rajshahi Division'),
      DistrictsModel(title: 'Natore', division: 'Rajshahi Division'),
      DistrictsModel(title: 'Nawabganj', division: 'Rajshahi Division'),
      DistrictsModel(title: 'Pabna', division: 'Rajshahi Division'),
      DistrictsModel(title: 'Rajshahi', division: 'Rajshahi Division'),
      DistrictsModel(title: 'Sirajganj', division: 'Rajshahi Division'),

      // Rangpur Division
      DistrictsModel(title: 'Rangpur', division: 'Rangpur Division'),
      DistrictsModel(title: 'Nilphamari', division: 'Rangpur Division'),
      DistrictsModel(title: 'Dinajpur', division: 'Rangpur Division'),
      DistrictsModel(title: 'Panchagarh', division: 'Rangpur Division'),
      DistrictsModel(title: 'Gaibandha', division: 'Rangpur Division'),
      DistrictsModel(title: 'Kurigram', division: 'Rangpur Division'),
      DistrictsModel(title: 'Lalmonirhat', division: 'Rangpur Division'),
      DistrictsModel(title: 'Thakurgaon', division: 'Rangpur Division'),

      // Sylhet Division
      DistrictsModel(title: 'Habiganj', division: 'Sylhet Division'),
      DistrictsModel(title: 'Maulvibazar', division: 'Sylhet Division'),
      DistrictsModel(title: 'Sunamganj', division: 'Sylhet Division'),
      DistrictsModel(title: 'Sylhet', division: 'Sylhet Division'),
    ];

    // Sort the list alphabetically
    allData.sort((a, b) => a.title.compareTo(b.title));

    return allData;
  }
}
