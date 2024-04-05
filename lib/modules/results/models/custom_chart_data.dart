class CustomChartData {
  final String group;
  final double value;
  final String percentage;
  final String image;

  CustomChartData(
      {required this.group, required this.value, required this.percentage, required this.image});

      static List<CustomChartData> mockData = [
    CustomChartData(
        group: 'Greens/EFA',
        value: 100,
        percentage: '100%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        group: 'Renew',
        value: 90,
        percentage: '90%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        group: 'The Left',
        value: 75,
        percentage: '75%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        group: 'ID',
        value: 50,
        percentage: '50%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        group: 'ECR',
        value: 30,
        percentage: '30%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        group: 'S&D',
        value: 10,
        percentage: '10%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        group: 'EPP',
        value: 5,
        percentage: '5%',
        image: 'https://picsum.photos/200'),
  ];
}
