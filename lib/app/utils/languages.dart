import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:admin_dashboard/app/constants/i18n/i18n.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': EnglishTranslation.getEnglishTranslation,
        'ne': NepaliTranslation.getNepaliTranslation,
      };

  Map<String, String> get countries => {
        'en': "English",
        'ne': "नेपाली",
      };
}
