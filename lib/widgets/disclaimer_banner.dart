import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../main.dart';

/// Banner upozorenja da app nije zamena za veterinara
class DisclaimerBanner extends StatelessWidget {
  const DisclaimerBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = localeProvider.locale.languageCode;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.warning.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.warning.withOpacity(0.25)),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('⚕️', style: TextStyle(fontSize: 18)),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            lang == 'en'
                ? 'This app is for informational purposes only and is not a substitute for professional veterinary advice. Always consult your vet.'
                : 'Ova aplikacija je iskljucivo informativnog karaktera i nije zamena za profesionalni veterinarski savet. Uvek se konsultujte sa veterinarom.',
            style: GoogleFonts.inter(fontSize: 11, color: AppColors.warning, height: 1.4),
          ),
        ),
      ]),
    );
  }
}
