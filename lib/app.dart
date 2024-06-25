import 'package:e_mart/bindings/general_bindings.dart';
import 'package:e_mart/routes/app_route.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoute.pages,
      home: 
      const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(
              child: CircularProgressIndicator(
            color: TColors.white,
          ))),
    );
  }
}


// class DeveloperCard extends StatelessWidget {
//   const DeveloperCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Developer Card'),
//       ),
//       body: const Center(
//         child: DeveloperCardContent(),
//       ),
//     );
//   }
// }

// class DeveloperCardContent extends StatelessWidget {
//   const DeveloperCardContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/images/avatar.png'),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'John Doe',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//            const  SizedBox(height: 8),
//             Text(
//               'Flutter Developer',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 color: Colors.grey[600],
//               ),
//             ),
//             SizedBox(height: 16),
//             SizedBox(
//               width: 100,
//               child: ElevatedButton(
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Contacting John Doe...')),
//                   );
//                 },
//                 child: Text('Contact'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

