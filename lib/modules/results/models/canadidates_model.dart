class CandidatesData {
  final String name;
  final String party;
  final String image;

  CandidatesData(
      {required this.name, required this.party, required this.image});

  static List<CandidatesData> mockData = [
    CandidatesData(
        name: 'Candidate 1', party: 'ABC', image: 'https://picsum.photos/200'),
    CandidatesData(
        name: 'Candidate 2', party: 'ABC', image: 'https://picsum.photos/200'),
    CandidatesData(
        name: 'Candidate 3', party: 'ABC', image: 'https://picsum.photos/200'),
    CandidatesData(
        name: 'Candidate 4', party: 'ABC', image: 'https://picsum.photos/200'),
    CandidatesData(
        name: 'Candidate 5', party: 'ABC', image: 'https://picsum.photos/200'),
    CandidatesData(
        name: 'Candidate 6', party: 'ABC', image: 'https://picsum.photos/200'),
    CandidatesData(
        name: 'Candidate 7', party: 'ABC', image: 'https://picsum.photos/200'),
  ];
}
