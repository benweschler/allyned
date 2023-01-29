import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

//TODO: implement cross platform
Future<T?> showOptionPopup<T>(
    BuildContext context, Widget Function(BuildContext) builder) {
  if (kIsWeb) {
    throw UnimplementedError();
    // return showDialog<T>(context: context, builder: (_) => AlertDialog(content: content));
  } else {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: builder,
    );
  }
}
