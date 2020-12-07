{ stdenv, libbsd, fetchurl, phpPackages, php }:

stdenv.mkDerivation rec {
  version = "4.7.8";
  pname = "adminer";

  # not using fetchFromGitHub as the git repo relies on submodules that are included in the tar file
  src = fetchurl {
    url = "https://github.com/vrana/adminer/releases/download/v${version}/adminer-${version}.tar.gz";
    sha256 = "0k794agvd8pa3mwl0076i7753fzxd41lhr23aih4l2lbdgnzi68z";
  };

  nativeBuildInputs = with phpPackages; [ php composer ];

  buildPhase = ''
    composer --no-cache run compile
  '';

  installPhase = ''
    mkdir $out
    cp adminer-${version}.php $out/adminer.php
  '';

  meta = with stdenv.lib; {
    description = "Database management in a single PHP file";
    homepage = "https://www.adminer.org";
    license = with licenses; [ asl20 gpl2 ];
    maintainers = with maintainers; [ sstef ];
    platforms = platforms.all;
  };
}
