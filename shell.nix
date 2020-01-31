{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
	# inputsFrom = with pkgs; [ pkgconfig autoconf automake gnumake ];
	buildInputs = with pkgs; [
		git
		gcc
		gnumake
		pkgconfig
		openssl
		autoconf
		automake
		stella
	];
}
