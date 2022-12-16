import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'languages/en_us.dart';
import 'languages/pt_br.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'pt_BR': ptBR,
      };
}
