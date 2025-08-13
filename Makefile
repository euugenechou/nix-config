.PHONY: darwin
darwin:
	darwin-rebuild switch --show-trace --option eval-cache false --flake .

.PHONY: darwin-setup
darwin-setup:
	nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .

.PHONY: home
home:
	home-manager switch --flake .

.PHONY: home-setup
home-setup:
	nix run home-manager --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .

.PHONY: update
update:
	nix flake update

.PHONY: clean
clean:
	nix-collect-garbage -d
