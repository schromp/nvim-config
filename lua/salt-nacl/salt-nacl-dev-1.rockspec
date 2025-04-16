package = "salt-nacl"
version = "dev-1"
source = {
	url = "git+ssh://git@github.com/schromp/nvim-config.git",
}
description = {
	homepage = "*** please enter a project homepage ***",
	license = "*** please specify a license ***",
}
build = {
	type = "builtin",
	modules = {
		init = "init.lua",
	},
}
dependencies = {
	"base64",
	"luasodium",
}
