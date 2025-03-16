import 'package:flutter/material.dart';

void showCustomPopup({
  required BuildContext context,
  required Widget content,
  required bool isFullScreen,
  VoidCallback? onOpen,
  VoidCallback? onClose,
}) {
  if (onOpen != null) {
    onOpen();
  }

  if (isFullScreen) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog.fullscreen(
          backgroundColor: Colors.white,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: content,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onClose != null) {
                      onClose();
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  } else {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 10,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: content,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();

                    if (onClose != null) {
                      onClose();
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
