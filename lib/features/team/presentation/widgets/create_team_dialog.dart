import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/features/team/data/team_repository.dart';
import 'package:hooply/features/team/presentation/providers/team_provider.dart';

class CreateTeamDialog extends ConsumerStatefulWidget {
  const CreateTeamDialog({super.key});

  @override
  ConsumerState<CreateTeamDialog> createState() => _CreateTeamDialogState();
}

class _CreateTeamDialogState extends ConsumerState<CreateTeamDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _createTeam() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final teamName = _nameController.text.trim();
      await ref.read(teamRepositoryProvider).createTeam(teamName);

      // Refresh the team list
      ref.invalidate(teamsWithPlayerCountProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Team '$teamName' created successfully!")),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error creating team: $e")));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create New Team", style: TextStyle(fontSize: 21.0)),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: "Team Name",
                  prefixIcon: Icon(Icons.sports_basketball),
                ),
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter a team name";
                  }
                  return null;
                },
                onFieldSubmitted: (_) => _createTeam(),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _createTeam,
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text("Create"),
        ),
      ],
    );
  }
}
