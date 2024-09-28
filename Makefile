.PHONY: switch
switch:
	darwin-rebuild switch --show-trace --option eval-cache false --flake .

.PHONY: setup
setup:
	nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .
