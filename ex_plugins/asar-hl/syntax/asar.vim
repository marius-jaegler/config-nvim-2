syntax case ignore

syntax match asarDefine /![a-zA-Z_0-9]\+/
highlight link asarDefine Define

syntax region asarDefineNested start=/!{/ end=/}/ contains=asarDefine,asarDefineNested
highlight link asarDefineNested Define

syntax match asarLineComment /;.*$/
syntax region asarBlockcomment start=/;\[\[/ end=/\]\]/
highlight link asarLineComment Comment
highlight link asarBlockComment Comment


syntax keyword asarIf if elseif else endif
syntax keyword asarLoop while endwhile for endfor function
syntax keyword asarKw arch spcblock endspcblock asar
syntax keyword asarKw lorom hirom exlorom exhirom sa1rom bigsa1rom
syntax keyword asarKw org base skip bank dpbase optimize pushpc pullpc pullbase pushbase
syntax keyword asarKw struct endstruct namespace pushns pullns global undef macro endmacro
syntax keyword asarKw db dw dl dd
syntax keyword asarKw cleartable pulltable pushtable
syntax keyword asarKw fillbyte fill fillword filllong filldword
syntax keyword asarKw pad padbyte padword padlong paddword
syntax keyword asarInc incbin incsrc include includeonce includefrom includeonce
syntax keyword asarKw freespace freecode freedata segment freespacebyte freespace_settings
syntax keyword asarKw autoclean prot
syntax keyword asarPrint print reset warn[pc] error assert assert check warnings
syntax keyword asarKwArg nested align offset on off ram noram cleaned static bankcross dp address default mirrors auto
syntax keyword asarKwArg bank start pin freespaceuse bytes push pull half full always enable disable data_bank noassume

syntax match asarHexVal /\$[0-9a-f]\+\>/
highlight link asarHexVal Number
syntax match asarBinVal /%[01]\+\>/
highlight link asarBinVal Number
syntax match asarDecVal /\<[0-9]\+\(\.[0-9]\+\)\?/
highlight link asarDecVal NUmber

syntax match asarOpCodeLen /\>\.\(b\|w\|l\)/
highlight link asarOpCodeLen Operator

highlight link asarIf Conditional
highlight link asarLoop Repeat
highlight link asarKw Keyword
highlight link asarInc Include
highlight link asarPrint Exception
highlight link asarKwArg Constant

syntax match asarChar /'.'/
highlight link asarChar Character

syntax region asarString start=/"/ skip=/""/ end=/"/ oneline contains=asarDefine
highlight link asarString String

syntax match asarOp /+\|-\|*\|\/\|%\|<<\|>>\|@\|&\||\|\^\|\~\|<:\|=\|?=\|:=\|#=\|+=\|#\|==\|!=\|<=\|>=\|>\|</
highlight link asarOp Operator


syntax match asarIdent /\<[a-zA-Z][a-zA-Z0-9_]*\>/ contains=asarCall
highlight link asarident Identifier

syntax match asarCall /%\?[a-zA-Z_][a-zA-Z_0-9]*\ze(/
highlight link asarCall Function

syntax keyword asarSnesOp ADC AND ASL BCC BCS BEQ BIT BMI BNE BPL BRA BRK BRL BVC BVS CLC CLD CLI CLV CMP COP CPX CPY DEC DEX DEY EOR INC INX INY JML JMP JSL JSR LDA LDX LDY LSR MVN MVP NOP ORA PEA PEI PER PHA PHB PHD PHK PHP PHX PHY PLA PLB PLD PLP PLX PLY REP ROL ROR RTI RTL RTS SBC SEC SED SEI SEP STA STP STX STY STZ TAX TAY TCD TCS TDC TRB TSB TSC TSX TXA TXS TXY TYA TYX WAI WDM XBA XCE 
highlight link asarSnesOp Function

syntax match asarMainLabel /\(\n\|^\)\s*[+\-\.?#a-z0-9_]\+:/
highlight link asarMainLabel Tag

