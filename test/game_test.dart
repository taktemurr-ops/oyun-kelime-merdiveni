import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_merdiveni/oyun_kelime_merdiveni.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(merdivenConfig.title.length, 33);
    expect(merdivenConfig.tagline.length, 33);
    for (final s in merdivenConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(merdivenConfig.gameId, merdivenId);
    expect(merdivenRules.gameId, merdivenId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(merdivenRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: merdivenId, optionalMechanics: merdivenRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      merdivenRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(merdivenRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
