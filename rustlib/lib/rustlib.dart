@JS()
library rustlib;

import "package:js/js.dart";
import "dart:typed_data";

@JS("do_stuff")
external String doStuff(Uint8List things);
