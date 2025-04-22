import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/theme/app_theme.dart';
import '../bloc/theme/theme_cubit.dart';
import 'scan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String logoPath = 'assets/images/support_logo.png';
    final String logoPath2 = 'assets/images/support_logo.jpg';
    final themeCubit = context.read<ThemeCubit>();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Attendance Support',
          style: TextStyle(
              color: themeCubit.isDarkMode
                  ? AppTheme.primaryWhite
                  : AppTheme.primaryBlack,
              fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor,
        iconTheme: theme.appBarTheme.iconTheme?.copyWith(
          color: theme.appBarTheme.iconTheme?.color != null
              ? themeCubit.isDarkMode
                  ? AppTheme.primaryWhite
                  : AppTheme.primaryBlack
              : null,
          size: 30,
        ),
      ),
      drawer: Drawer(
        backgroundColor: theme.drawerTheme.backgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: theme.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(logoPath2),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      'Attendance App',
                      style: TextStyle(
                        color: themeCubit.isDarkMode
                            ? AppTheme.primaryWhite
                            : AppTheme.primaryBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: theme.iconTheme.color),
              title: Text('Settings',
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            BlocBuilder<ThemeCubit, ThemeData>(
              builder: (context, state) {
                return SwitchListTile(
                  title: Text('Dark Mode',
                      style:
                          TextStyle(color: theme.textTheme.bodyLarge?.color)),
                  value: context.read<ThemeCubit>().isDarkMode,
                  onChanged: (bool value) {
                    themeCubit.toggleTheme();
                  },
                  secondary: Icon(
                    context.read<ThemeCubit>().isDarkMode
                        ? Icons.brightness_2
                        : Icons.brightness_7,
                    color: theme.iconTheme.color,
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline, color: theme.iconTheme.color),
              title: Text('About',
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            Center(
              child: Image.asset(
                logoPath,
                height: 180,
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                'Welcome!',
                style: theme.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Effortlessly manage attendance for your student activities.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 20,
                    color: theme.textTheme.bodyLarge?.color?.withOpacity(0.7)),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              icon: Icon(
                Icons.qr_code_scanner,
                color: AppTheme.primaryBlack,
                size: 32,
              ),
              label: Text(
                'Scan Attendance',
                style: TextStyle(color: AppTheme.primaryWhite, fontSize: 22),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: theme.primaryColor,
                foregroundColor: theme.colorScheme.onPrimary,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ScanScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              icon: Icon(
                Icons.history,
                color: theme.primaryColor,
                size: 32,
              ),
              label: Text(
                'View Attendance History',
                style: TextStyle(color: theme.primaryColor, fontSize: 22),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(color: theme.primaryColor),
                foregroundColor: theme.primaryColor,
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
