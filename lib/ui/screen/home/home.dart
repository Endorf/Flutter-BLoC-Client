import 'package:bloc_app/domain/router/event.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/ui/screen/base_screen.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key}) : super(title: Strings.homeTitle);

  @override
  Widget buildChildren(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Home screen",
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: () => context.read<RouterBloc>().add(CreationEvent()),
          child: const Text('Create'),
        ),
      ],
    );
  }
}




// extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return RootContentScreen(
//       title: Strings.homeTitle,
//       child: Column(
//         children: [
//           const Center(
//             child: Text(
//               "Home screen",
//               textAlign: TextAlign.center,
//             ),
//           ),
//           TextButton(
//             onPressed: () => context.read<RouterBloc>().add(CreationEvent()),
//             child: const Text('Create'),
//           ),
//         ],
//       ),
//     );


    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text(Strings.homeTitle),
    //   ),
    //   body: AppContainer(
    //     child: 
    // Column(
    //       children: [
    //         const Center(
    //           child: Text(
    //             "Home screen",
    //             textAlign: TextAlign.center,
    //           ),
    //         ),
    //         TextButton(
    //           onPressed: () => context.read<RouterBloc>().add(CreationEvent()),
    //           child: const Text('Create'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
//   }
// }
