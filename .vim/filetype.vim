"
" Filetype detection
"
augroup filetypedetect
	" Detect .txt as 'text'
    autocmd! BufNewFile,BufRead *.txt setfiletype text
    autocmd! BufNewFile,BufRead *.phtml setfiletype php 
augroup END

au BufNewFile,BufRead  svn-commit.* setf svn
" Actionscript 
au BufNewFile,BufRead *.as		setf actionscript 

au BufNewFile,BufRead *.ini,*/.hgrc,*/.hg/hgrc setf ini

autocmd FileType python compiler pylint
