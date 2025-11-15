import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/core/constants/app_constants.dart';
import 'package:hooply/features/player/data/player_repository.dart';
import 'package:hooply/features/player/presentation/providers/player_provider.dart';

class AddPlayerDialog extends ConsumerStatefulWidget {
  final int teamId;

  const AddPlayerDialog({super.key, required this.teamId});

  @override
  ConsumerState<AddPlayerDialog> createState() => _AddPlayerDialogState();
}

class _AddPlayerDialogState extends ConsumerState<AddPlayerDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _jerseyController = TextEditingController();
  String _selectedPosition = AppConstants.positions[0];
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _jerseyController.dispose();
    super.dispose();
  }

  Future<void> _addPlayer() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final name = _nameController.text.trim();
      final jerseyNumber = int.parse(_jerseyController.text.trim());

      // Check if jersey number is taken
      final isTaken = await ref
          .read(playerRepositoryProvider)
          .isJerseyNumberTaken(widget.teamId, jerseyNumber);

      if (isTaken && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Jersey #$jerseyNumber is already taken'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() => _isLoading = false);
        return;
      }

      await ref
          .read(playerRepositoryProvider)
          .createPlayer(
            teamId: widget.teamId,
            name: name,
            jerseyNumber: jerseyNumber,
            position: _selectedPosition,
          );

      // Refresh players list
      ref.invalidate(teamPlayersProvider(widget.teamId));

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$name added successfully!')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error adding player: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Player'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Player Name',
                  hintText: 'e.g., LeBron James',
                  prefixIcon: Icon(Icons.person),
                ),
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter player name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Jersey Number Field
              TextFormField(
                controller: _jerseyController,
                decoration: const InputDecoration(
                  labelText: 'Jersey Number',
                  hintText: 'e.g., 23',
                  prefixIcon: Icon(Icons.numbers),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter jersey number';
                  }
                  final number = int.tryParse(value);
                  if (number == null || number < 0 || number > 99) {
                    return 'Enter a number between 0-99';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Position Dropdown
              DropdownButtonFormField<String>(
                initialValue: _selectedPosition,
                decoration: const InputDecoration(
                  labelText: 'Position',
                  prefixIcon: Icon(Icons.sports_basketball),
                ),
                items: AppConstants.positions.map((position) {
                  return DropdownMenuItem(
                    value: position,
                    child: Text(
                      '$position - ${AppConstants.positionNames[position]}',
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedPosition = value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _addPlayer,
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Add'),
        ),
      ],
    );
  }
}
