import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_landing_page/ui/shared/shared.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin {

  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 200)
    );    
  }

  @override
  Widget build(BuildContext context) {

    final pageController = Provider.of<PageProvider>(context, listen: false);
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: (){
          if(isOpen){
            controller.reverse();
          } else {
            controller.forward();
          }

          setState(() => isOpen = !isOpen);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 310 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),

              if(isOpen)
                ... [
                  CustomAppItem(text: 'Home', onPressed: ()=> pageController.goTo(0) ),
                  CustomAppItem(delay: 30, text: 'About', onPressed: ()=> pageController.goTo(1) ),
                  CustomAppItem(delay: 60, text: 'Pricing', onPressed: ()=> pageController.goTo(2) ),
                  CustomAppItem(delay: 90, text: 'Contact', onPressed: ()=> pageController.goTo(3) ),
                  CustomAppItem(delay: 120, text: 'Location', onPressed: ()=> pageController.goTo(4) ),
                  const SizedBox(height: 10)
                ]
            ],
          )
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  
  final bool isOpen;
  final AnimationController controller;

  const _MenuTitle({
    required this.isOpen,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
    
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
    
          Text('Menú', style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
          const Spacer(),
    
          AnimatedIcon(
            icon: AnimatedIcons.menu_close, 
            progress: controller,
            color: Colors.white,
          )
    
        ],
      ),
    );
  }
}