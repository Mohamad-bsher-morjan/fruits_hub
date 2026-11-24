import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/theme/app_theme.dart';
import 'package:fruits_hub/core/theme/theme_provider.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/menu_item_widget_list_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    await Prefs.init();
  });

  AppPalette? capturedPalette;

  Widget paletteProbe() => Builder(
        builder: (context) {
          capturedPalette = context.palette;
          return const SizedBox.shrink();
        },
      );

  testWidgets('the palette follows the active theme', (tester) async {
    await tester.pumpWidget(Theme(data: AppTheme.lightTheme, child: paletteProbe()));
    expect(capturedPalette!.card, AppPalette.light.card);

    await tester.pumpWidget(Theme(data: AppTheme.darkTheme, child: paletteProbe()));
    expect(capturedPalette!.card, AppPalette.dark.card);
  });

  testWidgets('theme menu offers system, light and dark modes', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const Scaffold(body: MenuItemsWidgetListView()),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.brightness_4));
    await tester.pumpAndSettle();

    expect(find.text('حسب النظام'), findsOneWidget);
    expect(find.text('فاتح'), findsOneWidget);
    expect(find.text('داكن'), findsOneWidget);

    await tester.tap(find.text('داكن'));
    await tester.pumpAndSettle();

    final provider = tester.element(find.byType(MenuItemsWidgetListView))
        .read<ThemeProvider>();
    expect(provider.themeMode, ThemeMode.dark);
  });
}
