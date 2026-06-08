import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  // ── ColorScheme ──

  static const ColorScheme _colorScheme = ColorScheme.dark(
    primary: AppColors.primary,
    onPrimary: AppColors.primaryForeground,
    primaryContainer: AppColors.primary25,
    onPrimaryContainer: AppColors.primary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.secondaryForeground,
    secondaryContainer: AppColors.secondary,
    onSecondaryContainer: AppColors.secondaryForeground,
    tertiary: AppColors.primary,
    onTertiary: AppColors.primaryForeground,
    error: AppColors.destructive,
    onError: AppColors.destructiveForeground,
    errorContainer: Color(0x33FF5C5C),
    onErrorContainer: AppColors.destructive,
    surface: AppColors.card,
    onSurface: AppColors.foreground,
    surfaceContainerHighest: AppColors.muted,
    onSurfaceVariant: AppColors.mutedForeground,
    outline: AppColors.border,
    outlineVariant: AppColors.border50,
    scrim: AppColors.background,
    shadow: Colors.transparent,
  );

  // ── Public Theme ──

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: _colorScheme,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: AppTextStyles.textTheme,
        fontFamily: AppTextStyles.fontFamily,

        // ── AppBar ──
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.foreground,
          elevation: 0,
          scrolledUnderElevation: 1,
          centerTitle: false,
          titleSpacing: AppSpacing.screenHorizontal,
          titleTextStyle: AppTextStyles.headline,
        ),

        // ── Card ──
        cardTheme: CardThemeData(
          color: AppColors.card,
          elevation: 0,
          shape: AppRadius.xxlBorder,
          margin: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontal,
            vertical: AppSpacing.space2,
          ),
        ),

        // ── BottomNavigationBar ──
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.card95,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.mutedForeground,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedLabelStyle: AppTextStyles.navLabel,
          unselectedLabelStyle: AppTextStyles.navLabel,
          selectedIconTheme: IconThemeData(size: 23),
          unselectedIconTheme: IconThemeData(size: 23),
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        ),

        // ── FloatingActionButton ──
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.primaryForeground,
          elevation: 8,
          focusElevation: 8,
          hoverElevation: 12,
          highlightElevation: 4,
          shape: const CircleBorder(),
          extendedSizeConstraints: const BoxConstraints.tightFor(
            width: 80,
            height: 80,
          ),
        ),

        // ── Input Decoration ──
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.muted,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space4,
            vertical: AppSpacing.space3,
          ),
          border: OutlineInputBorder(
            borderRadius: AppRadius.mdAll,
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppRadius.mdAll,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppRadius.mdAll,
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: AppRadius.mdAll,
            borderSide: const BorderSide(
              color: AppColors.destructive,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: AppRadius.mdAll,
            borderSide: const BorderSide(
              color: AppColors.destructive,
              width: 1.5,
            ),
          ),
          hintStyle: const TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.mutedForeground,
            height: 1.7,
          ),
          labelStyle: const TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.mutedForeground,
            height: 1.7,
          ),
          helperStyle: const TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.mutedForeground,
            height: 1.5,
          ),
          errorStyle: const TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.destructive,
            height: 1.5,
          ),
        ),

        // ── Switch ──
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.foreground;
            }
            return AppColors.foreground;
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return AppColors.withAlpha(AppColors.mutedForeground, 0.25);
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return AppColors.withAlpha(AppColors.mutedForeground, 0.25);
          }),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),

        // ── Dialog ──
        dialogTheme: DialogThemeData(
          backgroundColor: AppColors.card,
          surfaceTintColor: Colors.transparent,
          shape: AppRadius.xxlBorder,
          titleTextStyle: AppTextStyles.title.copyWith(
            color: AppColors.foreground,
          ),
        ),

        // ── SnackBar ──
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.card,
          contentTextStyle: AppTextStyles.body.copyWith(
            color: AppColors.foreground,
          ),
          shape: AppRadius.mdBorder,
          behavior: SnackBarBehavior.floating,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontal,
            vertical: AppSpacing.space4,
          ),
        ),

        // ── ElevatedButton (secondary) ──
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.muted,
            foregroundColor: AppColors.foreground,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space6,
              vertical: AppSpacing.space4,
            ),
            shape: AppRadius.xlBorder,
            textStyle: AppTextStyles.bodyLarge,
          ),
        ),

        // ── FilledButton (primary CTA) ──
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.primaryForeground,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space6,
              vertical: AppSpacing.space4,
            ),
            shape: AppRadius.xlBorder,
            textStyle: AppTextStyles.bodyLarge,
          ),
        ),

        // ── OutlinedButton ──
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary25),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space6,
              vertical: AppSpacing.space4,
            ),
            shape: AppRadius.xlBorder,
            textStyle: AppTextStyles.bodyLarge,
          ),
        ),

        // ── TextButton ──
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space4,
              vertical: AppSpacing.space2,
            ),
            shape: AppRadius.mdBorder,
            textStyle: AppTextStyles.bodyLarge,
          ),
        ),

        // ── Divider ──
        dividerTheme: const DividerThemeData(
          color: AppColors.border45,
          thickness: 1,
          space: 0,
          indent: AppSpacing.space5,
          endIndent: AppSpacing.space5,
        ),

        // ── Icon ──
        iconTheme: const IconThemeData(
          color: AppColors.mutedForeground,
          size: 20,
        ),

        // ── ListTile ──
        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space5,
          ),
          shape: AppRadius.lgBorder,
          titleTextStyle: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.foreground,
          ),
          subtitleTextStyle: AppTextStyles.body.copyWith(
            color: AppColors.mutedForeground,
          ),
          iconColor: AppColors.mutedForeground,
        ),

        // ── TabBar ──
        tabBarTheme: TabBarThemeData(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.mutedForeground,
          labelStyle: AppTextStyles.caption,
          unselectedLabelStyle: AppTextStyles.caption,
          dividerColor: AppColors.border45,
          indicator: UnderlineTabIndicator(
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),

        // ── Chip ──
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.muted,
          labelStyle: AppTextStyles.caption.copyWith(
            color: AppColors.foreground,
          ),
          secondaryLabelStyle: AppTextStyles.caption.copyWith(
            color: AppColors.primary,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space3,
            vertical: AppSpacing.space1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.smAll,
          ),
          side: BorderSide.none,
        ),

        // ── BottomSheet ──
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColors.card,
          surfaceTintColor: Colors.transparent,
          shape: AppRadius.sheetShape,
          modalElevation: 0,
          dragHandleColor: AppColors.border50,
          dragHandleSize: const Size(36, 4),
        ),

        // ── ProgressIndicator ──
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primary,
          linearTrackColor: AppColors.white20,
          linearMinHeight: 8,
          circularTrackColor: AppColors.white20,
        ),

        // ── Tooltip ──
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: AppColors.foreground,
            borderRadius: AppRadius.smAll,
          ),
          textStyle: AppTextStyles.micro.copyWith(
            color: AppColors.background,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space3,
            vertical: AppSpacing.space2,
          ),
        ),

        // ── Scrollbar ──
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(AppColors.border50),
          thickness: WidgetStateProperty.all(4),
          radius: const Radius.circular(AppRadius.full),
          trackVisibility: WidgetStateProperty.all(false),
        ),
      );

  // ── Helpers ──

  /// Returns a copy of the theme with optional overrides.
  static ThemeData darkWith({
    Color? scaffoldBackgroundColor,
    ColorScheme? colorScheme,
    TextTheme? textTheme,
  }) {
    return dark.copyWith(
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: colorScheme,
      textTheme: textTheme,
    );
  }
}
