import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart'; // Assuming gap package is used for spacing

class ResponsiveDialog extends StatelessWidget {
  final Widget body;
  final String title;
  final bool isFullScreen;
  final Function? onOpen;
  final Function? onClose;

  const ResponsiveDialog({
    super.key,
    required this.body,
    required this.title,
    this.isFullScreen = false,
    this.onOpen,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        ScreenUtil().screenHeight; // Screen height using ScreenUtil
    final screenWidth =
        ScreenUtil().screenWidth; // Screen width using ScreenUtil

    return GestureDetector(
      // Close the dialog when tapping outside
      onTap: () {
        if (onClose != null) {
          onClose!();
        }
        Navigator.of(context).pop();
      },
      child: Dialog(
        insetPadding:
            const EdgeInsets.symmetric(horizontal: 8), // Horizontal margin of 8
        child: GestureDetector(
          onTap:
              () {}, // Prevent taps inside the dialog from closing the dialog
          child: Container(
            width: isFullScreen
                ? screenWidth
                : null, // Fullscreen width if required
            height: isFullScreen
                ? screenHeight
                : null, // Fullscreen height if required
            padding: const EdgeInsets.all(16), // Padding for the entire dialog
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Section
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(title),
                ),
                const Divider(),
                Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowIndicator();
                      return false;
                    },
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: screenHeight *
                              0.7, // 70% of screen height for scrollable content
                        ),
                        child: body,
                      ),
                    ),
                  ),
                ),
                // Bottom Actions or any other content
                const Gap(10), // Using Gap for spacing (from gap package)
                ElevatedButton(
                  onPressed: () {
                    if (onClose != null) {
                      onClose!();
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
