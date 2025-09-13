{
  description = "Laravel 9 project with PHP 8.2 and Composer 2";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; # Stable channel
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          php82
          php82Extensions.pdo
          php82Extensions.mbstring
          php82Extensions.tokenizer
          php82Extensions.xml
          php82Extensions.curl
          php82Extensions.zip
          php82Extensions.bcmath
          php82Extensions.gd
          composer
          nodejs_20
        ];

        shellHook = ''
          echo "🚀 Laravel 9 environment ready with PHP $(php -v | head -n1), Composer $(composer --version)"
          echo "Run: composer create-project laravel/laravel example-app '9.*'"
        '';
      };
    };
}
