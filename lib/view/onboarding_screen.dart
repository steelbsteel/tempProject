import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0,120,0,0),
          child: Column(
            children: [
                Column(
                    children: [
                      Text("Model Hub", 
                      style: TextStyle(
                        fontFamily: 'Iceland', 
                        fontSize: 80,
                        color: Color.fromARGB(255, 83, 58, 113)
                        )
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Color.fromARGB(255, 83, 58, 113),
                              width: 3
                            )
                          ),
                          child: Text("Продолжить"),
                          onPressed: () => {
                            Navigator.pushNamed(context, '/paywall')
                            }
                          ),
                      )
                    ],
                  )
                ],
              ),          
          )
        )
    );
  }
}