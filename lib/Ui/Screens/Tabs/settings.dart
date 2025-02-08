import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';
import 'package:islamy_app/Ui/utils/applocalization.dart';
import 'package:islamy_app/providers/language_provider.dart';
import 'package:islamy_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              appLocalizations(context).languageKey,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 30),
            buildDropDown(),
            const SizedBox(height: 70),
            Row(
              children: [
                Text(
                  appLocalizations(context).themeKey,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                buildSwitchButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropDown() {
    return DropdownButton<String>(
      isExpanded: true,
      value: context.watch<LanguageProvider>().selectedLanguage,
      items: [
        DropdownMenuItem<String>(
          value: "ar",
          child: Text(
            "العربية",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        DropdownMenuItem<String>(
          value: "en",
          child: Text(
            "English",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
      onChanged: (newvalue) {
        if (newvalue != null) {
          context.read<LanguageProvider>().setSelectedLanguage(newvalue); 
        }
      },
    );
  }

Widget buildSwitchButton() {
  return Switch(
    activeColor: AppColors.primaryLightMode,
    inactiveThumbColor: AppColors.primaryLightMode,
    value: themeProvider.myAppTheme == ThemeMode.dark,
    onChanged: (newvalue) {
      themeProvider.setAppTheme(newvalue ? ThemeMode.dark : ThemeMode.light);
    },
  );
}

}
