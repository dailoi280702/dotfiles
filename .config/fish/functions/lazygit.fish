function lazygit
	git add .
	git commit -a -m $argv
	git push
end
