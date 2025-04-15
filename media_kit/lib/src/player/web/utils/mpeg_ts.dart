/// This file is a part of media_kit (https://github.com/media-kit/media-kit).
///
/// Copyright © 2021 & onwards, WanJiMi.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart' as web;
import 'package:synchronized/synchronized.dart';

// --------------------------------------------------

extension type MpegTs._(JSObject _) implements JSObject {
  external FeatureList getFeatureList();

  external Player createPlayer(MediaDataSource source);
  //
  // static Future<void> ensureInitialized({String? url}) {
  //   return _lock.synchronized(() async {
  //     if (_initialized) {
  //       return;
  //     }
  //     final completer = Completer();
  //     try {
  //       final script = web.HTMLScriptElement()
  //         ..async = true
  //         ..charset = 'utf-8'
  //         ..type = 'text/javascript'
  //         ..src = url ?? kMpegTsCDN;
  //
  //       script.onLoad.listen((_) {
  //         if (!completer.isCompleted) {
  //           completer.complete();
  //         }
  //       });
  //       script.onError.listen((_) {
  //         if (!completer.isCompleted) {
  //           completer.completeError(Exception('Failed to load mpegts.js@'));
  //         }
  //       });
  //
  //       web.HTMLHeadElement? head = web.document.head;
  //       if (head == null) {
  //         head = web.HTMLHeadElement();
  //         web.document.append(head);
  //       }
  //       head.append(script);
  //     } catch (_) {
  //       if (!completer.isCompleted) {
  //         completer.completeError(Exception('Failed to load HLS.js'));
  //       }
  //     }
  //     try {
  //       await completer.future;
  //       _initialized = true;
  //     } catch (exception, stacktrace) {
  //       print(exception.toString());
  //       print(stacktrace.toString());
  //     }
  //   });
  // }

  // static const String kMpegTsAsset =
  //     'assets/packages/media_kit/assets/web/hls1.4.10.js';
  // static const String kMpegTsCDN =
  //     'https://cdn.jsdelivr.net/npm/mpegts.js@latest';
  //
  // static final Lock _lock = Lock();
  // static bool _initialized = false;

// external Player createPlayer(PlayerConfig config);
}

extension type FeatureList._(JSObject _) implements JSObject {
  external bool get mseLivePlayback;
}

// External JavaScript namespace for mpegts
@JS('mpegts')
external MpegTs get mpegts;

@JS('testPlayer')
external Player get getTestPlayer;

extension type Player._(JSObject _) implements JSObject {
  external void attachMediaElement(web.HTMLVideoElement element);

  external void load();

  external void play();
}

extension type MediaDataSource._(JSObject _) implements JSObject {
  external MediaDataSource({
    required String type,
    required bool isLive,
    required String url,
    bool enableStashBuffer = false,
  });
}
