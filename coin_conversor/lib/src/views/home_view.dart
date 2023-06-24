import 'package:coin_conversor/src/components/currency_box.dart';
import 'package:flutter/material.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 100, 30, 20),
        child: Column(
          children: [
            Image.asset('assets/icon.png', width: 150),

            const SizedBox(height: 60),

            const CurrencyBox(),

            const SizedBox(height: 10),

            const CurrencyBox(),

            const SizedBox(height: 50),

            FilledButton(onPressed: () {},
                child: const Text("Converter")
            ),
          ],
        ),
      ),
    );
  }
}
