if exists("b:current_syntax")
    finish
endif

"Read as: any number of digits, maybe a ., then any number of digits, then
"maybe an e, then any number of digits
syntax match potionNumber "\v\d+\.?\d*e?[+-]?\d*"
"\x* matches hexidemimal digits
syntax match potionNumber "\v0x\x*"

"Searching for literal multiplication/division/... characters
"Make sure to match smaller stuff like `=` and `-` earlier
"This is because once something is matched, it gets out of the pool of things
"that can be matched
syntax match potionOperator "\v\="
syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="

syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return

syntax keyword potionFunction print join string
highlight link potionFunction Function

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/

"Uses regex rather than just match a word
syntax match potionComment "\v#.*$"



highlight link potionNumber Number
highlight link potionKeyword Keyword
highlight link potionOperator Operator
highlight link potionComment Comment
highlight link potionString String

let b:current_syntax = "potion"
