apply:
	sudo ./rebuild.sh

rebuild:
	darwin-rebuild switch --flake ".#$(uname -m)-darwin" --impure --option access-tokens "github.com=$(gh auth token)"

upgrade:
	nix flake update --option access-tokens "github.com=$(gh auth token)"
