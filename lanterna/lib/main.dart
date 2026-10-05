import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lanterna Inteligente',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050505),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
        ),
      ),
      home: const LanternaScreen(),
    );
  }
}

class AppCores {
  static const branco = Colors.white;
  static const fundo = Color(0xFF050505);
  static const painel = Color(0xFF111111);
  static const painelClaro = Color(0xFF1C1C1C);
  static const cinza = Color(0xFF777777);
}

class LanternaScreen extends StatefulWidget {
  const LanternaScreen({super.key});

  @override
  State<LanternaScreen> createState() => _LanternaScreenState();
}

class _LanternaScreenState extends State<LanternaScreen> {
  bool _ligada = false;
  bool _modoAutomatico = false;

  void _alternarLanterna() {
    setState(() {
      _ligada = !_ligada;
    });
  }

  void _alternarModoAutomatico(bool valor) {
    setState(() {
      _modoAutomatico = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCores.fundo,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 22, 24, 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LANTERNA',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 4,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'SMART LIGHT',
                        style: TextStyle(
                          color: AppCores.cinza,
                          fontSize: 10,
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),

                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: _ligada
                          ? Colors.white
                          : AppCores.painelClaro,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: _ligada
                                ? Colors.black
                                : AppCores.cinza,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          _ligada ? 'ON' : 'OFF',
                          style: TextStyle(
                            color: _ligada
                                ? Colors.black
                                : Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: AppCores.painel,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.06),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: _modoAutomatico
                            ? Colors.white
                            : AppCores.painelClaro,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.auto_awesome,
                        size: 20,
                        color: _modoAutomatico
                            ? Colors.black
                            : AppCores.cinza,
                      ),
                    ),

                    const SizedBox(width: 13),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Modo automático',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Controle inteligente',
                            style: TextStyle(
                              color: AppCores.cinza,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Switch(
                      value: _modoAutomatico,
                      activeColor: Colors.white,
                      activeTrackColor: Colors.white24,
                      onChanged: _alternarModoAutomatico,
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: _alternarLanterna,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOut,
                          width: _ligada ? 270 : 220,
                          height: _ligada ? 270 : 220,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _ligada
                                ? Colors.white.withOpacity(0.04)
                                : Colors.transparent,
                            border: Border.all(
                              color: _ligada
                                  ? Colors.white.withOpacity(0.25)
                                  : Colors.white.withOpacity(0.08),
                              width: 1,
                            ),
                            boxShadow: _ligada
                                ? [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.12),
                                      blurRadius: 70,
                                      spreadRadius: 20,
                                    ),
                                  ]
                                : [],
                          ),
                          child: Center(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 450),
                              width: _ligada ? 165 : 125,
                              height: _ligada ? 165 : 125,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _ligada
                                    ? Colors.white
                                    : AppCores.painelClaro,
                                boxShadow: _ligada
                                    ? [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.4),
                                          blurRadius: 35,
                                          spreadRadius: 8,
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Icon(
                                _ligada
                                    ? Icons.flashlight_on
                                    : Icons.flashlight_off,
                                size: _ligada ? 75 : 55,
                                color: _ligada
                                    ? Colors.black
                                    : AppCores.cinza,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            _ligada
                                ? 'ILUMINAÇÃO ATIVA'
                                : 'TOQUE PARA LIGAR',
                            key: ValueKey(_ligada),
                            style: TextStyle(
                              color: _ligada
                                  ? Colors.white
                                  : AppCores.cinza,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                  color: _ligada
                      ? Colors.white
                      : AppCores.painelClaro,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: _ligada
                        ? Colors.white
                        : Colors.white.withOpacity(0.08),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _ligada
                          ? Icons.power_settings_new
                          : Icons.flashlight_on,
                      color: _ligada ? Colors.black : Colors.white,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _ligada ? 'DESLIGAR' : 'LIGAR LANTERNA',
                      style: TextStyle(
                        color: _ligada ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'LANterna inteligente • 01',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.25),
                  fontSize: 9,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}