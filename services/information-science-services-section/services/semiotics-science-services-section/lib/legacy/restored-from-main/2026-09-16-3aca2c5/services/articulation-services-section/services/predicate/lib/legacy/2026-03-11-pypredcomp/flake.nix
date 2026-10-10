{
  description = "pypredcomp — Python implementation of the predicated-computing OS substrate";

  # Python build via uv2nix: pyproject.toml + uv.lock drive every dep.
  # No hand-listed runtimeDeps, no pinned wheels, no setuptools/wheel
  # native-build-input incantation — uv2nix produces the full Nix
  # derivation graph from the lock.
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    pyproject-nix = {
      url = "github:pyproject-nix/pyproject.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    uv2nix = {
      url = "github:pyproject-nix/uv2nix";
      inputs.pyproject-nix.follows = "pyproject-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pyproject-build-systems = {
      url = "github:pyproject-nix/build-system-pkgs";
      inputs.pyproject-nix.follows = "pyproject-nix";
      inputs.uv2nix.follows = "uv2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, pyproject-nix, uv2nix, pyproject-build-systems, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        lib = pkgs.lib;
        python = pkgs.python313;

        workspace = uv2nix.lib.workspace.loadWorkspace {
          workspaceRoot = ./.;
        };

        uvOverlay = workspace.mkPyprojectOverlay {
          sourcePreference = "wheel";
        };

        pythonSet =
          (pkgs.callPackage pyproject-nix.build.packages {
            inherit python;
          }).overrideScope (lib.composeManyExtensions [
            pyproject-build-systems.overlays.default
            uvOverlay
          ]);

        pypredcomp = pythonSet.mkVirtualEnv
          "pypredcomp-${(lib.importTOML ./pyproject.toml).project.version}"
          workspace.deps.default;

        # Test env: includes optional-dep groups (notably the `dev`
        # extra → pytest + pytest-asyncio + hypothesis + ruff).
        pypredcompTestEnv = pythonSet.mkVirtualEnv "pypredcomp-test-env"
          workspace.deps.all;

        pypredcompPytest = pkgs.runCommand "pypredcomp-pytest"
          {
            nativeBuildInputs = [ pypredcompTestEnv pkgs.git ];
          } ''
            cp -R ${./.} source
            chmod -R u+w source
            cd source
            export PATH="${pkgs.git}/bin:$PATH"
            export HOME=$TMPDIR
            pytest tests -q
            touch $out
          '';

      in {
        packages = {
          inherit pypredcomp;
          default = pypredcomp;
        };

        checks = {
          inherit pypredcompPytest;
          default = pypredcompPytest;
        };

        apps.substrate = {
          type = "app";
          program = "${pypredcomp}/bin/substrate";
        };
        apps.substrate-mcp = {
          type = "app";
          program = "${pypredcomp}/bin/substrate-mcp";
        };
        apps.default = self.apps.${system}.substrate;

        devShells.default = pkgs.mkShell {
          name = "pypredcomp-dev";
          packages = [
            pypredcomp
            pkgs.git
            pkgs.uv
            pkgs.ruff
          ];
          shellHook = ''
            echo "pypredcomp development shell"
            echo "  python: $(python --version)"
            echo "  uv:     $(uv --version)"
            echo "Boot the substrate with: substrate"
          '';
        };
      });
}
