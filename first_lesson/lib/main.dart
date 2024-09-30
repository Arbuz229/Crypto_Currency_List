import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        dividerColor: Colors.white38,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 24, 24, 24),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500
          )
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 24, 24, 24),
        useMaterial3: true,
        textTheme:  TextTheme(
          bodyMedium: const TextStyle(color:Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          ),
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 20,
            fontWeight: FontWeight.w500
          )
        )
      ),
      routes: {
        '/': (context) => CryptoListScreen(),
        '/coin': (context) => CryptoCoinScreen(),
      },
      //home: const CryptoListScreen(title: 'CryptoCurrenciesList'),
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('CryptoCurrenciesList'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(color: Theme.of(context).dividerColor,),
        itemBuilder: (context, i) {
        const coinName = "Ethereum";
        return ListTile(
        leading: SvgPicture.asset("assets/svg/ethereum_logo.svg", width: 42, height: 42,),
          title: Text( 
            coinName,
            style: Theme.of(context).textTheme.bodyMedium,
        ), 
        subtitle: Text(
          '2600\$', 
          style: Theme.of(context).textTheme.labelSmall,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),  
        onTap: (){
          Navigator.of(context).pushNamed(
            '/coin', 
            arguments: coinName,
          );
        },    
        );
        } 
        ) 
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}


class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
 
  String? coinName; 

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, );
    // if (args == null){
    //   print('You must provide args');
    //   return;
    // }
    // if (args is! String){
    //   print("You must provide String args");
    //   return;
    // }
    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...'), centerTitle: true,)
    );
  }}