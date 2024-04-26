import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nevmusic/Localization/app_localizations.dart';
import 'Utils/locale_cubit.dart';
import 'Utils/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.translate('settings') ?? ''),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.translate('themeMode') ?? '',
              style: TextStyle(fontSize: 20.0),
            ),
            trailing: BlocBuilder<ThemeModeCubit, bool>(
              builder: (context, isDarkMode) {
                return Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    context.read<ThemeModeCubit>().toggleTheme();
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20.0),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.translate('selectedLanguage') ?? '',
              style: TextStyle(fontSize: 20.0),
            ),
            trailing: TextButton(
              onPressed: () {
                if (AppLocalizations.of(context)!.isEnLocale) {
                  BlocProvider.of<LocaleCubit>(context).toTR();
                } else {
                  BlocProvider.of<LocaleCubit>(context).toEng();
                }
              },
              child: Text(
                AppLocalizations.of(context)?.translate('currentLanguage') ??
                    '',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue, // Customize the color as desired
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
