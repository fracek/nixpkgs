{ lib
, buildDunePackage
, tezos-stdlib
, tezos-mockup-proxy
, tezos-context
, ringo-lwt
, alcotest-lwt
, crowbar
, tezos-test-services
, tezos-test-helpers
}:

buildDunePackage {
  pname = "tezos-proxy";
  inherit (tezos-stdlib) version useDune2;
  src = "${tezos-stdlib.base_src}/src/lib_proxy";

  propagatedBuildInputs = [
    ringo-lwt
    tezos-mockup-proxy
    tezos-context
  ];

  checkInputs = [
    alcotest-lwt
    crowbar
    tezos-test-services
    tezos-test-helpers
  ];

  doCheck = true;

  meta = tezos-stdlib.meta // {
    description = "Tezos: protocol registration for the mockup mode";
  };
}
