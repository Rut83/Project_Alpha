#!/bin/sh

# This script installs the Nix package manager on your system by
# downloading a binary distribution and running its installer script
# (which in turn creates and populates /nix).

{ # Prevent execution if this script was only partially downloaded
oops() {
    echo "$0:" "$@" >&2
    exit 1
}

umask 0022

tmpDir="$(mktemp -d -t nix-binary-tarball-unpack.XXXXXXXXXX || \
          oops "Can't create temporary directory for downloading the Nix binary tarball")"
cleanup() {
    rm -rf "$tmpDir"
}
trap cleanup EXIT INT QUIT TERM

require_util() {
    command -v "$1" > /dev/null 2>&1 ||
        oops "you do not have '$1' installed, which I need to $2"
}

case "$(uname -s).$(uname -m)" in
    Linux.x86_64)
        hash=4cc8606dcf5c315b40197a394456a6dedbb47a3403030b632371470c34c8735d
        path=k75kp7xzcchnhxyjiaiwb9a31730j6n9/nix-2.33.1-x86_64-linux.tar.xz
        system=x86_64-linux
        ;;
    Linux.i?86)
        hash=bfcf891f3279f044f80b77d4cbb06b3dc51034d6bd42fc3dee725a395eb80933
        path=am6kp84h2yjryhpg876q25jlsg7m1bw6/nix-2.33.1-i686-linux.tar.xz
        system=i686-linux
        ;;
    Linux.aarch64)
        hash=5460374490661ba7ef57b24b159a18ddc74cc6872bf73805db6d8e46e53f743d
        path=jxz2qksff5bx69q85mr9n1qlxap64r90/nix-2.33.1-aarch64-linux.tar.xz
        system=aarch64-linux
        ;;
    Linux.armv6l)
        hash=888ecbf62c34aa0a80727d5b3797b69e6b4b682092e7a389e04e74a169447599
        path=30xckvhxmh6y53mjhvb8gslkw34qpbkr/nix-2.33.1-armv6l-linux.tar.xz
        system=armv6l-linux
        ;;
    Linux.armv7l)
        hash=db6e942f894cef413df30e276852c9bb695f856ea4fd82da033cfd80cc474f73
        path=zk3qhv3ddbwvk3chqmc8l3gi6z004igy/nix-2.33.1-armv7l-linux.tar.xz
        system=armv7l-linux
        ;;
    Linux.riscv64)
        hash=a6b974357183e3ca28842131120ebcc3a45de3d74cc210df4a786c1b4bab5ab1
        path=p07bg7z4kx9bzp1929pv151xn04310p6/nix-2.33.1-riscv64-linux.tar.xz
        system=riscv64-linux
        ;;
    Darwin.x86_64)
        hash=567e682afe50d08ad1e45d5b97aa4fe69d272f23ef22c012a005163f8c335c05
        path=n6hhg41gr8aphcg2iiad6jal4lf1xv8z/nix-2.33.1-x86_64-darwin.tar.xz
        system=x86_64-darwin
        ;;
    Darwin.arm64|Darwin.aarch64)
        hash=e8e1697edaca128f1df5e4bc90f9b2d203fd4935380c4a46eaf2e8fc1a867c7e
        path=h76x45k99m7iiys808fq1q63ifw1xmb9/nix-2.33.1-aarch64-darwin.tar.xz
        system=aarch64-darwin
        ;;
    *) oops "sorry, there is no binary distribution of Nix for your platform";;
esac

# Use this command-line option to fetch the tarballs using nar-serve or Cachix
if [ "${1:-}" = "--tarball-url-prefix" ]; then
    if [ -z "${2:-}" ]; then
        oops "missing argument for --tarball-url-prefix"
    fi
    url=${2}/${path}
    shift 2
else
    url=https://releases.nixos.org/nix/nix-2.33.1/nix-2.33.1-$system.tar.xz
fi

tarball=$tmpDir/nix-2.33.1-$system.tar.xz

require_util tar "unpack the binary tarball"
if [ "$(uname -s)" != "Darwin" ]; then
    require_util xz "unpack the binary tarball"
fi

if command -v curl > /dev/null 2>&1; then
    fetch() { curl --fail -L "$1" -o "$2"; }
elif command -v wget > /dev/null 2>&1; then
    fetch() { wget "$1" -O "$2"; }
else
    oops "you don't have wget or curl installed, which I need to download the binary tarball"
fi

echo "downloading Nix 2.33.1 binary tarball for $system from '$url' to '$tmpDir'..."
fetch "$url" "$tarball" || oops "failed to download '$url'"

if command -v sha256sum > /dev/null 2>&1; then
    hash2="$(sha256sum -b "$tarball" | cut -c1-64)"
elif command -v shasum > /dev/null 2>&1; then
    hash2="$(shasum -a 256 -b "$tarball" | cut -c1-64)"
elif command -v openssl > /dev/null 2>&1; then
    hash2="$(openssl dgst -r -sha256 "$tarball" | cut -c1-64)"
else
    oops "cannot verify the SHA-256 hash of '$url'; you need one of 'shasum', 'sha256sum', or 'openssl'"
fi

if [ "$hash" != "$hash2" ]; then
    oops "SHA-256 hash mismatch in '$url'; expected $hash, got $hash2"
fi

unpack=$tmpDir/unpack
mkdir -p "$unpack"
tar -xJf "$tarball" -C "$unpack" || oops "failed to unpack '$url'"

script=$(echo "$unpack"/*/install)

[ -e "$script" ] || oops "installation script is missing from the binary tarball!"
export INVOKED_FROM_INSTALL_IN=1
"$script" "$@"

} # End of wrapping
