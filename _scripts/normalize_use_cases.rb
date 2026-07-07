#!/usr/bin/env ruby
# Copies ../27.08 Use-cases/*.md into _use-cases/ with normalized frontmatter.
# Source of truth remains ../27.08 Use-cases. Re-run to sync.
require 'yaml'

ROOT = File.expand_path('..', __dir__)
SRC = File.expand_path('use-cases', ROOT)  # symlink -> ../27.08 Use-cases
DST = File.expand_path('_use-cases', ROOT)

CAT_EMOJI = {
  /ai\s*&\s*automation/i     => ["\u{1F916} AI & Automation", "ai-automation"],
  /defi\s*&\s*trading/i      => ["\u{1F4B0} DeFi & Trading", "defi-trading"],
  /social\s*&\s*community/i  => ["\u{1F465} Social & Community", "social-community"],
  /infrastructure\s*&\s*tools/i => ["\u{1F527} Infrastructure & Tools", "infrastructure-tools"],
  /commerce\s*&\s*payments/i => ["\u{1F6D2} Commerce & Payments", "commerce-payments"],
  /gaming\s*&\s*entertainment/i => ["\u{1F3AE} Gaming & Entertainment", "gaming-entertainment"],
  /creator\s*economy/i       => ["\u{1F3A8} Creator Economy", "creator-economy"],
  /psychology\s*&\s*emotion/i => ["\u{1F9E0} Psychology & Emotion", "psychology-emotion"],
}

STATUS_MAP = {
  /research/i                     => "\u{1F50D} research",
  /ideation/i                     => "\u{1F4AD} ideation",
  /\u2705|\u2714|\u2611|shipped|live|done/i => "\u2705 shipped",
}

Dir.mkdir(DST) unless Dir.exist?(DST)
count = 0
Dir.glob("*.md", base: SRC).sort.each do |f|
  src_path = File.join(SRC, f)
  # slug filename: lowercase, hyphenated, no spaces; keep .md extension
  base = f.sub(/\.md$/i, '')
  slug = base.downcase.gsub(/\s+/, '-').gsub(/[^a-z0-9\-]/, '').gsub(/-+/, '-')
  dst_path = File.join(DST, "#{slug}.md")

  raw = File.read(src_path)
  match = raw.match(/\A---\n(.*?)\n---\n?(.*)\z/m)
  unless match
    warn "skipping #{f}: no frontmatter"
    next
  end
  fm = YAML.safe_load(match[1], permitted_classes: [Symbol])
  body = match[2]

  # Normalize category
  cat_raw = (fm['category'] || 'Unknown').to_s
  cat_key = CAT_EMOJI.find { |re, _| cat_raw.match?(re) }
  if cat_key
    fm['category'] = cat_key[1][0]
    fm['category_slug'] = cat_key[1][1]
  else
    fm['category'] = cat_raw
    fm['category_slug'] = cat_raw.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/^-|-$/, '')
  end

  # Normalize status
  st_raw = (fm['status'] || '').to_s
  st_key = STATUS_MAP.find { |re, _| st_raw.match?(re) }
  fm['status'] = st_key ? st_key[1] : (st_raw.empty? ? "\u{1F50D} research" : st_raw)

  # Normalize protocol-version
  pv = (fm['protocol-version'] || 'v0').to_s.strip.downcase
  pv = "v#{pv}" unless pv.start_with?('v')
  fm['protocol-version'] = pv

  # Ensure name + summary
  fm['name'] ||= File.basename(f, '.md')
  fm['summary'] ||= ''
  fm['tributary_models'] = Array(fm['tributary_models'])

  output = "---\n#{fm.to_yaml.lines.drop(1).join}---\n\n#{body}"
  File.write(dst_path, output)
  count += 1
end
puts "normalized #{count} use-cases into _use-cases/"
