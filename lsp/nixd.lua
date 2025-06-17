return {
	cmd = { "nixd", "--inlay-hints=true" },
	filetypes = { "nix" },
	root_markers = { "flake.nix" },
	settings = {
		nixd = {
			formatting = {
				command = { "nixpkgs-fmt" },
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "/home/lk/repos/nixconfig").nixosConfigurations.tower.options',
				},
				home_manager = {
					expr = '(builtins.getFlake "/home/lk/repos/nixconfig").homeConfigurations."lk".options',
				},
			},
		},
	},
}
