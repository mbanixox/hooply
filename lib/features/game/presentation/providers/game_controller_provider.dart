import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/features/game/presentation/controllers/game_controller.dart';

final gameControllerProvider = NotifierProvider<GameController, void>(
  GameController.new,
);
