{ stdenv, texlive }:
stdenv.mkDerivation {
  name = "lc-lecture";
  src = ./.;
  buildInputs = [
    (texlive.combine {
      inherit (texlive) scheme-full beamer;
    })
  ];
  buildPhase = ''pdflatex *.tex'';
  installPhase = ''mkdir $out; cp *.pdf $out'';
}
