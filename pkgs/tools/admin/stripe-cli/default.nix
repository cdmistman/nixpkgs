{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "stripe-cli";
  version = "1.5.11";

  src = fetchFromGitHub {
    owner = "stripe";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-aoflV4C7eH0RNdq8j7kPeAfnOEZECmfZ91/QBQy7oxY=";
  };

  vendorSha256 = "sha256-e7EZ5o30vDpS904/R1y7/Mds7HxQNmsIftrnc1Bj2bc=";

  subPackages = [
    "cmd/stripe"
  ];

  meta = with lib; {
    homepage = "https://stripe.com/docs/stripe-cli";
    description = "A command-line tool for Stripe";
    license = with licenses; [ asl20 ];
    maintainers = with maintainers; [ RaghavSood ];
  };
}
