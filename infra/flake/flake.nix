{
  description = "Development environment";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = { allowUnfree = true; };
        };

        php = pkgs.php80.buildEnv {
          extensions = { all, ... }: with all; [ 
            readline
            dom
            filter
            openssl
            ctype
            tokenizer 
            session 
            mbstring
            xmlwriter
            curl
            simplexml
            opcache 
            apcu 
            intl 
            iconv
            pdo_mysql
            pdo_sqlite
            xdebug
          ];
          extraConfig = "memory_limit=256M";
        };

      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            # system dependencies
            pkgs.gettext
            pkgs.nginx
            pkgs.bash
            pkgs.gnumake
          
            # project dependencies
            php
            php.packages.composer
            pkgs.nodejs-14_x
            (pkgs.yarn.override { nodejs = pkgs.nodejs-14_x; })
            pkgs.sqlite
          ];
        };
      }
    );
  }

