syntax case match

syntax region c65Comment start=/\/\*/ end=/\*\//
highlight link c65Comment Comment

syntax region c65String start=/"/ end=/\(\\\\\)*"/
highlight link c65String String

syntax keyword c65Qualifier const register var config
syntax keyword c65KwFlow return

highlight link c65Qualifier Keyword
highlight link c65KwFlow Conditional

syntax match c65HexVal /\<0x[a-fA-F0-9]\+\>/
highlight link c65HexVal Number
syntax match c65DecVal /\<[0-9]\+\(\.[0-9]\+\)\?\>/
highlight link c65DecVal NUmber

syntax match c65Call /%\?[a-zA-Z_][a-zA-Z_0-9]*\ze(/
highlight link c65Call Function

syntax match c65Assign /\<[a-zA-Z_][a-zA-Z_0-9]*\ze\(\s*=\)/
highlight link c65Assign Identifier

syntax match c65Op /=\|{\|}\|\[\|\]\|(\|)\|\.\|;\|->\|,\|\*\|\^\|&&\|&/
highlight link c65Op @punctuation

syntax match c65Constant /\<[A-Z_][A-Z0-9_]*\>/
highlight link c65Constant Constant

syntax keyword c65BuiltinType i8 i16 i24 u8 u16 u24 bool void
highlight link c65BuiltinType Type
