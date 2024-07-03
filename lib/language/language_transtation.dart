import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'language_classes/BnLanguage.dart';
import 'language_classes/EnLanguage.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'bn_BD': BnLanguage().bnLanguage,
        'en_US': EnLanguage().enLanguage,
      };
}
