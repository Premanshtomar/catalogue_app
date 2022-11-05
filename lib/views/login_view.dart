import 'package:catalogue_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool onChanged = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        onChanged = true;
      });
      await Future.delayed(const Duration(milliseconds: 280));
      // ignore: use_build_context_synchronously
      await Navigator.of(context).pushNamed(Routes.mainUi);
      setState(() {
        onChanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Image(
                image: AssetImage('assets/images/loginC.png'),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 25),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username can not be empty';
                            }
                            return null;
                          },
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade300,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: const Text(
                              'Username',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password can not be empty';
                            } else if (value.length < 6) {
                              return 'Password length should not be less than 6';
                            }
                            return null;
                          },
                          enableSuggestions: false,
                          obscureText: true,
                          autocorrect: false,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: const Text(
                              'Password',
                              style: TextStyle(color: Colors.black),
                            ),
                            fillColor: Colors.grey.shade300,
                            filled: true,
                          ),
                        ),
                        const SizedBox(height: 25),
                        // ElevatedButton(onPressed: (){
                        //   Navigator.of(context).pushNamed(Routes.mainUi);
                        // },
                        //   // style: TextButton.styleFrom(maximumSize: const Size.fromHeight(10)),
                        //   style: TextButton.styleFrom(
                        //     backgroundColor: Colors.black,
                        //     minimumSize: Size(MediaQuery.of(context).size.width*0.4, MediaQuery.of(context).size.width*0.11),
                        //     textStyle: const TextStyle(
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold)
                        //   ),
                        // //   ButtonStyle(
                        // //       foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                        // //       backgroundColor: MaterialStateColor.resolveWith((states) => Colors.black)
                        // // ),
                        //   child: const Text('Login!'),
                        // ),
                        Material(
                          color: Colors.deepPurpleAccent,
                          borderRadius:
                              BorderRadius.circular(onChanged ? 150 : 10),
                          child: InkWell(
                            onTap: () async => moveToHome(),
                            child: AnimatedContainer(
                              alignment: Alignment.center,
                              width: onChanged
                                  ? 50
                                  : MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.width * 0.11,
                              duration: const Duration(milliseconds:250 ),
                              child: onChanged
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
