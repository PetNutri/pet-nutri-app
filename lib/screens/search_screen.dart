import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../services/pet_food_api.dart';
import '../theme/app_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  List<PetFoodProduct>? _results;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  Future<void> _search() async {
    final query = _controller.text.trim();
    if (query.isEmpty) return;

    setState(() => _loading = true);
    try {
      final results = await PetFoodApi.search(query);
      setState(() {
        _results = results;
        _loading = false;
      });
    } catch (_) {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      ClipRRect(borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/images/logo.png', width: 32, height: 32)),
                      const SizedBox(width: 8),
                      Text(AppLocalizations.of(context).appTitle, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                    ]),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: GlassCard(
                        padding: const EdgeInsets.all(10),
                        borderRadius: 14,
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.textSecondary,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.glassBorder),
                        ),
                        child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          style: GoogleFonts.inter(
                            color: AppColors.textPrimary,
                            fontSize: 15,
                          ),
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context).searchFoodTitle,
                            hintStyle: GoogleFonts.inter(
                              color: AppColors.textMuted,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            suffixIcon: _controller.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.close_rounded, color: AppColors.textMuted, size: 18),
                                  onPressed: () { _controller.clear(); setState(() => _results = null); })
                              : IconButton(
                              icon: const Icon(
                                Icons.search_rounded,
                                color: AppColors.primary,
                              ),
                              onPressed: _search,
                            ),
                          ),
                          onSubmitted: (_) => _search(),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),

            const SizedBox(height: 16),

            if (_loading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              )
            else if (_results == null)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.pets_rounded,
                        size: 64,
                        color: AppColors.textMuted,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context).typeFoodName,
                        style: GoogleFonts.inter(
                          color: AppColors.textMuted,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else if (_results!.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).noResults,
                    style: GoogleFonts.inter(
                      color: AppColors.textMuted,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _results!.length,
                  itemBuilder: (context, index) {
                    final p = _results![index];
                    return _ProductTile(product: p)
                        .animate()
                        .fadeIn(
                          delay: Duration(milliseconds: index * 60),
                          duration: 300.ms,
                        );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  final PetFoodProduct product;
  const _ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GlassCard(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: product.imageUrl != null
                  ? Image.network(
                      product.imageUrl!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _placeholder(),
                    )
                  : _placeholder(),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    product.brand,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                  if (product.ingredients != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      product.ingredients!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: AppColors.textMuted,
                        height: 1.3,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.pets_rounded, color: AppColors.textMuted, size: 22),
    );
  }
}
