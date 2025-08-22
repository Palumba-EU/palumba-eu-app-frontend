import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/goingToVote_model.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/statement_response.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:palumba_eu/modules/results/components/custom_mds_graphic/scatter_points.dart';
import 'package:palumba_eu/modules/results/helpers/results_helper.dart';
import 'package:palumba_eu/modules/results/helpers/svg_helper.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/pages/results_page_1.dart';
import 'package:palumba_eu/modules/results/pages/results_page_2.dart';
import 'package:palumba_eu/modules/results/pages/results_page_3.dart';
import 'package:palumba_eu/modules/results/pages/results_page_4.dart';
import 'package:palumba_eu/modules/results/pages/results_page_6.dart';
import 'package:palumba_eu/modules/results/pages/results_page_7.dart';
import 'package:palumba_eu/modules/results/pages/results_page_8.dart';
import 'package:palumba_eu/modules/results/pages/results_page_9.dart';
import 'package:palumba_eu/modules/results/pages/results_page_10.dart';
import 'package:palumba_eu/modules/results/pages/results_page_all_parties.dart';
import 'package:palumba_eu/modules/results/pages/results_page_candidate.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/extensions.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/managers/plausible_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';
import 'package:palumba_eu/utils/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'models/custom_chart_data.dart';
import 'pages/results_page_5.dart';

class ResultsController extends GetxController {
  static const route = '/results';

  final pageController = PageController();

  late List<ResultsPage> allPages = createAllResultsPages();
  List<ResultsPage> get pages => allPages;

  ScreenshotController foregroundScreenshotController = ScreenshotController();
  ScreenshotController backgroundScreenshotController = ScreenshotController();

  UserData get userData => UserManager.userData;

  RxInt currentPageIndex = 0.obs;
  ResultsPage get currentPage => allPages[currentPageIndex.value];

  bool get isTablet => Get.width >= 600;

  RxBool _loadingShare = false.obs;

  bool get loadingShare => _loadingShare.value;

  //Data
  List<Answer> _answersData = [];

  List<Answer> get answersData => _answersData;
  List<PartyUserDistance> _resultsData = [];

  PartyUserDistance? _maxPercentagePoliticParty;

  PartyUserDistance? get maxPercentagePoliticParty =>
      _maxPercentagePoliticParty ??
      (_resultsData.isEmpty ? null : _resultsData.first);

  //ResultsPage3
  List<CustomChartData> chartData = [];

  //ResultsPage4
  RxList<ScatterSpot> scatterSpots = <ScatterSpot>[].obs;

  //ResultsPage5
  List<Topic> _topics = [];
  List<Topic> get topics => _topics;

  //ResultsPage7
  String get countryName => UserManager.userCountry?.name ?? 'Your country';

  List<LocalParties>? get localParties => filterLocalPartiesByCountry();

  //ResultsPage9
  final swiperController = AppinioSwiperController();
  List<CardStatementData> cardsData = <CardStatementData>[];

  //ResultsPage10
  RxnBool willVote = RxnBool();

  //ResultPageAllParties
  late final allPartiesWithPercent = preparePoliticalPartiesWithPercent();

  //ResultPageCandidate
  RxnInt currentLocalCandidateIndex = RxnInt();
  late List<LocalParties> locaPartiesOfMaxParty;
  RxBool locaCandidateOpacityActive = true.obs;

  GlobalKey globalKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    _initData();

    pageController.addListener(() {
      currentPageIndex.value = pageController.page!.round();
      PlausibleManager.trackResult(currentPageIndex.value.toString());
    });

