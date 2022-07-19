enum ScreenType {
  desktop._(minWidth: 900),
  tablet._(minWidth: 600, maxWidth: 900),
  handset._(minWidth: 300, maxWidth: 600);

  const ScreenType._({
    this.minWidth,
    this.maxWidth,
  });

  factory ScreenType.fromSize(double deviceWidth) {
    if (deviceWidth > ScreenType.tablet.maxWidth!) return ScreenType.desktop;
    if (deviceWidth > ScreenType.handset.minWidth!) return ScreenType.tablet;

    return ScreenType.handset;
  }

  final int? minWidth;
  final int? maxWidth;
}
