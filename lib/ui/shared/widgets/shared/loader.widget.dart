import 'package:flutter/widgets.dart';

import 'progress_indicator.widget.dart';

class Loader extends StatelessWidget {
  final object;
  final Function callback;

  const Loader({super.key, required this.object, required this.callback});

  @override
  Widget build(BuildContext context) {
    if (object == null) {
      return Center(
        child: GenericProgressIndicator(),
      );
    }

    if (object.length == 0) {
      return Center(
        child: Text("Nenhum item encontrado"),
      );
    }

    return callback();
  }
}