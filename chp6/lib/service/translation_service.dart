import 'package:get/route_manager.dart';

class TranslationService extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "en_TA": {
      "home_screen": "தயாரிப்பு திரை",
      "product_screen": "Tayārippu tirai",
    },

    "en_US": {"home_screen": "Home Screen", "product_screen": "Product Screen"},
  };
}
