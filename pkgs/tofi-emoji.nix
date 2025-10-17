{
  lib,
  writeShellApplication,
  tofi,
  wl-clipboard,
  wtype,
  gawk,
  coreutils,
  gnused,
  curl,
  fetchurl,
}:

let
  emojiTest = fetchurl {
    url = "https://unicode.org/Public/emoji/15.1/emoji-test.txt";
    sha256 = "sha256-2HbuJJqijqp2z6bfqnAoR6jROwYqpIjUZdA5XugTftk=";
  };

  cacheHelper = writeShellApplication {
    name = "tofi-emoji-cache";
    runtimeInputs = [
      curl
      gawk
      coreutils
    ];
    text = builtins.readFile ../scripts/build-emoji-cache;
    meta.mainProgram = "tofi-emoji-cache";
  };

in
writeShellApplication {
  name = "tofi-emoji";
  runtimeInputs = [
    tofi
    wl-clipboard
    wtype
    gnused
    coreutils
  ];
  text = ''
    export TOFI_EMOJI_CACHE_HELPER=${cacheHelper}/bin/tofi-emoji-cache
    export TOFI_EMOJI_UNICODE_FILE=${emojiTest}
    ${builtins.readFile ../scripts/tofi-emoji}
  '';
  meta = with lib; {
    description = "Minimal emoji picker using tofi; types emoji directly or copies to clipboard";
    homepage = "https://github.com/yourname/tofi-emoji";
    license = licenses.mit;
    platforms = platforms.linux;
    mainProgram = "tofi-emoji";
  };
}
