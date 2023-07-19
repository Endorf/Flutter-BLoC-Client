import 'package:bloc_app/domain/creation/creation_bloc.dart';
import 'package:bloc_app/domain/creation/event.dart';
import 'package:bloc_app/domain/creation/state.dart';
import 'package:bloc_app/domain/router/event.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:bloc_app/ui/widget/app_container.dart';
import 'package:bloc_app/ui/widget/button.dart';
import 'package:bloc_app/ui/widget/dropdown.dart';
import 'package:bloc_app/ui/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreationScreen extends StatefulWidget {
  const CreationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CreationScreenState();
}

class _CreationScreenState extends State<CreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleInputController = TextEditingController();
  final _detailsInputController = TextEditingController();

  final List<String> dropDownTags = ["General", "Quote", 'Metaphor'];
  String tag = "General";

  final double _progreeIndicatorHeight = 3;
  final double _elevationButtonPadding = 12;
  final double _textFormPadding = 8;

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
        body: RootContentContainer(child: _buildChildren(context)));
  }

  Widget _buildChildren(BuildContext context) {
    return BlocConsumer<CreationBloc, CreationState>(
      listener: (context, state) {
        if (state.isSuccessfullySubmited) {
          context.read<RouterBloc>().add(HomeEvent());
        } else if (state.hasError) {
          final String message = state.message != null
              ? state.message!
              : Strings.defaultErrorMessage;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
            primary: false,
            scrollDirection: Axis.vertical,
            child: _buildForm(context, state));
      },
    );
  }

  Widget _buildForm(BuildContext context, CreationState state) {
    return Column(children: [
      SizedBox(
        height: _progreeIndicatorHeight,
        child: Visibility(
          visible: state.isLoading,
          child: const LinearProgressIndicator(),
        ),
      ),
      Form(
        key: _formKey,
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: double.infinity,
            child: Card(
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: [
                  DefaultDropdownButton(
                    list: dropDownTags,
                    selectedValue: tag,
                    onChanged: (value) {
                      setState(() {
                        if (value != null && value.isEmpty) {
                          tag = value;
                        }
                      });
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.all(_textFormPadding),
                      child: DefaultTextFormField(
                        labelText: Strings.titleNoteLabel,
                        controller: _titleInputController,
                      )),
                  Padding(
                      padding: EdgeInsets.all(_textFormPadding),
                      child: DefaultTextFormField(
                        labelText: Strings.detailsNoteLabel,
                        controller: _detailsInputController,
                      )),
                  Padding(
                    padding: EdgeInsets.all(_elevationButtonPadding),
                    child: DefaultElevationButton(
                      labelText: Strings.submitNoteLabel,
                      onPressed: () => {
                        if (_formKey.currentState!.validate())
                          context.read<CreationBloc>().add(SubmitEvent(
                              tag,
                              _titleInputController.text,
                              _detailsInputController.text))
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
