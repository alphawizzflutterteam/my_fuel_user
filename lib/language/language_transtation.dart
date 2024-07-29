import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:test_prj/language/language_classes/hindi.dart';
import 'package:test_prj/language/language_classes/kannada.dart';
import 'package:test_prj/language/language_classes/malayalam.dart';
import 'package:test_prj/language/language_classes/telugu.dart';

import 'language_classes/BnLanguage.dart';
import 'language_classes/EnLanguage.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    ...Telugu().keys,
    ...Malayalam().keys,
    ...Hindi().keys,
    ...Bangla().keys,
    ...Kannada().keys,
    ...English().keys,
      };
}
