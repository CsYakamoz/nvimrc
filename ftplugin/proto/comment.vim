if exists("b:cs_comment")
    finish
endif

setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://

let b:cs_comment = 1
