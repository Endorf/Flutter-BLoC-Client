import 'package:bloc_app/domain/creation/creation_bloc.dart';
import 'package:bloc_app/domain/creation/event.dart';
import 'package:bloc_app/domain/creation/state.dart';
import 'package:bloc_app/domain/router/event.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/ui/screen/creation/widget/creation_form.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:bloc_app/ui/widget/app_container.dart';
import 'package:bloc_app/ui/widget/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreationScreen extends StatelessWidget {
  const CreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            Strings.creationTitle,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: RootContentContainer(
            child: BlocConsumer<CreationBloc, CreationState>(
          listener: _onBlocEventListener,
          builder: _widgetBuilder,
        )));
  }

  _onBlocEventListener(BuildContext context, CreationState state) {
    if (state.isSuccessfullySubmited) {
      context.read<RouterBloc>().add(HomeEvent());
    } else if (state.hasError) {
      final String message =
          state.message != null ? state.message! : Strings.defaultErrorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  Widget _widgetBuilder(BuildContext context, CreationState state) {
    return SingleChildScrollView(
        primary: false,
        scrollDirection: Axis.vertical,
        child: Column(children: [
          LinearProgressBar(isLoading: state.isLoading),
          CreationForm(onSubmitForm: _onSubmitForm)
        ]));
  }

  _onSubmitForm(
    BuildContext context,
    String tag,
    String title,
    String details,
  ) {
    context.read<CreationBloc>().add(SubmitEvent(tag, title, details));
  }
}
