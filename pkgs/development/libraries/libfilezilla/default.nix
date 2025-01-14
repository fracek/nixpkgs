{ lib, stdenv
, fetchurl
, autoreconfHook
, gettext
, gnutls
, nettle
, pkg-config
, libiconv
, ApplicationServices
}:

stdenv.mkDerivation rec {
  pname = "libfilezilla";
  version = "0.34.2";

  src = fetchurl {
    url = "https://download.filezilla-project.org/${pname}/${pname}-${version}.tar.bz2";
    sha256 = "sha256-IKKLd+whs4CtAgLbAWbtHHycItRQSN1oBtXsn+J/7Uo=";
  };

  nativeBuildInputs = [ autoreconfHook pkg-config ];

  buildInputs = [ gettext gnutls nettle ]
    ++ lib.optionals stdenv.isDarwin [ libiconv ApplicationServices ];

  enableParallelBuilding = true;

  meta = with lib; {
    homepage = "https://lib.filezilla-project.org/";
    description = "A modern C++ library, offering some basic functionality to build high-performing, platform-independent programs";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ pSub ];
    platforms = platforms.unix;
  };
}