    PlausibleManager.trackPage(route);
    PlausibleManager.trackResult(
        currentPageIndex.value.toString()); // track first page
  }

  @override
  void onReady() {
    rickRollIfAllAnswersAreSame();
  }

  void rickRollIfAllAnswersAreSame() {
    final firstResponse = _answersData.first.answer;
    if (_answersData.every((element) => element.answer == firstResponse)) {
      Utils.launch(StringUtils.rickrollUrl);
      launchHome();
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void _initData() {
    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      final answersData =
          args[StringUtils.answersDataKey] as List<Map<String, dynamic>>;
      _answersData = answersData.map((e) => Answer.fromJson(e)).toList();

      _resultsData = ResultsHelper.getPartyUserDistances(_answersData);

      //Convert the data to the format that the chart needs
      //ATTENTION! Make sure to order list by value, from mayor to minor, before useing it. If not chart will not work
      var filteredResults = _resultsData
          .where((result) => result.party.inParliament == true)
          .toList();
      filteredResults.sort((b, a) => a.percentage.compareTo(b.percentage));

      chartData = filteredResults
          .take(7)
          .map((result) => CustomChartData(
                party: result.party.name,
                value: result.percentage.toDouble(),
                image: result.party.logo,
                percentage: '${result.percentage}%',
              ))
          .toList();
      _maxPercentagePoliticParty = getMajorPercentagePartyInParialment();
      getScatterPoints();
    }
    _setupCandidateScreen();

    _getCardsData();
    _getTopics();
  }

  _setupCandidateScreen() {
    locaPartiesOfMaxParty = (maxPercentagePoliticParty?.party.localParties ??
        [])
      ..shuffle(Random());
    if (locaPartiesOfMaxParty.isEmpty)
      debugPrint("No local parties found");
    else
      currentLocalCandidateIndex.value = 0;
  }

  nextCandidate() async {
    if (locaPartiesOfMaxParty.isEmpty) {
      debugPrint("No local parties found");
      return;
    }
    locaCandidateOpacityActive.value = false;
    await Future.delayed(Duration(milliseconds: 200));
    currentLocalCandidateIndex.value =
        (currentLocalCandidateIndex.value! + 1) % locaPartiesOfMaxParty.length;
    locaCandidateOpacityActive.value = true;
    await Future.delayed(Duration(milliseconds: 200));
  }

  List<ResultsPage> createAllResultsPages() {
    List<ResultsPage> results;
    switch (ElectionManager.currentElection.value) {
      case Election.DE:
        results = [
          ResultsPage1(),
          ResultsPage2(),
          ResultsPage3(),
          ResultsPage4(),
          ResultsPage5(),
          ResultsPage6(),
          ResultsPageCandidate(),
          ResultsPageAllParties(),
          ResultsPage8(),
          ResultsPage9(),
        ];
      case Election.EU:
        results = [
          ResultsPage1(),
          ResultsPage2(),
          ResultsPage3(),
          ResultsPage4(),
          ResultsPage5(),
          ResultsPage6(),
          ResultsPage7(),
          ResultsPage8(),
          ResultsPage9(),
        ];
    }

    bool isPastElection =
        ElectionManager.electionDate!.isBefore(DateTime.now());
    if (!isPastElection) {
      results.add(ResultsPage10(willVote: willVote));
    }
    return results;
  }

  void _getTopics() async {
    var topicsList = DataManager().getTopics();
    var availableTopicIds = ElectionManager.currentElection.value.result5Topics;
    _topics =
        topicsList.where((e) => availableTopicIds.contains(e.id)).toList();
    _topics.sort((a, b) => a.id!.compareTo(b.id!));
  }

  List<PoliticalPartyWithPercent> preparePoliticalPartiesWithPercent() {
    var partyUserDistance = ResultsHelper.getPartyUserDistances(_answersData);

    return partyUserDistance
        .map((result) => PoliticalPartyWithPercent(
              party: result.party,
              percent: result.percentage,
            ))
        .toList()
      ..sort((b, a) => a.percent.compareTo(b.percent));
  }

  PartyUserDistance? getMajorPercentagePartyInParialment() {
    if (_resultsData.isEmpty) return null;
    //Get the party with mayor percentage (minor distance)
    PartyUserDistance? maxPercentageParty;
    List<PartyUserDistance> topPercentageParties = [];
    double maxPercentageValue = double.negativeInfinity;

    for (PartyUserDistance data in _resultsData) {
      if (!data.party.inParliament) continue;
      if (data.percentage > maxPercentageValue) {
        maxPercentageValue = data.percentage.toDouble();
        topPercentageParties = [data];
      } else if (data.percentage == maxPercentageValue) {
        topPercentageParties.add(data);
      }
    }
    if (topPercentageParties.isEmpty) return null;
    //If there is more than one party with the same percentage, get a random one
    Random random = Random();
    maxPercentageParty =
        topPercentageParties[random.nextInt(topPercentageParties.length)];

    return maxPercentageParty;
  }

  Color getPartyColor() {
    final party = maxPercentagePoliticParty;
    if (party?.party.color != null) {
      return Color(int.parse(party!.party.color.substring(1, 7), radix: 16) +
          0xFF000000);
    } else {
      return AppColors.text;
    }
  }

  void changePage(TapDownDetails details) {
    if (details.localPosition.dx < Get.width * .25) {
      if (currentPageIndex.value > 0) previousPage();
    } else if (details.localPosition.dx > Get.width * .75) {
      nextPage();
    }
  }

  void previousPage() {
    debugPrint("results previousPage");
    pageController.previousPage(
      duration: Duration(milliseconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    debugPrint("results nextPage");
    final isLastPage = pageController.page?.round() == allPages.length - 1;
    if (isLastPage)
      Get.offAllNamed(HomePageController.route,
          arguments: {StringUtils.fromResultsKey: true});
    // Get.back();
    else {
      pageController.nextPage(
        duration: Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  List<LocalParties> filterLocalPartiesByCountry() {
    List<LocalParties> localParties = [];
    for (LocalParties localParty
        in maxPercentagePoliticParty?.party.localParties ?? []) {
      if (localParty.countryId == userData.countryId) {
        localParties.add(localParty);
      }
    }
    return localParties;
  }

  void launchUrl() {
    var currentLanguage = LanguageManager.currentLanguage;
    if (currentLanguage == 'ca') {
      currentLanguage = 'es';
    } else if (currentLanguage == 'tr') {
      currentLanguage = 'en';
    } else if (currentLanguage.contains('-')) {
      currentLanguage =
          currentLanguage.substring(0, currentLanguage.indexOf('-'));
    }

    Utils.launch(StringUtils.electionsUrl(currentLanguage));
    launchHome();
  }

  void launchHome() {
    Get.offAllNamed(HomePageController.route);
  }

  void shareContent() async {
    if (_loadingShare.value) return;
    _loadingShare.value = true;
    await Future.delayed(Durations.short1);

    final foregroundPromise = foregroundScreenshotController.capture();
    final backgroundPromise = backgroundScreenshotController.capture();

    final foregroundImageBytes = await foregroundPromise;
    final backgroundImageBytes = await backgroundPromise;

    final compositeScreenshotController = ScreenshotController();

    const screenshotWidth = 1080.0;
    const screenshotHeight = 1920.0;
    final bytes = await compositeScreenshotController.captureFromWidget(
        Container(
          width: screenshotWidth,
          height: screenshotHeight,
          child: Stack(
            children: [
              Image(
                  image: MemoryImage(backgroundImageBytes!),
                  width: screenshotWidth,
                  height: screenshotHeight,
                  fit: BoxFit.fill),
              Image.memory(foregroundImageBytes!)
            ],
          ),
        ),
        targetSize: ui.Size(screenshotWidth, screenshotHeight));

    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/screenshot.png');
    await file.writeAsBytes(bytes);
    final xFile = XFile(file.path);
    await Share.shareXFiles(
      [xFile], /* text: '#Palumba | ${StringUtils.webUrl}'*/
    );
    _loadingShare.value = false;
  }

  void getScatterPoints() async {
    //This are parties Scatter points
    for (var data in _resultsData) {
      if (data.party.inParliament == false) continue;
      final partyPosition = calculateCompassPosition(data.party.answers ?? []);

      final ui.Image image = await SvgHelper.loadSvgFromUrl(data.party.logo);
      scatterSpots
          .add(ScatterSpot(partyPosition.positionX, partyPosition.positionY,
              dotPainter: FlDotCirclePainterCustom(
                image: image,
                color: Colors.transparent,
                radius: 17,
              )));
    }
    final userPosition = calculateCompassPosition(answersData);

    //This is user scatter point
    scatterSpots.add(ScatterSpot(userPosition.positionX, userPosition.positionY,
        dotPainter: FlDotCirclePainterCustom(
            image: await SvgHelper.loadSvgFromAssets('img_heart_arrow'),
            radius: 17,
            imageRounded: false)));
  }

  Future<ui.Image> loadAssetImage(String asset) async {
    final bytes = await rootBundle.load('assets/images/${asset}.png');

    final codec = await ui.instantiateImageCodec(bytes.buffer.asUint8List());
    final frame = await codec.getNextFrame();

    return frame.image;
  }

  void _getCardsData() {
    var myAnswers = _answersData
        .where((element) =>
            element.answer == StatementResponse.stronglyAgree ||
            element.answer == StatementResponse.stronglyDisagree)
        .toList();
    for (var myAnswer in myAnswers) {
      var statement = DataManager()
          .getStatements()
          .where((statement) => statement.isTutorial == false)
          .toList()
          .firstWhereOrNull((element) => element.id == myAnswer.statementId);
      if (statement != null) {
        var parties = DataManager().getParties().where((element) {
          var answer = element.answers?.firstWhereOrNull(
              (element) => element.statementId == statement.id);
          return answer != null && answer.answer == myAnswer.answer;
        }).toList();

        cardsData.add(CardStatementData(
            statement: statement, answer: myAnswer, parties: parties));
      }
    }
  }

  //Page 4 calculate compass position

  CompassData calculateCompassPosition(List<Answer> answers) {
    var axisTopic = ElectionManager.currentElection.value.result4AxisTopic;

    double dimEuIntegration =
        ResultsHelper.calculateTopicDimension(answers, axisTopic.y);
    double dimLeftRight =
        ResultsHelper.calculateTopicDimension(answers, axisTopic.x);
    final maxMagnitudeEuIntegration =
        ResultsHelper.maxMagnitudeForTopicsDimension(axisTopic.y);
    final maxMagnitudeLeftRight =
        ResultsHelper.maxMagnitudeForTopicsDimension(axisTopic.x);

    double normEuIntegration = maxMagnitudeEuIntegration == 0
        ? 0
        : dimEuIntegration / maxMagnitudeEuIntegration;
    double normLeftRight =
        maxMagnitudeLeftRight == 0 ? 0 : dimLeftRight / maxMagnitudeLeftRight;

    return CompassData(positionX: normLeftRight, positionY: normEuIntegration);
  }

  //Page 5 calculate needle position
  NeedleData needlePositionsForTopic(
    int topicId,
  ) {
    final userParty = maxPercentagePoliticParty?.party;
    final answers = answersData;
    var parties = DataManager().getParties();
    parties = parties
        .where(
            (party) => party.inParliament == true || party.id == userParty!.id)
        .toList();

    Map<String, double> epGroupDimensions = {};
    if (userParty == null) {
      return NeedleData(fraction: 0, topicMatch: null);
    }
    String bestMatch = userParty.id.toString();
    for (var entry in parties) {
      epGroupDimensions[entry.id.toString()] =
          ResultsHelper.calculateTopicDimension(entry.answers!, topicId);
    }
    double userDimension =
        ResultsHelper.calculateTopicDimension(answers, topicId);

    // Calculate the distances between the user's dimension and the dimensions of each endpoint group
    Map<String, double> epGroupDistances = {};
    for (var entry in epGroupDimensions.entries) {
      epGroupDistances[entry.key] = (entry.value - userDimension).abs();
    }
    // Sort the endpoint groups by their distance to the user's dimension
    List<String> epGroupDistanceRanking = epGroupDistances.keys.toList()
      ..sort((a, b) => epGroupDistances[a]!.compareTo(epGroupDistances[b]!));

    String topicMatch =
        epGroupDistanceRanking[0]; //epGroupDistanceRanking.last;
    if (topicMatch == bestMatch) {
      topicMatch = epGroupDistanceRanking[
          1]; //epGroupDistanceRanking[epGroupDistanceRanking.length - 2];
    }

    double bestMatchDistance = epGroupDistances[bestMatch]!;
    double topicMatchDistance = epGroupDistances[topicMatch]!;

    double fraction = (bestMatchDistance + topicMatchDistance == 0)
        ? 0
        : bestMatchDistance / (bestMatchDistance + topicMatchDistance);

    //Get topicPartie logo
    final topicMatchParty =
        parties.firstWhere((element) => element.id.toString() == topicMatch);

    return NeedleData(fraction: fraction, topicMatch: topicMatchParty);
  }

//Page 8 calculate max topic
  MaxTopic maxTopicPercentage() {
    // use all topics except left/right
    const leftRightTopic = 3;
    final topics = DataManager()
        .getTopics()
        .where((topic) => topic.id != leftRightTopic)
        .toList();
    final answers = answersData;

    double maxValue = 0;
    Topic maxTopic = topics.first;
    for (var topic in topics) {
      final value = ResultsHelper.topicMatchPercentage(topic.id!, answers);
      if (value.abs() > maxValue.abs()) {
        maxTopic = topic;
        maxValue = value;
      }
    }
    return MaxTopic(
        isExtreme1: maxValue < 0,
        percentage: (maxValue.abs() * 100).toStringAsFixed2(0),
        topicData: maxTopic);
  }

  // Page 10 handle voting question
  void handleGoVoteQuestion(GoingToVote goingToVote) {
    DataRepository().patchResponses(goingToVote);
    switch (goingToVote) {
      case GoingToVote.no:
        this.nextPage();
        break;
      case GoingToVote.maybe:
      case GoingToVote.yes:
        this.willVote.value = true;
        break;
    }
  }
}
