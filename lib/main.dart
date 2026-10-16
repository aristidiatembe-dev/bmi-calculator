import 'package:flutter/material.dart';

void main() {
  runApp(const ImcApp());
}

class ImcApp extends StatelessWidget {
  const ImcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IMC',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body:SingleChildScrollView(
        padding: const EdgeInsets.all(24),


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite,
                size: 70,
                color: Colors.blue.shade700,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Calculadora de IMC',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Descubra o seu índice de massa corporal.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 52,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ImcPage(),
                    ),
                  );
                },

                icon: const Icon(Icons.arrow_forward),

                label: const Text(
                  'Começar',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}



class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {

  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  double imc = 0.0;

  void calcularImc() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text);

    setState(() {
      imc = peso / (altura * altura);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Calculadora de IMC',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      // CORREÇÃO: permite rolar quando o conteúdo
      // não cabe no espaço disponível.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              'Vamos calcular!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Introduza os seus dados abaixo.',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,

              decoration: InputDecoration(
                labelText: 'Peso',
                hintText: 'Ex: 60',
                suffixText: 'kg',

                prefixIcon: const Icon(
                  Icons.monitor_weight,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,

              decoration: InputDecoration(
                labelText: 'Altura',
                hintText: 'Ex: 1.70',
                suffixText: 'm',

                prefixIcon: const Icon(
                  Icons.height,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,

              child: ElevatedButton.icon(
                onPressed: calcularImc,

                icon: const Icon(
                  Icons.calculate,
                ),

                label: const Text(
                  'Calcular IMC',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),

            const SizedBox(height: 30),

            if (imc > 0)
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [

                    const Icon(
                      Icons.analytics,
                      size: 40,
                      color: Colors.blue,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Seu IMC',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      imc.toStringAsFixed(1),

                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}