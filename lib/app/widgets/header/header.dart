import 'package:flutter/material.dart';

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
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                ),
              ),
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
