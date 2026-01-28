# Nix CLI (system-wide)

NIX_BIN="/nix/store/j6k7vmkpcm26d6m78nfpcrswxlfgdn9q-nix-2.33.1/bin"

if [ -d "$NIX_BIN" ]; then
    case ":$PATH:" in
        *":$NIX_BIN:"*) ;;
        *) export PATH="$NIX_BIN:$PATH" ;;
    esac
fi
