import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/elections_response.dart';
import 'package:palumba_eu/data/model/goingToVote_model.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/model/responses_patch_request.dart';
import 'package:palumba_eu/data/model/responses_request.dart';
import 'package:palumba_eu/data/model/responses_response.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/sponsors_data.dart';
import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';

class DataAPI {
  // var baseUrl = 'https://api.palumba-app.palumba.eu';
  // var baseUrl = 'https://palumba-staging.bitperfect-software.com/api';

  // var baseUrl = 'http://palumba-us.bitperfect-software.com/api';

  var headers = {
    'Accept': 'application/json',
  };

  String baseUrl() {
    return ElectionManager.currentElection.value.backend == Election.NY.backend
        ? 'http://palumba-us.bitperfect-software.com/api'
        : 'https://api.palumba-app.palumba.eu';
  }

  String urlLang() {
    return baseUrl() + '/${LanguageManager.currentLanguage}/';
  }

  String urlLangAndEl() {
    return urlLang() +
        'elections/${ElectionManager.currentElection.value.backend}/';
  }

  Future<LocalizationData?> fetchLocalizations() async {
    try {
      final url = Uri.parse('${urlLangAndEl()}' 'localization');
      print("localization $url");
      final response = await http.get(
        url,
        headers: headers,
      );
      print("fetchLocalizations : ${json.decode(response.body)}");
      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var localization = LocalizationData.fromJson(json.decode(response.body));
      if (ElectionManager.currentElection.value==Election.NY && localization.languages!=null && !localization.languages!.any((l) => l.name=='Español')) {
        localization.languages?.add(Language(id:100, name:'Español', languagecode:'es-US'));
        localization.languages?.add(Language(id:101, name:'简体中文', languagecode:'zh'));
        localization.languages?.add(Language(id:102, name:'Русский', languagecode:'ru'));
        //localization.languages?.add(Language(id:103, name:'עברית', languagecode:'he'));
        
      }
      
      DataManager().setLanguages(localization.languages ?? []);
      DataManager().setCountries(localization.countries);
      return localization;
    } catch (e) {
      return null;
    }
  }

