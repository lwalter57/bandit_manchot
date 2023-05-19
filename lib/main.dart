import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ArtWork());
}

class ArtWork extends StatelessWidget {
  const ArtWork({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bandit manchot',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const BanditoWork(),
    );
  }
}

class BanditoWork extends StatefulWidget {
  const BanditoWork({super.key});

  @override
  State<BanditoWork> createState() => _BanditoWork();
}

class _BanditoWork extends State<BanditoWork> {
//propperties

  late int random1;
  late int random2;
  late int random3;

  @override
  void initState() {
    random1 = 6;
    random2 = 6;
    random3 = 6;
    super.initState();
  }
//functions

  bool threeSymbolAreSame() {
    if (random1 == random2 && random1 == random3) {
      return true;
    } else {
      return false;
    }
  }

  bool isJackpot() {
    if (random1 == 6 && random2 == 6 && random3 == 6) {
      return true;
    } else {
      return false;
    }
  }

  String winnerTextEditor() {
    String result = "";
    if (threeSymbolAreSame()) {
      result = "you win !";
      if (isJackpot()) {
        result = "JACKPOOOOOOT !!! dindindindinddg";
      }
    } else {
      result = "you lose ! try again ...";
    }
    return result;
  }

  void playBandit() {
    setState(() {
      random1 = randomNumberGenerator();
      random2 = randomNumberGenerator();
      random3 = randomNumberGenerator();
    });
  }

  int randomNumberGenerator() {
    Random random = Random();
    int randomNumber = random.nextInt(7);
    return randomNumber;
  }

  Image randomizeImage(int randomJet) {
    switch (randomJet) {
      case 0:
        return Image.asset(
          'assets/images/bar.png',
          height: 150,
        );
      case 1:
        return Image.asset(
          'assets/images/cerise.png',
          height: 150,
        );
      case 2:
        return Image.asset(
          'assets/images/cloche.png',
          height: 150,
        );
      case 3:
        return Image.asset(
          'assets/images/diamant.png',
          height: 150,
        );
      case 4:
        return Image.asset(
          'assets/images/fer-a-cheval.png',
          height: 150,
        );
      case 5:
        return Image.asset(
          'assets/images/pasteque.png',
          height: 150,
        );
      case 6:
        return Image.asset(
          'assets/images/sept.png',
          height: 150,
        );
      default:
        return Image.asset(
          'assets/images/sept.png',
          height: 150,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'El Bandito',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        color: isJackpot() ? Colors.yellow : Colors.red,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                randomizeImage(random1),
                randomizeImage(random2),
                randomizeImage(random3),
              ],
            ),
            Text(
              winnerTextEditor(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => playBandit(),
        child: const Icon(Icons.handshake),
      ),
    );
  }
}
