import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/ui/views/views.dart';
import 'package:vertical_landing_page/ui/shared/shared.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildBoxDecoration(),
        child: Stack(
          children: const [
      
            _HomeBody(),
      
            Positioned(
              right: 20,
              top: 20,
              child: CustomAppMenu()
            )
                      
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.5, 0.5],
      colors: [
        Colors.pink,
        Colors.purpleAccent
      ]
    )
  );

}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final pageController = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageController.scrollController,
      scrollDirection: Axis.vertical,
      children: const [

        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView()

      ],
    );
  }
}