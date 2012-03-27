

pathogen:
	curl 'www.vim.org/scripts/download_script.php?src_id=16224' >> autoload/pathogen.vim

bundles:
	git submodule foreach git pull origin master
