import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:palumba_eu/modules/results/components/custom_mds_graphic/scatter_points.dart';
import 'package:palumba_eu/modules/results/helpers/results_helper.dart';
import 'package:palumba_eu/modules/results/helpers/svg_helper.dart';
import 'package:palumba_eu/modules/results/pages/results_page_1.dart';
import 'package:palumba_eu/modules/results/pages/results_page_9.dart';
import 'package:palumba_eu/modules/results/pages/results_page_2.dart';
import 'package:palumba_eu/modules/results/pages/results_page_3.dart';
import 'package:palumba_eu/modules/results/pages/results_page_4.dart';
import 'package:palumba_eu/modules/results/pages/results_page_6.dart';
import 'package:palumba_eu/modules/results/pages/results_page_7.dart';
import 'package:palumba_eu/modules/results/pages/results_page_10.dart';
import 'package:palumba_eu/modules/results/pages/results_page_8.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/extensions.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
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

  final topicEuIntegration = 2;
  final topicLeftRight = 3;

  final pageController = PageController();
  final List<Widget> allPages = [
    ResultsPage1(key: Key("1")),
    ResultsPage2(key: Key("2")),
    ResultsPage3(key: Key("3")),
    ResultsPage4(key: Key("4")),
    ResultsPage5(key: Key("5")),
    ResultsPage6(key: Key("6")),
    ResultsPage7(key: Key("7")),
    ResultsPage8(key: Key("8")),
    ResultsPage9(key: Key("9")),
    ResultsPage10(key: Key("10")),
  ];

  final List<Widget> noCardsPages = [
    ResultsPage1(key: Key("1")),
    ResultsPage2(key: Key("2")),
    ResultsPage3(key: Key("3")),
    ResultsPage4(key: Key("4")),
    ResultsPage5(key: Key("5")),
    ResultsPage6(key: Key("6")),
    ResultsPage7(key: Key("7")),
    ResultsPage8(key: Key("8")),
    ResultsPage10(key: Key("10")),
  ];

  List<Widget> get pages => cardsData.isNotEmpty ? allPages : noCardsPages;

  List<int> get showButtonSharePages => cardsData.isNotEmpty
      ? [1, 2, 3, 4, 6, 7, 8]
      : [
          1,
          2,
          3,
          4,
          6,
          7,
        ];

  /*final List<ScreenshotController?> screenshotPagesControllers = [
    null,
    ScreenshotController(),
    ScreenshotController(),
    ScreenshotController(),
    ScreenshotController(),
    null,
    ScreenshotController(),
    ScreenshotController(),
    ScreenshotController(),
    null,
  ];*/
  ScreenshotController foregroundScreenshotController = ScreenshotController();
  ScreenshotController backgroundScreenshotController = ScreenshotController();

  UserData get userData => UserManager.userData;

  RxInt _currentPage = 0.obs;

  int get currentPage => _currentPage.value;

  bool get isSpecialPage =>
      _currentPage.value == 5 ||
      (cardsData.isNotEmpty && _currentPage.value == 8);

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

  GlobalKey globalKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    _initData();

    pageController.addListener(() {
      _currentPage.value = pageController.page!.round();
    });
  }

  @override
  void onReady() {
    // rickroll if all the same response
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
      _resultsData.forEach((result) {
        chartData.add(CustomChartData(
          party: result.party.name ?? result.party.acronym ?? '',
          value: result.percentage.toDouble(),
          image: result.party.logo ?? '',
          percentage: '${result.percentage}%',
        ));
      });
      //ATTENTION! Make sure to order list by value, from mayor to minor, before user it. If not chart will not work
      chartData.sort((b, a) => a.value.compareTo(b.value));
      _maxPercentagePoliticParty = getMajorPercentageParty();
      getScatterPoints();
    }

    _getCardsData();
    _getTopics();
  }

  void _getTopics() async {
    var topicsList = DataManager().getTopics();
    _topics = topicsList.where((e) => e.id != 2 && e.id != 3).toList();
    _topics.sort((a, b) => a.id!.compareTo(b.id!));
  }

  PartyUserDistance? getMajorPercentageParty() {
    if (_resultsData.isEmpty) return null;
    //Get the party with mayor percentage (minor distance)
    PartyUserDistance? maxPercentageParty;
    List<PartyUserDistance> topPercentageParties = [];
    double maxPercentageValue = double.negativeInfinity;

    for (PartyUserDistance data in _resultsData) {
      if (data.percentage > maxPercentageValue) {
        maxPercentageValue = data.percentage.toDouble();
        topPercentageParties = [data];
      } else if (data.percentage == maxPercentageValue) {
        topPercentageParties.add(data);
      }
    }
    //If there is more than one party with the same percentage, get a random one
    Random random = Random();
    maxPercentageParty =
        topPercentageParties[random.nextInt(topPercentageParties.length)];

    return maxPercentageParty;
  }

  Color getPartyColor() {
    final party = maxPercentagePoliticParty;
    if (party?.party.color != null) {
      return Color(int.parse(party!.party.color!.substring(1, 7), radix: 16) +
          0xFF000000);
    } else {
      return AppColors.text;
    }
  }

  void changePage(TapDownDetails details) {
    if (details.localPosition.dx < Get.width * .25) {
      if (currentPage > 0) {
        pageController.previousPage(
          duration: Duration(milliseconds: 1),
          curve: Curves.easeInOut,
        );
      }
    } else if (details.localPosition.dx > Get.width * .75) {
      if (currentPage < pages.length - 1) {
        pageController.nextPage(
          duration: Duration(milliseconds: 1),
          curve: Curves.easeInOut,
        );
      }
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
    await file.writeAsBytes(bytes!);
    final xFile = XFile(file.path);
    await Share.shareXFiles(
      [xFile], /* text: '#Palumba | ${StringUtils.webUrl}'*/
    );
    _loadingShare.value = false;
  }

/*
  Future<ui.Image> loadSvgAsset(String asset) async {
    final String rawSvg =
        await rootBundle.loadString('assets/images/${asset}.svg');

    final pictureInfo =
        await vg.loadPicture(SvgStringLoader(rawSvg), null, clipViewbox: false);
    final ui.Image image = await pictureInfo.picture.toImage(120, 120);

    pictureInfo.picture.dispose();

    return image;
  }
  */

  void getScatterPoints() async {
    //This are parties Scatter points
    for (var data in _resultsData) {
      final partyPosition = calculateCompassPosition(data.party.answers ?? []);

      final ui.Image image =
          await SvgHelper.loadSvgFromUrl(data.party.logo ?? '');
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
    double dimEuIntegration =
        ResultsHelper.calculateTopicDimension(answers, topicEuIntegration);
    double dimLeftRight = ResultsHelper.calculateTopicDimension(answers, 3);
    final maxMagnitudeEuIntegration =
        ResultsHelper.maxMagnitudeForTopicsDimension(topicEuIntegration);
    final maxMagnitudeLeftRight =
        ResultsHelper.maxMagnitudeForTopicsDimension(topicLeftRight);

    double normEuIntegration = dimEuIntegration / maxMagnitudeEuIntegration;
    double normLeftRight = dimLeftRight / maxMagnitudeLeftRight;

    return CompassData(positionX: normLeftRight, positionY: normEuIntegration);
  }

  //Page 5 calculate needle position
  NeedleData needlePositionsForTopic(
    int topicId,
  ) {
    final userParty = maxPercentagePoliticParty?.party;
    final answers = answersData;
    final parties = DataManager().getParties();

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

    double fraction =
        bestMatchDistance / (bestMatchDistance + topicMatchDistance);

    //Get topicPartie logo
    final topicMatchParty =
        parties.firstWhere((element) => element.id.toString() == topicMatch);

    return NeedleData(fraction: fraction, topicMatch: topicMatchParty);
  }

//Page 8 calculate max topic
  MaxTopic maxTopicPercentage() {
    // use all topics except left/right
    final topics = DataManager()
        .getTopics()
        .where((topic) => topic.id != topicLeftRight)
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
        topicData: maxTopic!);
  }
}
