import 'package:multistore/exports.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = AuthController();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Account Screen'),
            ElevatedButton(
                onPressed: () {
                  _authController.logOut();
                  print('button pressed');
                },
                child: Text('Log out'))
          ],
        ),
      ),
    );
  }
}
