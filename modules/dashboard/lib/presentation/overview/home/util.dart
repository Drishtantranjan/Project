double computeSizeWithDimension(
    {required double size,
    required double padding,
    required double initialSize}) {
  if (size > initialSize + padding * 2 + 60) {
    return initialSize;
  } else {
    return size - padding * 2;
  }
}
