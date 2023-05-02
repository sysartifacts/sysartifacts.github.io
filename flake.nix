{
  description = "Website for sysartifacts.github.io";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/22.11";
  };

  outputs = inputs: with inputs; let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

        # The build environment
    env = pkgs.bundlerEnv {
      name = "sysartifacts.github.io";
      ruby = pkgs.ruby;
      gemdir = ./.;
    };

    # Utility to run a script easily in the flakes app
    simple_script = name: add_deps: text: let
      exec = pkgs.writeShellApplication {
        inherit name text;
        runtimeInputs = with pkgs; [
          bundler
        ] ++ add_deps;
      };
    in {
      type = "app";
      program = "${exec}/bin/${name}";
    };
  in {
    apps.${system} = {
      default = simple_script "serve" [] ''
        echo "Bundler env: ${env}"
        ${env}/bin/bundler exec -- jekyll serve --trace
      '';

      generate = simple_script "generate_env" [ pkgs.bundix ] ''
        set -e
        rm -f gemset.nix
        
        export BUNDLE_PATH=vendor
        export BUNDLE_CACHE_ALL=true
        export BUNDLE_NO_INSTALL=true
        export BUNDLE_FORCE_RUBY_PLATFORM=true

        
        bundler update
        bundler lock
        bundler package
        bundix --magic
        rm -rf vendor
      '';
    };
  };
}
