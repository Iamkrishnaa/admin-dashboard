import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.isActive = false,
  });
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Function()? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: isActive
            ? LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                  Theme.of(context).scaffoldBackgroundColor,
                ],
              )
            : null,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(100.0),
          bottomRight: Radius.circular(100.0),
        ),
      ),
      margin: const EdgeInsets.only(
        right: 24.0,
        bottom: 8.0,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(100.0),
          bottomRight: Radius.circular(100.0),
        ),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ??
                  const SizedBox(
                    width: 24.0,
                  ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    title ?? const SizedBox.shrink(),
                    if (subtitle != null)
                      const SizedBox(
                        height: 4.0,
                      ),
                    subtitle ?? const SizedBox.shrink(),
                  ],
                ),
              ),
              trailing ??
                  const SizedBox(
                    width: 24.0,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
