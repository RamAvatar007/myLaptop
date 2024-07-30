import 'package:flutter/material.dart';
import 'package:new_quickly_desige/screens/auth_screens/splash_screen/splash_screen.dart';
import 'package:new_quickly_desige/screens/screen/address_screen/manage_address/select_address_provider/select_address_provider.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/home_screen/home_provider/home_provider.dart';
import 'package:new_quickly_desige/screens/screen/all_product/product_details_screen/product_details_provider/product_details_provider.dart';
import 'package:new_quickly_desige/screens/screen/notification_screen/notification_provider/notification_provider.dart';
import 'package:provider/provider.dart';
import 'helper/storage_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/auth_screens/otp_screen/otp_provider/otp_provider.dart';
import 'screens/auth_screens/sign_in_password_screen/sign_in_pass_provider/login_provider.dart';
import 'screens/auth_screens/sign_in_screen/view_model/sign_in_provider.dart';
import 'screens/auth_screens/sign_up_screen/sign_up_provider/sign_up_provider.dart';
import 'screens/screen/all_product/all_category_screen/category_list_provider/category_list_provider.dart';
import 'screens/screen/all_product/cart_provider/cart_provider.dart';
import 'screens/screen/all_product/vendor_list_screen/vendor_list_provider/vendor_list_provider.dart';
import 'screens/screen/profile_screen/profile_provider/profile_provider.dart';
import 'screens/screen/setting_screen/setting_provider/setting_provider.dart';

late Size mq;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeFirebase();

  await StorageHelper().init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SignUpProvider()),
    ChangeNotifierProvider(create: (_) => MailSendOtpProvider()),
    ChangeNotifierProvider(create: (_) => OtpProvider()),
    ChangeNotifierProvider(create: (_) => LoginWithPasswordProvider()),
    ChangeNotifierProvider(create: (_) => CategoryListProvider()),
    ChangeNotifierProvider(create: (_) => VendorListProvider()),
    ChangeNotifierProvider(create: (_) => ProductDetailsProvider()),
    ChangeNotifierProvider(create: (_) => SelectAddressProvider()),
    ChangeNotifierProvider(create: (_) => SelectAddressProvider()),
    ChangeNotifierProvider(create: (_) => SettingProvider()),
    ChangeNotifierProvider(create: (_) => DashBoardProvider()),
    ChangeNotifierProvider(create: (_) => ProfileProvider()),
    ChangeNotifierProvider(create: (_) => SelectAddressProvider()),
    ChangeNotifierProvider(create: (_) => NotificationProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ], child: const MyApp()));
}

GlobalKey<NavigatorState> navKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialApp(
      key: navKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