  Future<StatementsData?> fetchStatements() async {
    try {
      if (LanguageManager.currentLanguage == 'es-US') {
        print("decoding");
        var statements = StatementsData.fromJson(json.decode('''
{
  "data": [
    {
      "id": 6,
      "statement": "Ejemplo: Deberíamos volver a tener pizza de 0.99",
      "details": "<p><strong>Dato curioso:<\/strong><br>Hay más de 1,800 pizzerías en toda la ciudad de Nueva York, y Manhattan lidera el ranking como el distrito más famoso por su pizza (<a href=\\"https:\/\/gosnappy.io\/blog\/new-york-city-pizza-restaurant-statistics\/\\"><span style=\\"text-decoration: underline;\\">Snappy<\/span><\/a>).<\/p><p><strong>¿Sabías que...?<\/strong><br>El “principio de la pizza”, también conocido como la “conexión pizza–metro”, es una ley económica humorística que dice que el precio de una porción de pizza en la ciudad de Nueva York coincide con el precio de un boleto sencillo del metro. Al parecer, la relación entre los precios de la pizza y las tarifas del metro es bastante sólida: cuando uno sube, el otro generalmente también lo hace (<a href=\\"https:\/\/www.nytimes.com\/2002\/01\/12\/nyregion\/nyc-beware-the-price-of-a-slice.html\\"><span style=\\"text-decoration: underline;\\">New York Times<\/span><\/a>).<\/p>",
      "footnote": "<p>Prueba<\/p>",
      "emojis": "\ud83c\udf55\ud83d\udcb8\u2198\ufe0f",
      "weights": [],
      "is_tutorial": true
    },
    {
      "id": 5,
      "statement": "Reducir el financiamiento a la policía",
      "details": "<p>Prueba<\/p>",
      "footnote": "<p>Prueba<\/p>",
      "emojis": "\ud83d\udcaf\ud83d\udcaf\ud83d\udcaf",
      "weights": [
        { "topic_id": 3, "weight": 0 },
        { "topic_id": 2, "weight": -50 }
      ],
      "is_tutorial": false
    },
    {
      "id": 7,
      "statement": "Colaborar con Trump",
      "details": "<p>Prueba<\/p>",
      "footnote": "<p>Prueba<\/p>",
      "emojis": "\ud83d\udcaf\ud83d\udcaf\ud83d\udcaf",
      "weights": [
        { "topic_id": 2, "weight": 50 },
        { "topic_id": 3, "weight": -50 }
      ],
      "is_tutorial": false
    },
    {
      "id": 8,
      "statement": "Congelar el alquiler",
      "details": "<p>Prueba<\/p>",
      "footnote": "<p>Prueba<\/p>",
      "emojis": "\ud83d\udcaf\ud83d\udcaf\ud83d\udcaf",
      "weights": [
        { "topic_id": 3, "weight": 0 },
        { "topic_id": 2, "weight": -50 }
      ],
      "is_tutorial": false
    }
  ]
}

'''));
        print("setting statements");
        DataManager().setStatements(statements.data);
        print("returning");
        return statements;
      }
      if (LanguageManager.currentLanguage == 'ru') {
        var statements = StatementsData.fromJson(json.decode('''
{
  "data": [
    {
      "id": 6,
      "statement": "Пример: Нам нужно вернуть пиццу за \$0.99",
      "details": "<p><strong>Интересный факт:<\/strong><br>В Нью-Йорке более 1 800 пиццерий, и Манхэттен лидирует как главный район по количеству заведений с пиццей (<a href=\\"https:\/\/gosnappy.io\/blog\/new-york-city-pizza-restaurant-statistics\/\\"><span style=\\"text-decoration: underline;\\">Snappy<\/span><\/a>).<\/p><p><strong>Знаете ли вы?<\/strong><br>«Принцип пиццы», также известный как «связь пиццы и метро», — это шуточный экономический закон, согласно которому цена одного куска пиццы в Нью-Йорке примерно равна цене проезда в метро. Говорят, что эта зависимость довольно прочная: когда повышается цена на пиццу, вскоре растёт и стоимость проезда (<a href=\\"https:\/\/www.nytimes.com\/2002\/01\/12\/nyregion\/nyc-beware-the-price-of-a-slice.html\\"><span style=\\"text-decoration: underline;\\">New York Times<\/span><\/a>).<\/p>",
      "footnote": "<p>Тест<\/p>",
      "emojis": "\ud83c\udf55\ud83d\udcb8\u2198\ufe0f",
      "weights": [],
      "is_tutorial": true
    },
    {
      "id": 5,
      "statement": "Сократить финансирование полиции",
      "details": "<p>Тест<\/p>",
      "footnote": "<p>Тест<\/p>",
      "emojis": "\ud83d\udcaf\ud83d\udcaf\ud83d\udcaf",
      "weights": [
        { "topic_id": 3, "weight": 0 },
        { "topic_id": 2, "weight": -50 }
      ],
      "is_tutorial": false
    },
    {
      "id": 7,
      "statement": "Сотрудничать с Трампом",
      "details": "<p>Тест<\/p>",
      "footnote": "<p>Тест<\/p>",
      "emojis": "\ud83d\udcaf\ud83d\udcaf\ud83d\udcaf",
      "weights": [
        { "topic_id": 2, "weight": 50 },
        { "topic_id": 3, "weight": -50 }
      ],
      "is_tutorial": false
    },
    {
      "id": 8,
      "statement": "Заморозить арендную плату",
      "details": "<p>Тест<\/p>",
      "footnote": "<p>Тест<\/p>",
      "emojis": "\ud83d\udcaf\ud83d\udcaf\ud83d\udcaf",
      "weights": [
        { "topic_id": 3, "weight": 0 },
        { "topic_id": 2, "weight": -50 }
      ],
      "is_tutorial": false
    }
  ]
}


'''));
        DataManager().setStatements(statements.data);
        return statements;
      }
      if (LanguageManager.currentLanguage == 'zh') {
        var statements = StatementsData.fromJson(json.decode('''
{
  "data": [
    {
      "id": 6,
      "statement": "示例：我们应该恢复售卖 0.99 美元的披萨",
      "details": "<p><strong>趣闻：<\/strong><br>纽约市有超过 1,800 家披萨餐厅，其中曼哈顿在数量上排名第一，被认为是披萨之都 (<a href=\\"https:\/\/gosnappy.io\/blog\/new-york-city-pizza-restaurant-statistics\/\\"><span style=\\"text-decoration: underline;\\">Snappy<\/span><\/a>)。<\/p><p><strong>你知道吗？<\/strong><br>所谓“披萨原理”，又称“披萨-地铁关联”，是一条幽默的经济规律，意思是纽约市一片披萨的价格通常与地铁单程票价相等。据说披萨价格与地铁票价之间的关系相当稳定——当其中一个上涨时，另一个通常也会随之上调 (<a href=\\"https:\/\/www.nytimes.com\/2002\/01\/12\/nyregion\/nyc-beware-the-price-of-a-slice.html\\"><span style=\\"text-decoration: underline;\\">纽约时报<\/span><\/a>)。<\/p>",
      "footnote": "<p>测试<\/p>",
      "emojis": "\ud83c\udf55\ud83d\udcb8\u2198\ufe0f",
      "weights": [],
      "is_tutorial": true
    },
    {
      "id": 5,
      "statement": "削减警方经费",
      "details": "<p>测试<\/p>",
      "footnote": "<p>测试<\/p>",
      "emojis": "\ud83d\udcaf\ud83d\udcaf\ud83d\udcaf",
      "weights": [
        { "topic_id": 3, "weight": 0 },
        { "topic_id": 2, "weight": -50 }
      ],
      "is_tutorial": false
    },
    {
      "id": 7,
      "statement": "与特朗普合作",
      "details": "<p>测试<\/p>",
      "footnote": "<p>测试<\/p>",
      "emojis": "\ud83d\udcaf\ud83d\udcaf\ud83d\udcaf",
      "weights": [
        { "topic_id": 2, "weight": 50 },
        { "topic_id": 3, "weight": -50 }
      ],
      "is_tutorial": false
    },
    {
      "id": 8,
      "statement": "冻结房租",
      "details": "<p>测试<\/p>",
      "footnote": "<p>测试<\/p>",
      "emojis": "\ud83d\udcaf\ud83d\udcaf\ud83d\udcaf",
      "weights": [
        { "topic_id": 3, "weight": 0 },
        { "topic_id": 2, "weight": -50 }
      ],
      "is_tutorial": false
    }
  ]
}


'''));
        DataManager().setStatements(statements.data);
        return statements;
      }




      final url = Uri.parse('${urlLangAndEl()}' 'statements?include_tutorial');
      print(url);
      final response = await http.get(
        url,
        headers: headers,
      );
      // print("Response : fetchStatements ${json.decode(response.body)}");
      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var statements = StatementsData.fromJson(json.decode(response.body));
      DataManager().setStatements(statements.data);
      return statements;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ResultsData?> fetchResultsInfo() async {
    try {

      if (LanguageManager.currentLanguage == 'es-US') {
        var results = ResultsData.fromJson(json.decode('''
{
  "topics": [
    {
      "id": 2,
      "name": "Espectro tradicional izquierda-derecha",
      "icon": "https://palumba-storage-us.b-cdn.net/01K6RB2EKYYNBY8947QDAASRYN.svg",
      "color": "#030303",
      "extreme1": "Izquierda",
      "extreme1_emojis": "\ud83d\udc6e\ud83d\udea8\ud83d\udc6e",
      "extreme1_details": "<p>Este es el tema que más te importa y definitivamente exiges que el futuro alcalde le preste total atención<\/p>",
      "extreme2": "Derecha",
      "extreme2_emojis": "\ud83d\udc6e\ud83d\udea8\ud83d\udc6e",
      "extreme2_details": "<p>Este es el tema que más te importa y definitivamente exiges que el futuro alcalde le preste total atención<\/p>",
      "associated_statements": []
    },
    {
      "id": 3,
      "name": "Administración Trump",
      "icon": "https://palumba-storage-us.b-cdn.net/01K6RB6XRHT57CKWM0B7RCJDFZ.svg",
      "color": "#533B6A",
      "extreme1": "Colaborar con Trump (1)",
      "extreme1_emojis": "\ud83d\udc6e\ud83d\udea8\ud83d\udc6e",
      "extreme1_details": "<p>Este es el tema que más te importa y definitivamente exiges que el futuro alcalde le preste total atención<\/p>",
      "extreme2": "Boicotear a Trump (2)",
      "extreme2_emojis": "\ud83d\udc6e\ud83d\udea8\ud83d\udc6e",
      "extreme2_details": "<p>Este es el tema que más te importa y definitivamente exiges que el futuro alcalde le preste total atención<\/p>",
      "associated_statements": [8, 7, 5]
    }
  ],
  "parties": [
    {
      "id": 4,
      "name": "Andrew Cuomo",
      "color": "#172bcc",
      "logo": "https://palumba-storage-us.b-cdn.net/parties/logos/01K6ZJQS31ZSQJGDWV5ZGMXXJ9.svg",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://www.andrewcuomo.com/",
      "acronym": "C",
      "answers": [
        { "statement_id": 8, "answer": -1 },
        { "statement_id": 7, "answer": 0 },
        { "statement_id": 5, "answer": 0 }
      ],
      "positions": [
        { "topic_id": 2, "position": 50 },
        { "topic_id": 3, "position": -50 }
      ],
      "in_parliament": true,
      "unavailable_in": [],
      "profile": {
        "bio": "<p><strong>\u2139\ufe0f<\/strong> Andrew Cuomo · <strong>\ud83c\udf82<\/strong> 6 de diciembre de 1957 (67 años) · \ud83c\udfe0  Midtown, Manhattan · \ud83d\udcab  Sagitario<\/p>",
        "affiliation": "<p>Candidato independiente tras perder la nominación demócrata. Cuomo fue gobernador de Nueva York (2011–2021) hasta su renuncia por acusaciones de acoso sexual a 13 mujeres. Su campaña para la alcaldía de NYC enfatiza su experiencia, la seguridad pública y la asequibilidad.<\/p>",
        "red_flags": "<p>\ud83d\udea9 “El Departamento de Justicia dice que Andrew Cuomo acosó sexualmente a 13 mujeres” - <a href=\\"https://www.politico.com/news/2024/01/26/cuomo-sexual-harassment-doj-00138140\\"><span style=\\"text-decoration: underline;\\">Politico<\/span><\/a> · \ud83d\udea9 “El gobernador Andrew Cuomo renuncia en medio de llamados a su destitución por el escándalo de acoso sexual” - <a href=\\"https://www.cbsnews.com/newyork/news/cuomo-resigns-new-york-governor-sexual-harassment-scandal/\\"><span style=\\"text-decoration: underline;\\">CBS New York<\/span><\/a> · \ud83d\udea9 “Cuomo bajo fuego en el debate sobre muertes por COVID en hogares de ancianos” - <a href=\\"https://www.nytimes.com/2025/06/04/nyregion/andrew-cuomo-nursing-homes-deaths.html\\"><span style=\\"text-decoration: underline;\\">NY Times<\/span><\/a>&nbsp;<\/p>",
        "link1": "https://www.instagram.com/andrewcuomo/?hl=en",
        "link1_text": "Instagram",
        "link2": "https://x.com/andrewcuomo",
        "link2_text": "Twitter"
      }
    },
    {
      "id": 3,
      "name": "Zohran Mamdani",
      "color": "#ad3131",
      "logo": "https://palumba-storage-us.b-cdn.net/parties/logos/01K6ZJPYJX6GGHRV6SJYHPDRT3.svg",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://www.zohranfornyc.com/",
      "acronym": "M",
      "answers": [
        { "statement_id": 8, "answer": 1 },
        { "statement_id": 7, "answer": -1 },
        { "statement_id": 5, "answer": 1 }
      ],
      "positions": [
        { "topic_id": 2, "position": -50 },
        { "topic_id": 3, "position": 50 }
      ],
      "in_parliament": true,
      "unavailable_in": [],
      "profile": {
        "bio": "<p><strong>\u2139\ufe0f<\/strong> Zohran Kwame Mamdani · <strong>\ud83c\udf82<\/strong> 18 de octubre de 1991 (34 años) · \ud83c\udfe0  Astoria, Queens · \ud83d\udcab  Libra<\/p>",
        "affiliation": "<p>Nombrado por el Partido Demócrata, miembro de los Socialistas Democráticos de América. Representa a Queens en la Asamblea Estatal de Nueva York desde 2021. Anteriormente fue asesor de vivienda para prevención de ejecuciones hipotecarias. Se enfoca en la asequibilidad (congelar rentas, supermercados públicos, aumento de salarios), la reforma de seguridad pública, el transporte gratuito y los impuestos a altos ingresos.<\/p>",
        "red_flags": "<p>\ud83d\udea9 “¿Debería Zohran Mamdani poder vivir en un apartamento con renta estabilizada?” - <a href=\\"https://gothamist.com/news/should-zohran-mamdani-get-to-live-in-a-rent-stabilized-unit-we-asked-his-neighbors\\"><span style=\\"text-decoration: underline;\\">The Gothamist<\/span><\/a> · \ud83d\udea9 “Críticos dicen que Zohran Mamdani es antisemita” - <a href=\\"https://www.politico.com/news/2025/06/22/critics-say-zohran-mamdani-is-antisemitic-he-says-hes-simply-holding-israel-accountable-00416388?fbclid=IwZXh0bgNhZW0CMTEAAR4VE9k49S3UqYEN8WOvXDbOBzgCpcYjbVByPAVG3Mua6d0av2dDE7lceM9AYQ_aem_m9NURtS25u5euqnlLjEI3A\\"><span style=\\"text-decoration: underline;\\">Politico<\/span><\/a><\/p>",
        "link1": "https://www.instagram.com/zohrankmamdani/?hl=en",
        "link1_text": "Instagram",
        "link2": "https://www.tiktok.com/@zohran_k_mamdani?lang=en",
        "link2_text": "TikTok"
      }
    },
    {
      "id": 5,
      "name": "Curtis Sliwa",
      "color": "#e63131",
      "logo": "https://palumba-storage-us.b-cdn.net/parties/logos/01K72EZ863V3GXKK9E5YGK5AX3.svg",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://www.sliwafornyc.com/",
      "acronym": "S",
      "answers": [
        { "statement_id": 8, "answer": 0 },
        { "statement_id": 7, "answer": 1 },
        { "statement_id": 5, "answer": 0 }
      ],
      "positions": [
        { "topic_id": 2, "position": 0 },
        { "topic_id": 3, "position": 0 }
      ],
      "in_parliament": true,
      "unavailable_in": [],
      "profile": {
        "bio": "<p>Prueba<\/p>",
        "affiliation": "<p>Prueba<\/p>",
        "red_flags": "<p>Prueba<\/p>",
        "link1": "https://palumba.org",
        "link1_text": "Prueba",
        "link2": "https://palumba.org",
        "link2_text": "Prueba"
      }
    }
  ]
}

'''));
        DataManager().setParties(results.parties);
        DataManager().setTopics(results.topics);
        return results;
      }
      if (LanguageManager.currentLanguage == 'ru') {
        var results = ResultsData.fromJson(json.decode('''
{
  "topics": [
    {
      "id": 2,
      "name": "Традиционный спектр лево-право",
      "icon": "https://palumba-storage-us.b-cdn.net/01K6RB2EKYYNBY8947QDAASRYN.svg",
      "color": "#030303",
      "extreme1": "Левые",
      "extreme1_emojis": "\ud83d\udc6e\ud83d\udea8\ud83d\udc6e",
      "extreme1_details": "<p>Это вопрос, который для вас наиболее важен, и вы требуете, чтобы будущий мэр уделил ему полное внимание<\/p>",
      "extreme2": "Правые",
      "extreme2_emojis": "\ud83d\udc6e\ud83d\udea8\ud83d\udc6e",
      "extreme2_details": "<p>Это вопрос, который для вас наиболее важен, и вы требуете, чтобы будущий мэр уделил ему полное внимание<\/p>",
      "associated_statements": []
    },
    {
      "id": 3,
      "name": "Администрация Трампа",
      "icon": "https://palumba-storage-us.b-cdn.net/01K6RB6XRHT57CKWM0B7RCJDFZ.svg",
      "color": "#533B6A",
      "extreme1": "Сотрудничать с Трампом (1)",
      "extreme1_emojis": "\ud83d\udc6e\ud83d\udea8\ud83d\udc6e",
      "extreme1_details": "<p>Это вопрос, который для вас наиболее важен, и вы требуете, чтобы будущий мэр уделил ему полное внимание<\/p>",
      "extreme2": "Бойкотировать Трампа (2)",
      "extreme2_emojis": "\ud83d\udc6e\ud83d\udea8\ud83d\udc6e",
      "extreme2_details": "<p>Это вопрос, который для вас наиболее важен, и вы требуете, чтобы будущий мэр уделил ему полное внимание<\/p>",
      "associated_statements": [8, 7, 5]
    }
  ],
  "parties": [
    {
      "id": 4,
      "name": "Эндрю Куомо",
      "color": "#172bcc",
      "logo": "https://palumba-storage-us.b-cdn.net/parties/logos/01K6ZJQS31ZSQJGDWV5ZGMXXJ9.svg",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://www.andrewcuomo.com/",
      "acronym": "C",
      "answers": [
        { "statement_id": 8, "answer": -1 },
        { "statement_id": 7, "answer": 0 },
        { "statement_id": 5, "answer": 0 }
      ],
      "positions": [
        { "topic_id": 2, "position": 50 },
        { "topic_id": 3, "position": -50 }
      ],
      "in_parliament": true,
      "unavailable_in": [],
      "profile": {
        "bio": "<p><strong>\u2139\ufe0f<\/strong> Эндрю Куомо · <strong>\ud83c\udf82<\/strong> 6 декабря 1957 г. (67 лет) · \ud83c\udfe0  Мидтаун, Манхэттен · \ud83d\udcab  Стрелец<\/p>",
        "affiliation": "<p>Независимый кандидат после поражения на демократических праймериз. Куомо был губернатором штата Нью-Йорк (2011–2021), но ушёл в отставку после обвинений в сексуальных домогательствах, выдвинутых 13 женщинами. Его кампания на пост мэра Нью-Йорка делает упор на опыте, общественной безопасности и доступности жилья.<\/p>",
        "red_flags": "<p>\ud83d\udea9 «Минюст утверждает, что Эндрю Куомо домогался 13 женщин» — <a href=\\"https://www.politico.com/news/2024/01/26/cuomo-sexual-harassment-doj-00138140\\"><span style=\\"text-decoration: underline;\\">Politico<\/span><\/a> · \ud83d\udea9 «Губернатор Эндрю Куомо уходит в отставку на фоне призывов к импичменту из-за скандала с сексуальными домогательствами» — <a href=\\"https://www.cbsnews.com/newyork/news/cuomo-resigns-new-york-governor-sexual-harassment-scandal/\\"><span style=\\"text-decoration: underline;\\">CBS New York<\/span><\/a> · \ud83d\udea9 «Куомо подвергся критике на дебатах из-за смертей от COVID в домах престарелых» — <a href=\\"https://www.nytimes.com/2025/06/04/nyregion/andrew-cuomo-nursing-homes-deaths.html\\"><span style=\\"text-decoration: underline;\\">NY Times<\/span><\/a>&nbsp;<\/p>",
        "link1": "https://www.instagram.com/andrewcuomo/?hl=en",
        "link1_text": "Instagram",
        "link2": "https://x.com/andrewcuomo",
        "link2_text": "Twitter"
      }
    },
    {
      "id": 3,
      "name": "Зохран Мамдани",
      "color": "#ad3131",
      "logo": "https://palumba-storage-us.b-cdn.net/parties/logos/01K6ZJPYJX6GGHRV6SJYHPDRT3.svg",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://www.zohranfornyc.com/",
      "acronym": "M",
      "answers": [
        { "statement_id": 8, "answer": 1 },
        { "statement_id": 7, "answer": -1 },
        { "statement_id": 5, "answer": 1 }
      ],
      "positions": [
        { "topic_id": 2, "position": -50 },
        { "topic_id": 3, "position": 50 }
      ],
      "in_parliament": true,
      "unavailable_in": [],
      "profile": {
        "bio": "<p><strong>\u2139\ufe0f<\/strong> Зохран Кваме Мамдани · <strong>\ud83c\udf82<\/strong> 18 октября 1991 г. (34 года) · \ud83c\udfe0  Астория, Куинс · \ud83d\udcab  Весы<\/p>",
        "affiliation": "<p>Кандидат от Демократической партии, член Демократических социалистов Америки. Представляет Куинс в Ассамблее штата Нью-Йорк с 2021 года. Ранее работал консультантом по предотвращению потери жилья. Сосредоточен на доступности (заморозка аренд, городские продуктовые магазины, повышение зарплат), реформе общественной безопасности, бесплатном транспорте и налогообложении высоких доходов.<\/p>",
        "red_flags": "<p>\ud83d\udea9 «Должен ли Зохран Мамдани иметь право жить в квартире с регулируемой арендой?» — <a href=\\"https://gothamist.com/news/should-zohran-mamdani-get-to-live-in-a-rent-stabilized-unit-we-asked-his-neighbors\\"><span style=\\"text-decoration: underline;\\">The Gothamist<\/span><\/a> · \ud83d\udea9 «Критики называют Зохрана Мамдани антисемитом» — <a href=\\"https://www.politico.com/news/2025/06/22/critics-say-zohran-mamdani-is-antisemitic-he-says-hes-simply-holding-israel-accountable-00416388?fbclid=IwZXh0bgNhZW0CMTEAAR4VE9k49S3UqYEN8WOvXDbOBzgCpcYjbVByPAVG3Mua6d0av2dDE7lceM9AYQ_aem_m9NURtS25u5euqnlLjEI3A\\"><span style=\\"text-decoration: underline;\\">Politico<\/span><\/a><\/p>",
        "link1": "https://www.instagram.com/zohrankmamdani/?hl=en",
        "link1_text": "Instagram",
        "link2": "https://www.tiktok.com/@zohran_k_mamdani?lang=en",
        "link2_text": "TikTok"
      }
    },
    {
      "id": 5,
      "name": "Кёртис Слива",
      "color": "#e63131",
      "logo": "https://palumba-storage-us.b-cdn.net/parties/logos/01K72EZ863V3GXKK9E5YGK5AX3.svg",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://www.sliwafornyc.com/",
      "acronym": "S",
      "answers": [
        { "statement_id": 8, "answer": 0 },
        { "statement_id": 7, "answer": 1 },
        { "statement_id": 5, "answer": 0 }
      ],
      "positions": [
        { "topic_id": 2, "position": 0 },
        { "topic_id": 3, "position": 0 }
      ],
      "in_parliament": true,
      "unavailable_in": [],
      "profile": {
        "bio": "<p>Тест<\/p>",
        "affiliation": "<p>Тест<\/p>",
        "red_flags": "<p>Тест<\/p>",
        "link1": "https://palumba.org",
        "link1_text": "Тест",
        "link2": "https://palumba.org",
        "link2_text": "Тест"
      }
    }
  ]
}

'''));
        DataManager().setParties(results.parties);
        DataManager().setTopics(results.topics);
        return results;
      }
      if (LanguageManager.currentLanguage == 'zh') {
        var results = ResultsData.fromJson(json.decode('''
{
  "topics": [
    {
      "id": 2,
      "name": "传统左右政治光谱",
      "icon": "https://palumba-storage-us.b-cdn.net/01K6RB2EKYYNBY8947QDAASRYN.svg",
      "color": "#030303",
      "extreme1": "左派",
      "extreme1_emojis": "\ud83d\udc6e\ud83d\udea8\ud83d\udc6e",
      "extreme1_details": "<p>这是你最关注的问题，你希望未来的市长能对此给予充分重视<\/p>",
      "extreme2": "右派",
      "extreme2_emojis": "\ud83d\udc6e\ud83d\udea8\ud83d\udc6e",
      "extreme2_details": "<p>这是你最关注的问题，你希望未来的市长能对此给予充分重视<\/p>",
      "associated_statements": []
    },
    {
      "id": 3,
      "name": "特朗普政府",
      "icon": "https://palumba-storage-us.b-cdn.net/01K6RB6XRHT57CKWM0B7RCJDFZ.svg",
      "color": "#533B6A",
      "extreme1": "与特朗普合作 (1)",
      "extreme1_emojis": "\ud83d\udc6e\ud83d\udea8\ud83d\udc6e",
      "extreme1_details": "<p>这是你最关注的问题，你希望未来的市长能对此给予充分重视<\/p>",
      "extreme2": "抵制特朗普 (2)",
      "extreme2_emojis": "\ud83d\udc6e\ud83d\udea8\ud83d\udc6e",
      "extreme2_details": "<p>这是你最关注的问题，你希望未来的市长能对此给予充分重视<\/p>",
      "associated_statements": [8, 7, 5]
    }
  ],
  "parties": [
    {
      "id": 4,
      "name": "安德鲁·科莫",
      "color": "#172bcc",
      "logo": "https://palumba-storage-us.b-cdn.net/parties/logos/01K6ZJQS31ZSQJGDWV5ZGMXXJ9.svg",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://www.andrewcuomo.com/",
      "acronym": "C",
      "answers": [
        { "statement_id": 8, "answer": -1 },
        { "statement_id": 7, "answer": 0 },
        { "statement_id": 5, "answer": 0 }
      ],
      "positions": [
        { "topic_id": 2, "position": 50 },
        { "topic_id": 3, "position": -50 }
      ],
      "in_parliament": true,
      "unavailable_in": [],
      "profile": {
        "bio": "<p><strong>\u2139\ufe0f<\/strong> 安德鲁·科莫 · <strong>\ud83c\udf82<\/strong> 1957年12月6日（67岁） · \ud83c\udfe0  曼哈顿中城 · \ud83d\udcab  射手座<\/p>",
        "affiliation": "<p>在失去民主党提名后成为独立候选人。科莫曾任纽约州州长（2011–2021），因涉及13名女性的性骚扰指控而辞职。他的纽约市市长竞选主打经验、公共安全与住房可负担性。<\/p>",
        "red_flags": "<p>\ud83d\udea9 “美国司法部称安德鲁·科莫性骚扰13名女性” - <a href=\\"https://www.politico.com/news/2024/01/26/cuomo-sexual-harassment-doj-00138140\\"><span style=\\"text-decoration: underline;\\">Politico<\/span><\/a> · \ud83d\udea9 “纽约州长安德鲁·科莫在性骚扰丑闻中面临弹劾呼声后宣布辞职” - <a href=\\"https://www.cbsnews.com/newyork/news/cuomo-resigns-new-york-governor-sexual-harassment-scandal/\\"><span style=\\"text-decoration: underline;\\">CBS New York<\/span><\/a> · \ud83d\udea9 “科莫在有关养老院新冠死亡的辩论中遭到抨击” - <a href=\\"https://www.nytimes.com/2025/06/04/nyregion/andrew-cuomo-nursing-homes-deaths.html\\"><span style=\\"text-decoration: underline;\\">纽约时报<\/span><\/a>&nbsp;<\/p>",
        "link1": "https://www.instagram.com/andrewcuomo/?hl=en",
        "link1_text": "Instagram",
        "link2": "https://x.com/andrewcuomo",
        "link2_text": "Twitter"
      }
    },
    {
      "id": 3,
      "name": "佐赫兰·曼达尼",
      "color": "#ad3131",
      "logo": "https://palumba-storage-us.b-cdn.net/parties/logos/01K6ZJPYJX6GGHRV6SJYHPDRT3.svg",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://www.zohranfornyc.com/",
      "acronym": "M",
      "answers": [
        { "statement_id": 8, "answer": 1 },
        { "statement_id": 7, "answer": -1 },
        { "statement_id": 5, "answer": 1 }
      ],
      "positions": [
        { "topic_id": 2, "position": -50 },
        { "topic_id": 3, "position": 50 }
      ],
      "in_parliament": true,
      "unavailable_in": [],
      "profile": {
        "bio": "<p><strong>\u2139\ufe0f<\/strong> 佐赫兰·夸梅·曼达尼 · <strong>\ud83c\udf82<\/strong> 1991年10月18日（34岁） · \ud83c\udfe0  皇后区阿斯托里亚 · \ud83d\udcab  天秤座<\/p>",
        "affiliation": "<p>民主党提名人，美国民主社会主义者成员。自2021年起在纽约州议会代表皇后区。曾任住房止赎防护顾问。竞选重点包括住房可负担性（冻结房租、建立市营杂货店、提高工资）、公共安全改革、免费公共交通和对高收入征税。<\/p>",
        "red_flags": "<p>\ud83d\udea9 “佐赫兰·曼达尼是否应该住在租金管制公寓？” - <a href=\\"https://gothamist.com/news/should-zohran-mamdani-get-to-live-in-a-rent-stabilized-unit-we-asked-his-neighbors\\"><span style=\\"text-decoration: underline;\\">The Gothamist<\/span><\/a> · \ud83d\udea9 “批评者称佐赫兰·曼达尼反犹，他则表示只是要求以色列承担责任” - <a href=\\"https://www.politico.com/news/2025/06/22/critics-say-zohran-mamdani-is-antisemitic-he-says-hes-simply-holding-israel-accountable-00416388?fbclid=IwZXh0bgNhZW0CMTEAAR4VE9k49S3UqYEN8WOvXDbOBzgCpcYjbVByPAVG3Mua6d0av2dDE7lceM9AYQ_aem_m9NURtS25u5euqnlLjEI3A\\"><span style=\\"text-decoration: underline;\\">Politico<\/span><\/a><\/p>",
        "link1": "https://www.instagram.com/zohrankmamdani/?hl=en",
        "link1_text": "Instagram",
        "link2": "https://www.tiktok.com/@zohran_k_mamdani?lang=en",
        "link2_text": "TikTok"
      }
    },
    {
      "id": 5,
      "name": "柯蒂斯·斯利瓦",
      "color": "#e63131",
      "logo": "https://palumba-storage-us.b-cdn.net/parties/logos/01K72EZ863V3GXKK9E5YGK5AX3.svg",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://www.sliwafornyc.com/",
      "acronym": "S",
      "answers": [
        { "statement_id": 8, "answer": 0 },
        { "statement_id": 7, "answer": 1 },
        { "statement_id": 5, "answer": 0 }
      ],
      "positions": [
        { "topic_id": 2, "position": 0 },
        { "topic_id": 3, "position": 0 }
      ],
      "in_parliament": true,
      "unavailable_in": [],
      "profile": {
        "bio": "<p>测试<\/p>",
        "affiliation": "<p>测试<\/p>",
        "red_flags": "<p>测试<\/p>",
        "link1": "https://palumba.org",
        "link1_text": "测试",
        "link2": "https://palumba.org",
        "link2_text": "测试"
      }
    }
  ]
}

'''));
        DataManager().setParties(results.parties);
        DataManager().setTopics(results.topics);
        return results;
      }







      final url = Uri.parse('${urlLangAndEl()}' 'results');
      print("resultsUrl $url");
      final response = await http.get(
        url,
        headers: headers,
      );
      // print("Response : fetchResultsInfo ${json.decode(response.body)}");
      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var results = ResultsData.fromJson(json.decode(response.body));
      DataManager().setParties(results.parties);
      DataManager().setTopics(results.topics);
      return results;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<SponsorsData?> fetchSponsors() async {
    try {
      final url = Uri.parse('${urlLangAndEl()}' 'sponsors');
      print(url);
      final response = await http.get(
        url,
        headers: headers,
      );
      print("Response : fetchSponsors ${json.decode(response.body)}");
      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var sponsors = SponsorsData.fromJson(json.decode(response.body));
      DataManager().setSponsors(sponsors.data);
      return sponsors;
    } catch (e) {
      return null;
    }
  }

  Future<int?> fetchStatistics() async {
    try {
      final url = Uri.parse('${baseUrl()}/statistics');
      print(url);
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var data = json.decode(response.body);
      return data['responses_last_24h'];
    } catch (e) {
      return null;
    }
  }

  Future<ResponsesResponse?> postResponses() async {
    try {
      final url = Uri.parse('${baseUrl()}/responses');
      var body = UserManager.userData.toJson();
      print(url);
      print(body);

      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(body));

      if (response.statusCode < 200 || response.statusCode > 201) {
        throw Exception(response.reasonPhrase);
      }
      print(response.body);
      var responsesResponse =
          ResponsesResponse.fromJson(json.decode(response.body));
      LocalDataRepository().currentResponseData = responsesResponse.toJson();
      return responsesResponse;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("failed to load responses response");
      return null;
    }
  }

  Future<bool> patchResponses(GoingToVote goingToVote) async {
    try {
      var id = await LocalDataRepository().getCurrentResponseUuid();
      final url = Uri.parse('${baseUrl()}/responses/${id}');
      var request = ResponsesPatchRequest(goingToVote: goingToVote);
      print(url);
      print(request.toJson());
      final response = await http.patch(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(request.toJson()));

      if (response.statusCode < 200 || response.statusCode > 201) {
        throw Exception(response.reasonPhrase);
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("failed to patch going to vote question");
      return false;
    }
  }

  Future<bool> postResponsesAnswer(Answer answer) async {
    try {
      var id = await LocalDataRepository().getCurrentResponseUuid();
      final url = Uri.parse('${baseUrl()}/responses/${id}/answers');
      var request = ResponsesRequest(answers: [answer]);
      print(url);
      print(request.toJson());
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(request.toJson()));

      if (response.statusCode < 200 || response.statusCode > 201) {
        throw Exception(response.reasonPhrase);
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("failed to post answer");
      return false;
    }
  }

  Future<ElectionResponse?> getElection() async {
    try {
      final url = Uri.parse('${urlLang()}elections');
      print("ElectionUrl $url");
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });
      print("Response : getElection ${json.decode(response.body)}");
      if (response.statusCode < 200 || response.statusCode > 201) {
        throw Exception(response.reasonPhrase);
      }
      var electionsResponse =
          ElectionsResponse.fromJson(json.decode(response.body));
      var electionResponse = electionsResponse.data.firstWhere(
          (er) => er.id == ElectionManager.currentElection.value.backend);
      ElectionManager.eggInfo = electionResponse.eggScreen;
      ElectionManager.localPartyScreen = electionResponse.localPartyScreen;
      ElectionManager.electionDate = electionResponse.date;
      return electionResponse;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("failed to get election");
      return null;
    }
  }
}
