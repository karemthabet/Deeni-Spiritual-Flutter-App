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


  @override
  Widget build(BuildContext context) {

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
    return Selector<LanguageProvider, String>(
      selector: (context, languageProvider) => languageProvider.selectedLanguage,
      builder: (context, selectedLanguage, child) {
        return DropdownButton<String>(
          isExpanded: true,
          value: selectedLanguage,
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
          onChanged: (newValue) {
            if (newValue != null) {
              Provider.of<LanguageProvider>(context,listen: false).setSelectedLanguage(newValue);
            }
          },
        );
      },
    );
  }

  Widget buildSwitchButton() {
  return Selector<ThemeProvider, ThemeMode>(
    selector: (context, themeProvider) => themeProvider.myAppTheme,
    builder: (context, myAppTheme, child) {
      return Switch(
        activeColor: AppColors.primaryLightMode,
        inactiveThumbColor: AppColors.primaryLightMode,
        value: myAppTheme == ThemeMode.dark, 
        onChanged: (newValue) {
          Provider.of<ThemeProvider>(context,listen: false).setAppTheme(newValue ? ThemeMode.dark : ThemeMode.light);
        },
      );
    },
  );
}
}