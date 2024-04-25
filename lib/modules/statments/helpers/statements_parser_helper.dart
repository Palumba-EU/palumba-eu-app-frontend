import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/statements_data.dart';

class StatementsParser {
  /*
  String? context;
  static String? getDefinitionText(String? htmlContent) {
    dom.Document document = htmlParser.parse(htmlContent);
    String? definition;
    List<dom.Element> pElements = document.getElementsByTagName('p');
    for (int i = 0; i < pElements.length; i++) {
      if (pElements[i].text == 'Definition') {
        definition = pElements[i].outerHtml + pElements[i + 1].outerHtml;
        break;
      }
    }
    return definition;
  }

  static String? getContextText(String htmlContent) {
    dom.Document document = htmlParser.parse(htmlContent);
    String? context;
    List<dom.Element> pElements = document.getElementsByTagName('p');
    for (int i = 0; i < pElements.length; i++) {
      if (pElements[i].text == 'Context') {
        context = pElements[i].outerHtml + pElements[i + 1].outerHtml;
        break;
      }
    }
    return context;
  }
  */

  static List<CardModel> getCardModelList(List<Statement> statements) {
    List<CardModel> cards = [];
    for (Statement statement in statements) {
      cards.add(CardModel(
        id: statement.id,
        emojis: statement.emojis ?? '',
        mainQuestion: statement.statement ?? '<p>No data</p>',
        details: statement.details ?? '<p>No definition</p>',
      ));
    }
    return cards;
  }
}
