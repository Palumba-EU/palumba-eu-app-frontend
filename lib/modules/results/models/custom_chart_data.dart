class CustomChartData {
  final String party;
  final double value;
  final String percentage;
  final String image;

  CustomChartData(
      {required this.party,
      required this.value,
      required this.percentage,
      required this.image});

  static List<CustomChartData> mockData = [
    CustomChartData(
        party: 'Greens/EFA',
        value: 100,
        percentage: '100%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        party: 'Renew',
        value: 90,
        percentage: '90%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        party: 'The Left',
        value: 75,
        percentage: '75%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        party: 'ID',
        value: 50,
        percentage: '50%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        party: 'ECR',
        value: 30,
        percentage: '30%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        party: 'S&D',
        value: 10,
        percentage: '10%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        party: 'EPP',
        value: 5,
        percentage: '5%',
        image: 'https://picsum.photos/200'),
  ];
}
