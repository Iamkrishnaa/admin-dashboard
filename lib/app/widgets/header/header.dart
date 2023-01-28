import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

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
            child: Responsive.size(context).width >= 330
                ? TextFormField(
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).drawerTheme.backgroundColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      hintText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                  )
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
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(100),
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
                      if (Responsive.isDesktop(context))
                        const SizedBox(
                          width: 12.0,
                        ),
                      if (!Responsive.isMobile(context))
                        Text(
                          "Krishna Adhikari",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
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
              const SizedBox(
                width: 16.0,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.apps,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
