// ignore_for_file: use_build_context_synchronously, duplicate_ignore
import 'package:catalogue_app/pages/authentication/repo/repo.dart';
import 'package:catalogue_app/velocityx/auth_state.dart';
import 'package:catalogue_app/velocityx/vx_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/exceptions.dart';
import '../../utils/alert_dialogs.dart';
import '../../utils/routes.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {



    VxState.watch(context, on: [ChangeAuthState,ResetAuthState]);
    final onChanged = (VxState.store as MyVxStore).authState.onChanged??false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/login_catlog.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const Text(
              'Hello User',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
              textScaleFactor: 3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: MediaQuery.of(context).size.height * .35,
              width: MediaQuery.of(context).size.width * .90,
              child: Column(
                children: [
                  TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(CupertinoIcons.at_circle),
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fillColor: Colors.grey,
                      filled: true,
                      label: const Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  TextField(
                    controller: _password,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(CupertinoIcons.lock_circle),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fillColor: Colors.grey,
                      filled: true,
                      label: const Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.forgetPassword, (route) => false);
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(onChanged ? 150 : 10),
                    color: onChanged
                        ? Colors.lightBlueAccent.shade200
                        : Colors.grey.shade200,
                    child: InkWell(
                      onTap: () async {
                        ChangeAuthState(true);
                        await Future.delayed(const Duration(milliseconds: 500));
                        final email = _email.text.trim();
                        final password = _password.text;
                        final firebaseUser = FirebaseUser();
                        // ignore: duplicate_ignore, duplicate_ignore
                        try {
                          await firebaseUser.logInUser(
                              email: email, password: password);
                          final user = FirebaseAuth.instance.currentUser;
                          if (user != null && user.emailVerified) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                Routes.mainUi, (route) => false);
                          } else {
                            user?.sendEmailVerification();
                            showEmailVerificationDialog(context,
                                'Email verification link is sent to your email address');
                          }
                          ChangeAuthState(false);
                        } on UserNotFoundAuthException catch (_) {
                          showErrorDialog(context, 'User Not Found.');
                        } on WrongPasswordAuthException catch (_) {
                          showErrorDialog(context, 'Wrong Password.');
                        } on InvalidEmailAuthException catch (_) {
                          showErrorDialog(context, 'Invalid Email');
                        } on GenericAuthException catch (_) {
                          showErrorDialog(context, 'Authentication Error.');
                        }
                        ChangeAuthState(false);
                      },
                      child: AnimatedContainer(
                        // alignment: Alignment.center,
                        width: onChanged
                            ? MediaQuery.of(context).size.width * 0.12
                            : MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.14,
                        duration: const Duration(milliseconds: 500),
                        child: onChanged
                            ? const Icon(
                                Icons.done,
                                color: Colors.black,
                                size: 50,
                              )
                            : const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textScaleFactor: 3,
                                ),
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                const Text(
                  'Not Registered?Sign-up here->',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.blueGrey),
                  textScaleFactor: 1,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.signUp, (route) => false);
                    },
                    child: const Text(
                      'Sign-up!',
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                      textScaleFactor: 1.5,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
