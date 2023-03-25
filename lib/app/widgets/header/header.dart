import 'package:admin_dashboard/app/constants/constants.dart';
import 'package:admin_dashboard/app/services/local/language_service.dart';
import 'package:admin_dashboard/app/utils/languages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../services/local/theme_service.dart';
import '../../utils/responsive.dart';
import '../textfields/custom_rounded_textfield.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.1),
          ),
        ),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                  ),
                );
              },
            ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            flex: 1,
            child: Responsive.size(context).width >= 350
                ? const CustomRoundedTextField()
                : const SizedBox(),
          ),
          if (!Responsive.isMobile(context))
            Spacer(
              flex: Responsive.isDesktop(context) ? 2 : 1,
            ),
          const SizedBox(
            width: 12.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildLanguagePicker(),
              const SizedBox(
                width: 16.0,
              ),
              _buildNotificationSection(context),
              const SizedBox(
                width: 16.0,
              ),
              _buildCurrentUserSection(context),
            ],
          ),
        ],
      ),
    );
  }

  _buildLanguagePicker() {
    return PopupMenuButton(
      tooltip: "",
      onSelected: null,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      position: PopupMenuPosition.under,
      itemBuilder: (context) {
        return List.generate(
          Languages().languages.length,
          (index) {
            MapEntry<String, String> lang =
                Languages().languages.entries.elementAt(index);
            return PopupMenuItem(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      lang.value,
                    ),
                  ),
                  Text(
                    lang.key,
                  ),
                ],
              ),
              onTap: () {
                LanguageService.changeLocale(
                  languageCode: lang.key,
                );
              },
            );
          },
        );
      },
      child: const Icon(Icons.language),
    );
  }

  _buildNotificationSection(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: Colors.transparent,
        child: PopupMenuButton(
          tooltip: "",
          onSelected: null,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          position: PopupMenuPosition.under,
          itemBuilder: (context) {
            return <PopupMenuEntry<dynamic>>[
              PopupMenuItem(
                enabled: false,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Notifications",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.darkCardColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 12.0,
                      ),
                      child: Text(
                        "5 New",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Profile Logged in from new ip address"),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(
                          child: Icon(
                            Icons.access_time_rounded,
                            size: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Expanded(
                          child: Text(
                            timeago.format(
                              DateTime.now().subtract(
                                const Duration(minutes: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  minLeadingWidth: 10,
                  leading: const CircleAvatar(
                    maxRadius: 15,
                    child: Icon(
                      Icons.person,
                      size: 15,
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Payment Reminder from bank"),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(
                          child: Icon(
                            Icons.access_time_rounded,
                            size: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Expanded(
                          child: Text(
                            timeago.format(
                              DateTime.now().subtract(
                                const Duration(minutes: 100),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  minLeadingWidth: 10,
                  leading: const CircleAvatar(
                    maxRadius: 15,
                    child: Icon(
                      Icons.person,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ];
          },
          child: const Icon(
            Icons.notifications,
          ),
        ),
      ),
    );
  }

  _buildCurrentUserSection(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: Colors.transparent,
        child: PopupMenuButton(
          tooltip: "",
          onSelected: null,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          position: PopupMenuPosition.under,
          itemBuilder: (context) {
            return <PopupMenuEntry<dynamic>>[
              const PopupMenuItem(
                enabled: false,
                child: Text("Welcome Krishna!"),
              ),
              const PopupMenuItem(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("View yout profile"),
                  leading: Icon(Icons.person),
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.dark_mode,
                  ),
                  title: const Text(
                    "Theme",
                  ),
                  trailing: StatefulBuilder(builder: (context, setInnerState) {
                    return Switch(
                      onChanged: (value) {
                        setInnerState(() {
                          ThemeService.changeTheme(
                            value ? ThemeCategory.dark : ThemeCategory.light,
                          );
                        });
                      },
                      value: ThemeService.selectedTheme == ThemeCategory.dark,
                    );
                  }),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Logout"),
                  leading: Icon(Icons.logout),
                ),
              ),
            ];
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/61038161?v=4",
                  ),
                ),
                // if (Responsive.isDesktop(context))
                const SizedBox(
                  width: 12.0,
                ),
                if (!Responsive.isMobile(context))
                  Text(
                    "Krishna Adhikari",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                if (!Responsive.isMobile(context))
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
