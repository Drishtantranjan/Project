import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

OverlayManager useOverlayManager() {
  final overlayState = Overlay.of(useContext())!;
  final overlayManager = useMemoized(() => OverlayManager(overlayState), []);
  return overlayManager;
}

class OverlayManager {
  static final List<OverlayEntry> _overlayEntries = List.empty(growable: true);
  final OverlayState overlayState;

  const OverlayManager(this.overlayState);

  void show(OverlayEntry overlayEntry) {
    _overlayEntries.add(overlayEntry);
    overlayState.insert(overlayEntry);
  }

  void hide(OverlayEntry overlayEntry) {
    try {
      overlayEntry.remove();
      // ignore: empty_catches
    } catch (ignored) {}
    _overlayEntries.remove(overlayEntry);
  }

  static void clear() {
    for (var entry in _overlayEntries) {
      entry.remove();
    }
    _overlayEntries.clear();
  }
}
