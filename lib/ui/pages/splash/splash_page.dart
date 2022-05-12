import 'package:flutter/material.dart';

import '../../mixins/mixins.dart';
import 'splash_presenter.dart';

class SplashPage extends StatelessWidget with NavigationManager {
  final SplashPresenter presenter;
  
  const SplashPage({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    presenter.checkAccount();
    return Scaffold(
      body: Builder(
        builder: (context) {
          handleNavigation(presenter.navigateToStream);
          
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(''),
                const CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/alphapay.png')
                ),
                Column(
                  children: [
                    const Text(
                      'from',
                      style:TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0, bottom: 8.0),
                      child: Text(
                        'Alphapay',
                        style:TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
      )
    );
  }
}