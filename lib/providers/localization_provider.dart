import 'package:kan_ik_een_korte_broek_aan/providers/locale_provider.dart';
import 'package:kan_ik_een_korte_broek_aan/services/localization_service.dart';

class LocalizationProvider {

  static LocalizationService _localizationService;

  static Future<void> init() async {
    _localizationService = await LocalizationService.load(LocaleProvider.getLocale());
    return;
  }

  static LocalizationService get localizationService => _localizationService;
}