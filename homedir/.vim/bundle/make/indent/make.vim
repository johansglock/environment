setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=0
setlocal list!

" Mark leading whitespace red except when we're in insert mode.
"  (It's just freaking annoying to see a red flashing background
"   all the time.)
highlight default link LeadingWhitespace ErrorMsg
match LeadingWhitespace /^ \+/
autocmd InsertEnter * hi link LeadingWhitespace NONE
autocmd InsertLeave * hi link LeadingWhitespace ErrorMsg
