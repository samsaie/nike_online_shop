import 'package:flutter/material.dart';
import 'package:nike_online_shop/data/auth_info.dart';
import 'package:nike_online_shop/data/reo/auth_repositiry.dart';
import 'package:nike_online_shop/ui/auth/auth.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("سبد خرید"),
      ),
      body: ValueListenableBuilder<AuthInfo?>(
        valueListenable: AuthRepository.authChangeNotifier,
        builder: (context, authState, child) {
          bool isAuthenticated =
              authState != null && authState.accessToken.isNotEmpty;
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(isAuthenticated
                    ? 'خوش آمدید'
                    : 'لطفا وارد حساب کاربری خود شوید'),
                isAuthenticated
                    ? ElevatedButton(
                        onPressed: () {
                          authRepository.signOut();
                        },
                        child: const Text('خروج از حساب'))
                    : ElevatedButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => const AuthScreen()));
                        },
                        child: const Text('ورود')),
                ElevatedButton(
                    onPressed: () async {
                      await authRepository.refreshToken();
                    },
                    child: const Text('Refresh Token')),
              ],
            ),
          );
        },
      ),
    );
  }
}
