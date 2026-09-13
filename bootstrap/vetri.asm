default rel
extern printi
extern prints
extern printc
extern nl
extern erri
extern errs
extern errc
extern errnl
extern readfile
extern streq
extern strcmp
extern strlen
global skip_whitespace
global skip_comment
global get_tokens
global find_name
global debug_find_name
global prescan_fn_args
global prescan_string
global str2int
global prescan_alloc_cell
global prescan_extern_fn
global prescan_fn
global prescan_assignment
global prescan_local
global prescan_struct
global prescan_new
global prescan
global debug_print_struct
global declare_fn
global declare_strings
global declare_alloc_cells
global declare_variables
global emit_head
global is_valid_integer
global parse_and_emit_integer
global parse_and_emit_string
global parse_and_emit_if
global parse_and_emit_elif
global parse_and_emit_then
global parse_and_emit_else
global parse_and_emit_endif
global parse_and_emit_while
global parse_and_emit_do
global parse_and_emit_endwhile
global parse_and_emit_assignment
global parse_and_emit_add_and_assign
global parse_and_emit_sub_and_assign
global parse_and_emit_mul_and_assign
global parse_and_emit_div_and_assign
global parse_and_emit_mod_and_assign
global parse_and_emit_alloc
global parse_and_emit_fn
global parse_and_emit_return
global parse_and_emit_endfn
global parse_and_emit_fn_call
global parse_and_skip_fn
global parse_and_skip_struct
global is_local_variable
global parse_and_emit_dot
global parse_and_emit_dot_assign
global parse_and_emit
global parse_and_emit_standalone_fn
global _start
section .data
str_0 db `Usage: vetri file\n`, 0
str_1 db `comment begin: `, 0
str_2 db `comment end\n`, 0
str_3 db `Tokens: `, 0
str_4 db `Lines: `, 0
str_5 db `rdi`, 0
str_6 db `rsi`, 0
str_7 db `rdx`, 0
str_8 db `rcx`, 0
str_9 db `r8`, 0
str_10 db `r9`, 0
str_11 db `rax`, 0
str_12 db `argc`, 0
str_13 db `argv`, 0
str_14 db `printi`, 0
str_15 db `prints`, 0
str_16 db `printc`, 0
str_17 db `nl`, 0
str_18 db `erri`, 0
str_19 db `errs`, 0
str_20 db `errc`, 0
str_21 db `errnl`, 0
str_22 db `readfile`, 0
str_23 db `streq`, 0
str_24 db `strcmp`, 0
str_25 db `strlen`, 0
str_26 db `+`, 0
str_27 db `pop rbx\npop rax\nadd rax, rbx\npush rax\n`, 0
str_28 db `-`, 0
str_29 db `pop rbx\npop rax\nsub rax, rbx\npush rax\n`, 0
str_30 db `*`, 0
str_31 db `pop rbx\npop rax\nimul rax, rbx\npush rax\n`, 0
str_32 db `/`, 0
str_33 db `pop rbx\npop rax\ncqo\nidiv rbx\npush rax\n`, 0
str_34 db `%`, 0
str_35 db `pop rbx\npop rax\ncqo\nidiv rbx\npush rdx\n`, 0
str_36 db `/%`, 0
str_37 db `pop rbx\npop rax\ncqo\nidiv rbx\npush rdx\npush rax\n`, 0
str_38 db `>`, 0
str_39 db `pop rbx\npop rax\ncmp rax, rbx\nsetg al\nmovzx rax, al\npush rax\n`, 0
str_40 db `<`, 0
str_41 db `pop rbx\npop rax\ncmp rax, rbx\nsetl al\nmovzx rax, al\npush rax\n`, 0
str_42 db `>=`, 0
str_43 db `pop rbx\npop rax\ncmp rax, rbx\nsetge al\nmovzx rax, al\npush rax\n`, 0
str_44 db `<=`, 0
str_45 db `pop rbx\npop rax\ncmp rax, rbx\nsetle al\nmovzx rax, al\npush rax\n`, 0
str_46 db `==`, 0
str_47 db `pop rbx\npop rax\ncmp rax, rbx\nsete al\nmovzx rax, al\npush rax\n`, 0
str_48 db `!=`, 0
str_49 db `pop rbx\npop rax\ncmp rax, rbx\nsetne al\nmovzx rax, al\npush rax\n`, 0
str_50 db `not`, 0
str_51 db `pop rax\ntest rax, rax\nsetz al\nmovzx rax, al\npush rax\n`, 0
str_52 db `and`, 0
str_53 db `pop rbx\npop rax\ntest rax, rax\nsetnz al\ntest rbx, rbx\nsetnz bl\nand al, bl\nmovzx rax, al\npush rax\n`, 0
str_54 db `or`, 0
str_55 db `pop rbx\npop rax\ntest rax, rax\nsetnz al\ntest rbx, rbx\nsetnz bl\nor al, bl\nmovzx rax, al\npush rax\n`, 0
str_56 db `[]`, 0
str_57 db `pop rbx\npop rax\nmov rax, [rbx + rax * 8]\npush rax\n`, 0
str_58 db `[]=`, 0
str_59 db `pop rbx\npop rcx\npop rax\nmov [rbx + rcx * 8], rax\n`, 0
str_60 db `b[]`, 0
str_61 db `pop rbx\npop rax\nmovzx rax, byte [rbx + rax]\npush rax\n`, 0
str_62 db `b[]=`, 0
str_63 db `pop rbx\npop rcx\npop rax\nmov [rbx + rcx], al\n`, 0
str_64 db `getargv`, 0
str_65 db `pop rax\nmov rbx, [argv]\nmov rcx, [rbx + rax * 8]\npush rcx\n`, 0
str_66 db `exit`, 0
str_67 db `pop rdi\nmov rax, 60\nsyscall\n`, 0
str_68 db `dup`, 0
str_69 db `pop rax\npush rax\npush rax\n`, 0
str_70 db `drop`, 0
str_71 db `pop rax\n`, 0
str_72 db `swap`, 0
str_73 db `pop rbx\npop rax\npush rbx\npush rax\n`, 0
str_74 db `over`, 0
str_75 db `pop rbx\npop rax\npush rax\npush rbx\npush rax\n`, 0
str_76 db `rot`, 0
str_77 db `pop rcx\npop rbx\npop rax\npush rbx\npush rcx\npush rax\n`, 0
str_78 db `Null array point\n`, 0
str_79 db `Comparing `, 0
str_80 db ` and `, 0
str_81 db ` match!\n`, 0
str_82 db ` unmatch, continue\n`, 0
str_83 db `No result\n`, 0
str_84 db `(`, 0
str_85 db `--`, 0
str_86 db `input: `, 0
str_87 db `)`, 0
str_88 db ` output: `, 0
str_89 db `try to find `, 0
str_90 db ` in funcs[]\n`, 0
str_91 db `start searching `, 0
str_92 db `append `, 0
str_93 db ` to funcs[]\n`, 0
str_94 db ` exists\n`, 0
str_95 db `:Invalid nesting function declaration\n`, 0
str_96 db `find local variable: `, 0
str_97 db `endstruct`, 0
str_98 db `:Type Error: Unknown struct '`, 0
str_99 db `'\n`, 0
str_100 db `prescan begin:\n`, 0
str_101 db `alloc`, 0
str_102 db `extern`, 0
str_103 db `fn`, 0
str_104 db `->`, 0
str_105 db `local`, 0
str_106 db `endfn`, 0
str_107 db `struct`, 0
str_108 db `new`, 0
str_109 db `prescan end\n`, 0
str_110 db `Strings: `, 0
str_111 db `Functions: `, 0
str_112 db `Variables: `, 0
str_113 db `Local variables: `, 0
str_114 db `Structs: `, 0
str_115 db `: `, 0
str_116 db `extern `, 0
str_117 db `global `, 0
str_118 db `str_`, 0
str_119 db ` db `, 0
str_120 db `\`, 0\n`, 0
str_121 db `alloc_`, 0
str_122 db ` resq `, 0
str_123 db ` resq 1\n`, 0
str_124 db `default rel\n`, 0
str_125 db `global _start\n`, 0
str_126 db `section .data\n`, 0
str_127 db `section .bss\n`, 0
str_128 db `section .text\n`, 0
str_129 db `_start:\n`, 0
str_130 db `mov rbp, rsp\n`, 0
str_131 db `mov rax, [rbp]\n`, 0
str_132 db `lea rbx, [rbp + 8]\n`, 0
str_133 db `mov [argc], rax\n`, 0
str_134 db `mov [argv], rbx\n`, 0
str_135 db `push `, 0
str_136 db `lea rax, [str_`, 0
str_137 db `]\n`, 0
str_138 db `push rax\n`, 0
str_139 db `jmp .L_ENDIF_`, 0
str_140 db `.L_IF_`, 0
str_141 db `_ELIF_`, 0
str_142 db `:\n`, 0
str_143 db `pop rax\ntest rax, rax\n`, 0
str_144 db `jz .L_IF_`, 0
str_145 db `.L_ENDIF_`, 0
str_146 db `.L_WHILE_`, 0
str_147 db `jz .L_ENDWHILE_`, 0
str_148 db `jmp .L_WHILE_`, 0
str_149 db `.L_ENDWHILE_`, 0
str_150 db `mov [rbp-`, 0
str_151 db `], rax\n`, 0
str_152 db `mov [`, 0
str_153 db `add [rbp-`, 0
str_154 db `add [`, 0
str_155 db `sub [rbp-`, 0
str_156 db `sub [`, 0
str_157 db `imul rax, [rbp-`, 0
str_158 db `imul rax, [`, 0
str_159 db `pop rbx\n`, 0
str_160 db `mov rax, [rbp-`, 0
str_161 db `cqo\nidiv rbx\n`, 0
str_162 db `mov rax, [`, 0
str_163 db `], rdx\n`, 0
str_164 db `lea rax, [alloc_`, 0
str_165 db `found at funcs[`, 0
str_166 db `push rbp\nmov rbp, rsp\n`, 0
str_167 db `sub rsp, `, 0
str_168 db `jmp .L_RET_FN_`, 0
str_169 db `.L_RET_FN_`, 0
str_170 db `pop rdx\npop rax\n`, 0
str_171 db `mov rsp, rbp\npop rbp\n`, 0
str_172 db `ret\n`, 0
str_173 db `.L_SKIP_FN_`, 0
str_174 db `pop `, 0
str_175 db `call `, 0
str_176 db `pop rbx\nmov rax, [rbx + `, 0
str_177 db `]\npush rax\n`, 0
str_178 db `:Type Error: Unknown struct field '`, 0
str_179 db `pop rbx\npop rax\nmov [rbx + `, 0
str_180 db `if`, 0
str_181 db `elif`, 0
str_182 db `then`, 0
str_183 db `else`, 0
str_184 db `endif`, 0
str_185 db `while`, 0
str_186 db `do`, 0
str_187 db `endwhile`, 0
str_188 db `+=>`, 0
str_189 db `-=>`, 0
str_190 db `*=>`, 0
str_191 db `/=>`, 0
str_192 db `%=>`, 0
str_193 db `.`, 0
str_194 db `.=`, 0
str_195 db `find extern\n`, 0
str_196 db `return`, 0
str_197 db `:Symbol Error: Unknown symbol '`, 0
str_198 db `mov rax, 60\nmov rdi, 0\nsyscall\n`, 0
str_199 db `section .note.GNU-stack noalloc noexec nowrite progbits\n`, 0
section .bss
alloc_0 resq 4096
alloc_1 resq 4096
alloc_2 resq 64
alloc_3 resq 64
alloc_4 resq 64
alloc_5 resq 32
alloc_6 resq 512
alloc_7 resq 512
alloc_8 resq 64
alloc_9 resq 256
alloc_10 resq 128
alloc_11 resq 128
alloc_12 resq 32
alloc_13 resq 128
alloc_14 resq 128
alloc_15 resq 32
alloc_16 resq 32
alloc_17 resq 32
alloc_18 resq 32
alloc_19 resq 32
alloc_20 resq 8
alloc_21 resq 8
alloc_22 resq 128
alloc_23 resq 128
alloc_24 resq 128
alloc_25 resq 512
argc resq 1
argv resq 1
filename resq 1
code resq 1
code_len resq 1
tokens resq 1
tokens_line_number resq 1
token_cnt resq 1
line_cnt resq 1
label_cnt resq 1
if_stack resq 1
elif_stack resq 1
if_stack_top resq 1
has_else resq 1
has_else_cnt resq 1
while_stack resq 1
while_stack_top resq 1
variables resq 1
variables_cnt resq 1
local_variables resq 1
local_variables_cnt resq 1
alloc_cells resq 1
alloc_cnt resq 1
str_cnt resq 1
strings resq 1
funcs resq 1
funcs_variable_start resq 1
funcs_variable_cnt resq 1
funcs_token_start resq 1
funcs_token_end resq 1
funcs_is_extern resq 1
funcs_input resq 1
funcs_output resq 1
funcs_cnt resq 1
ops_name resq 1
ops_code resq 1
ops_cnt resq 1
funcs_para_regs resq 1
funcs_ret_regs resq 1
structs resq 1
structs_field_start resq 1
structs_field_cnt resq 1
structs_cnt resq 1
fields resq 1
fields_cnt resq 1
cur_func_input_count resq 1
cur_func_output_count resq 1
raw_str resq 1
alloc_idx resq 1
section .text
_start:
mov rbp, rsp
mov rax, [rbp]
lea rbx, [rbp + 8]
mov [argc], rax
mov [argv], rbx
mov rax, [argc]
push rax
push 2
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_0_ELIF_0
lea rax, [str_0]
push rax
pop rdi
call prints
push 1
pop rdi
mov rax, 60
syscall
.L_IF_0_ELIF_0:
.L_ENDIF_0:
push 1
pop rax
mov rbx, [argv]
mov rcx, [rbx + rax * 8]
push rcx
pop rax
mov [filename], rax
mov rax, [filename]
push rax
pop rdi
call readfile
push rdx
push rax
pop rax
mov [code], rax
pop rax
mov [code_len], rax
mov rax, [code_len]
push rax
push 0
pop rbx
pop rax
cmp rax, rbx
setle al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_1_ELIF_0
push 1
pop rdi
mov rax, 60
syscall
.L_IF_1_ELIF_0:
.L_ENDIF_1:
lea rax, [alloc_0]
push rax
pop rax
mov [tokens], rax
lea rax, [alloc_1]
push rax
pop rax
mov [tokens_line_number], rax
push 0
pop rax
mov [token_cnt], rax
push 0
pop rax
mov [line_cnt], rax
mov rax, [tokens]
push rax
mov rax, [token_cnt]
push rax
pop rsi
pop rdi
call get_tokens
push rax
pop rax
mov [token_cnt], rax
lea rax, [str_3]
push rax
pop rdi
call errs
mov rax, [token_cnt]
push rax
pop rdi
call erri
call errnl
lea rax, [str_4]
push rax
pop rdi
call errs
mov rax, [line_cnt]
push rax
pop rdi
call erri
call errnl
push 0
pop rax
mov [label_cnt], rax
lea rax, [alloc_2]
push rax
pop rax
mov [if_stack], rax
lea rax, [alloc_3]
push rax
pop rax
mov [elif_stack], rax
push 0
pop rax
mov [if_stack_top], rax
lea rax, [alloc_4]
push rax
pop rax
mov [has_else], rax
push 0
pop rax
mov [has_else_cnt], rax
lea rax, [alloc_5]
push rax
pop rax
mov [while_stack], rax
push 0
pop rax
mov [while_stack_top], rax
lea rax, [alloc_6]
push rax
pop rax
mov [variables], rax
push 0
pop rax
mov [variables_cnt], rax
lea rax, [alloc_7]
push rax
pop rax
mov [local_variables], rax
push 0
pop rax
mov [local_variables_cnt], rax
lea rax, [alloc_8]
push rax
pop rax
mov [alloc_cells], rax
push 0
pop rax
mov [alloc_cnt], rax
push 0
pop rax
mov [str_cnt], rax
lea rax, [alloc_9]
push rax
pop rax
mov [strings], rax
lea rax, [alloc_10]
push rax
pop rax
mov [funcs], rax
lea rax, [alloc_11]
push rax
pop rax
mov [funcs_variable_start], rax
lea rax, [alloc_12]
push rax
pop rax
mov [funcs_variable_cnt], rax
lea rax, [alloc_13]
push rax
pop rax
mov [funcs_token_start], rax
lea rax, [alloc_14]
push rax
pop rax
mov [funcs_token_end], rax
lea rax, [alloc_15]
push rax
pop rax
mov [funcs_is_extern], rax
lea rax, [alloc_16]
push rax
pop rax
mov [funcs_input], rax
lea rax, [alloc_17]
push rax
pop rax
mov [funcs_output], rax
push 0
pop rax
mov [funcs_cnt], rax
lea rax, [alloc_18]
push rax
pop rax
mov [ops_name], rax
lea rax, [alloc_19]
push rax
pop rax
mov [ops_code], rax
push 0
pop rax
mov [ops_cnt], rax
lea rax, [alloc_20]
push rax
pop rax
mov [funcs_para_regs], rax
lea rax, [alloc_21]
push rax
pop rax
mov [funcs_ret_regs], rax
lea rax, [alloc_22]
push rax
pop rax
mov [structs], rax
lea rax, [alloc_23]
push rax
pop rax
mov [structs_field_start], rax
lea rax, [alloc_24]
push rax
pop rax
mov [structs_field_cnt], rax
push 0
pop rax
mov [structs_cnt], rax
lea rax, [alloc_25]
push rax
pop rax
mov [fields], rax
push 0
pop rax
mov [fields_cnt], rax
push 0
push 0
mov rax, [funcs_para_regs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_5]
push rax
push 1
mov rax, [funcs_para_regs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_6]
push rax
push 2
mov rax, [funcs_para_regs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_7]
push rax
push 3
mov rax, [funcs_para_regs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_8]
push rax
push 4
mov rax, [funcs_para_regs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_9]
push rax
push 5
mov rax, [funcs_para_regs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_10]
push rax
push 6
mov rax, [funcs_para_regs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 0
push 0
mov rax, [funcs_ret_regs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_11]
push rax
push 1
mov rax, [funcs_ret_regs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_7]
push rax
push 2
mov rax, [funcs_ret_regs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_12]
push rax
mov rax, [variables_cnt]
push rax
mov rax, [variables]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [variables_cnt], rax
lea rax, [str_13]
push rax
mov rax, [variables_cnt]
push rax
mov rax, [variables]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [variables_cnt], rax
lea rax, [str_14]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 0
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
lea rax, [str_15]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 0
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
lea rax, [str_16]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 0
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
lea rax, [str_17]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 0
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 0
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
lea rax, [str_18]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 0
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
lea rax, [str_19]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 0
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
lea rax, [str_20]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 0
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
lea rax, [str_21]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 0
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 0
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
lea rax, [str_22]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 2
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
lea rax, [str_23]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 2
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
lea rax, [str_24]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 2
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
lea rax, [str_25]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
lea rax, [str_26]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_27]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_28]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_29]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_30]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_31]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_32]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_33]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_34]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_35]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_36]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_37]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_36]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_37]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
mov rax, [ops_cnt]
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
pop rax
mov [ops_cnt], rax
lea rax, [str_38]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_39]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_40]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_41]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_42]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_43]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_44]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_45]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_46]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_47]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_48]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_49]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_50]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_51]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_52]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_53]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_54]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_55]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_56]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_57]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_58]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_59]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_60]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_61]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_62]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_63]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_64]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_65]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_66]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_67]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_68]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_69]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_70]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_71]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_72]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_73]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_74]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_75]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_76]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_77]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_68]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_69]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_70]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_71]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_72]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_73]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_74]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_75]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
lea rax, [str_76]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_name]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_77]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [ops_cnt], rax
mov rax, [tokens]
push rax
mov rax, [token_cnt]
push rax
pop rsi
pop rdi
call prescan
lea rax, [str_110]
push rax
pop rdi
call errs
mov rax, [str_cnt]
push rax
pop rdi
call erri
call errnl
lea rax, [str_111]
push rax
pop rdi
call errs
mov rax, [funcs_cnt]
push rax
pop rdi
call erri
call errnl
lea rax, [str_112]
push rax
pop rdi
call errs
mov rax, [variables_cnt]
push rax
pop rdi
call erri
call errnl
lea rax, [str_113]
push rax
pop rdi
call errs
mov rax, [local_variables_cnt]
push rax
pop rdi
call erri
call errnl
lea rax, [str_114]
push rax
pop rdi
call errs
mov rax, [structs_cnt]
push rax
pop rdi
call erri
call errnl
call debug_print_struct
call emit_head
push 0
pop rax
mov [alloc_idx], rax
mov rax, [tokens]
push rax
mov rax, [token_cnt]
push rax
push 0
pop rdx
pop rsi
pop rdi
call parse_and_emit
lea rax, [str_198]
push rax
pop rdi
call prints
mov rax, [tokens]
push rax
mov rax, [token_cnt]
push rax
pop rsi
pop rdi
call parse_and_emit_standalone_fn
lea rax, [str_199]
push rax
pop rdi
call prints
mov rax, 60
mov rdi, 0
syscall
skip_whitespace:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 16
.L_WHILE_2:
mov rax, [rbp-24]
push rax
mov rax, [rbp-16]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-40], rax
push 32
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
mov rax, [rbp-40]
push rax
push 10
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
or al, bl
movzx rax, al
push rax
mov rax, [rbp-40]
push rax
push 9
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
or al, bl
movzx rax, al
push rax
mov rax, [rbp-40]
push rax
push 13
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
or al, bl
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_2
mov rax, [rbp-40]
push rax
push 10
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_3_ELIF_0
push 1
pop rax
add [line_cnt], rax
.L_IF_3_ELIF_0:
.L_ENDIF_3:
push 1
pop rax
add [rbp-24], rax
jmp .L_WHILE_2
.L_ENDWHILE_2:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_skip_whitespace
.L_RET_FN_skip_whitespace:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_skip_whitespace:
skip_comment:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 8
.L_WHILE_4:
mov rax, [rbp-24]
push rax
mov rax, [rbp-16]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 35
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_4
push 1
pop rax
add [rbp-24], rax
lea rax, [str_1]
push rax
pop rdi
call errs
.L_WHILE_5:
mov rax, [rbp-24]
push rax
mov rax, [rbp-16]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 10
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_5
push 1
pop rax
add [rbp-24], rax
jmp .L_WHILE_5
.L_ENDWHILE_5:
lea rax, [str_2]
push rax
pop rdi
call errs
push 1
pop rax
add [line_cnt], rax
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-24]
push rax
pop rdx
pop rsi
pop rdi
call skip_whitespace
push rax
pop rax
mov [rbp-24], rax
jmp .L_WHILE_4
.L_ENDWHILE_4:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_skip_comment
.L_RET_FN_skip_comment:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_skip_comment:
get_tokens:
push rbp
mov rbp, rsp
push rdi
push rsi
sub rsp, 24
push 0
pop rax
mov [rbp-32], rax
.L_WHILE_6:
mov rax, [rbp-32]
push rax
mov rax, [code_len]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_6
mov rax, [code]
push rax
mov rax, [code_len]
push rax
mov rax, [rbp-32]
push rax
pop rdx
pop rsi
pop rdi
call skip_whitespace
push rax
pop rax
mov [rbp-32], rax
mov rax, [code]
push rax
mov rax, [code_len]
push rax
mov rax, [rbp-32]
push rax
pop rdx
pop rsi
pop rdi
call skip_comment
push rax
pop rax
mov [rbp-32], rax
mov rax, [code]
push rax
mov rax, [code_len]
push rax
mov rax, [rbp-32]
push rax
pop rdx
pop rsi
pop rdi
call skip_whitespace
push rax
pop rax
mov [rbp-32], rax
mov rax, [code]
push rax
mov rax, [rbp-32]
push rax
pop rbx
pop rax
add rax, rbx
push rax
pop rax
mov [rbp-40], rax
mov rax, [rbp-32]
push rax
mov rax, [code_len]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-32]
push rax
mov rax, [code]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 34
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_7_ELIF_0
push 1
pop rax
add [rbp-32], rax
.L_WHILE_8:
mov rax, [rbp-32]
push rax
mov rax, [code_len]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-32]
push rax
mov rax, [code]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 34
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
mov rax, [rbp-32]
push rax
push 1
pop rbx
pop rax
sub rax, rbx
push rax
mov rax, [code]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 92
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
mov rax, [rbp-32]
push rax
mov rax, [code]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 34
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
or al, bl
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_8
push 1
pop rax
add [rbp-32], rax
jmp .L_WHILE_8
.L_ENDWHILE_8:
jmp .L_ENDIF_7
.L_IF_7_ELIF_0:
.L_WHILE_9:
mov rax, [rbp-32]
push rax
mov rax, [code_len]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-32]
push rax
mov rax, [code]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 32
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
mov rax, [rbp-32]
push rax
mov rax, [code]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 10
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_9
push 1
pop rax
add [rbp-32], rax
jmp .L_WHILE_9
.L_ENDWHILE_9:
mov rax, [rbp-32]
push rax
mov rax, [code]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 10
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_10_ELIF_0
push 1
pop rax
add [line_cnt], rax
.L_IF_10_ELIF_0:
.L_ENDIF_10:
.L_ENDIF_7:
push 0
mov rax, [rbp-32]
push rax
mov rax, [code]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
mov rax, [rbp-40]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
mov rax, [line_cnt]
push rax
mov rax, [rbp-16]
push rax
mov rax, [tokens_line_number]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [rbp-16], rax
push 1
pop rax
add [rbp-32], rax
jmp .L_WHILE_6
.L_ENDWHILE_6:
mov rax, [rbp-16]
push rax
jmp .L_RET_FN_get_tokens
.L_RET_FN_get_tokens:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_get_tokens:
find_name:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 16
mov rax, [rbp-8]
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_11_ELIF_0
push -1
jmp .L_RET_FN_find_name
.L_IF_11_ELIF_0:
.L_ENDIF_11:
push 0
pop rax
mov [rbp-40], rax
.L_WHILE_12:
mov rax, [rbp-40]
push rax
mov rax, [rbp-16]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_12
mov rax, [rbp-40]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
test rax, rax
jz .L_IF_13_ELIF_0
mov rax, [rbp-40]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
mov rax, [rbp-24]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_14_ELIF_0
mov rax, [rbp-40]
push rax
jmp .L_RET_FN_find_name
.L_IF_14_ELIF_0:
.L_ENDIF_14:
.L_IF_13_ELIF_0:
.L_ENDIF_13:
push 1
pop rax
add [rbp-40], rax
jmp .L_WHILE_12
.L_ENDWHILE_12:
push -1
jmp .L_RET_FN_find_name
.L_RET_FN_find_name:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_find_name:
debug_find_name:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 16
mov rax, [rbp-8]
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_15_ELIF_0
lea rax, [str_78]
push rax
pop rdi
call errs
push -1
jmp .L_RET_FN_debug_find_name
.L_IF_15_ELIF_0:
.L_ENDIF_15:
push 0
pop rax
mov [rbp-40], rax
.L_WHILE_16:
mov rax, [rbp-40]
push rax
mov rax, [rbp-16]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_16
mov rax, [rbp-40]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
test rax, rax
jz .L_IF_17_ELIF_0
lea rax, [str_79]
push rax
pop rdi
call errs
mov rax, [rbp-40]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call errs
lea rax, [str_80]
push rax
pop rdi
call errs
mov rax, [rbp-24]
push rax
pop rdi
call errs
mov rax, [rbp-40]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
mov rax, [rbp-24]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_18_ELIF_0
lea rax, [str_81]
push rax
pop rdi
call errs
mov rax, [rbp-40]
push rax
jmp .L_RET_FN_debug_find_name
.L_IF_18_ELIF_0:
.L_ENDIF_18:
lea rax, [str_82]
push rax
pop rdi
call errs
.L_IF_17_ELIF_0:
.L_ENDIF_17:
push 1
pop rax
add [rbp-40], rax
jmp .L_WHILE_16
.L_ENDWHILE_16:
lea rax, [str_83]
push rax
pop rdi
call errs
push -1
jmp .L_RET_FN_debug_find_name
.L_RET_FN_debug_find_name:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_debug_find_name:
prescan_fn_args:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 8
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
lea rax, [str_84]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_19_ELIF_0
push 1
pop rax
add [rbp-24], rax
push 0
pop rax
mov [cur_func_input_count], rax
.L_WHILE_20:
mov rax, [rbp-24]
push rax
mov rax, [rbp-16]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
lea rax, [str_85]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_20
mov rax, [rbp-32]
push rax
pop rax
test rax, rax
jz .L_IF_21_ELIF_0
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
mov rax, [local_variables_cnt]
push rax
mov rax, [local_variables]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [local_variables_cnt], rax
.L_IF_21_ELIF_0:
.L_ENDIF_21:
push 1
pop rax
add [cur_func_input_count], rax
push 1
pop rax
add [rbp-24], rax
jmp .L_WHILE_20
.L_ENDWHILE_20:
lea rax, [str_86]
push rax
pop rdi
call errs
mov rax, [cur_func_input_count]
push rax
pop rdi
call erri
mov rax, [cur_func_input_count]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [rbp-24], rax
push 0
pop rax
mov [cur_func_output_count], rax
.L_WHILE_22:
mov rax, [rbp-24]
push rax
mov rax, [rbp-16]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
lea rax, [str_87]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_22
mov rax, [rbp-32]
push rax
pop rax
test rax, rax
jz .L_IF_23_ELIF_0
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
mov rax, [local_variables_cnt]
push rax
mov rax, [local_variables]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [local_variables_cnt], rax
.L_IF_23_ELIF_0:
.L_ENDIF_23:
push 1
pop rax
add [cur_func_output_count], rax
push 1
pop rax
add [rbp-24], rax
jmp .L_WHILE_22
.L_ENDWHILE_22:
lea rax, [str_88]
push rax
pop rdi
call errs
mov rax, [cur_func_output_count]
push rax
pop rdi
call erri
call errnl
mov rax, [cur_func_output_count]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
mov rax, [rbp-32]
push rax
pop rax
test rax, rax
jz .L_IF_24_ELIF_0
mov rax, [cur_func_input_count]
push rax
mov rax, [cur_func_output_count]
push rax
pop rbx
pop rax
add rax, rbx
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
.L_IF_24_ELIF_0:
.L_ENDIF_24:
.L_IF_19_ELIF_0:
.L_ENDIF_19:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_prescan_fn_args
.L_RET_FN_prescan_fn_args:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_prescan_fn_args:
prescan_string:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 16
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
mov rax, [strings]
push rax
mov rax, [str_cnt]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
push -1
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_25_ELIF_0
mov rax, [rbp-40]
push rax
mov rax, [str_cnt]
push rax
mov rax, [strings]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [str_cnt], rax
.L_IF_25_ELIF_0:
.L_ENDIF_25:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_prescan_string
.L_RET_FN_prescan_string:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_prescan_string:
str2int:
push rbp
mov rbp, rsp
push rdi
sub rsp, 24
push 0
pop rax
mov [rbp-32], rax
push 0
pop rax
mov [rbp-16], rax
.L_WHILE_26:
mov rax, [rbp-32]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-24], rax
push 0
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_26
mov rax, [rbp-24]
push rax
push 48
pop rbx
pop rax
sub rax, rbx
push rax
mov rax, [rbp-16]
push rax
push 10
pop rbx
pop rax
imul rax, rbx
push rax
pop rbx
pop rax
add rax, rbx
push rax
pop rax
mov [rbp-16], rax
push 1
pop rax
add [rbp-32], rax
jmp .L_WHILE_26
.L_ENDWHILE_26:
mov rax, [rbp-16]
push rax
jmp .L_RET_FN_str2int
.L_RET_FN_str2int:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_str2int:
prescan_alloc_cell:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 16
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call str2int
push rax
pop rax
mov [rbp-40], rax
mov rax, [rbp-40]
push rax
pop rax
test rax, rax
jz .L_IF_27_ELIF_0
mov rax, [rbp-40]
push rax
mov rax, [alloc_cnt]
push rax
mov rax, [alloc_cells]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [alloc_cnt], rax
.L_IF_27_ELIF_0:
.L_ENDIF_27:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_prescan_alloc_cell
.L_RET_FN_prescan_alloc_cell:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_prescan_alloc_cell:
prescan_extern_fn:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 16
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
lea rax, [str_89]
push rax
pop rdi
call errs
mov rax, [rbp-40]
push rax
pop rdi
call errs
lea rax, [str_90]
push rax
pop rdi
call errs
mov rax, [rbp-40]
push rax
pop rax
test rax, rax
jz .L_IF_28_ELIF_0
lea rax, [str_91]
push rax
pop rdi
call errs
mov rax, [rbp-40]
push rax
pop rdi
call errs
call errnl
mov rax, [funcs]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
push -1
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_29_ELIF_0
mov rax, [rbp-40]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_92]
push rax
pop rdi
call errs
mov rax, [rbp-40]
push rax
pop rdi
call errs
lea rax, [str_93]
push rax
pop rdi
call errs
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-24]
push rax
push 0
pop rcx
pop rdx
pop rsi
pop rdi
call prescan_fn_args
push rax
pop rax
mov [rbp-24], rax
push 1
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [funcs_cnt], rax
jmp .L_ENDIF_29
.L_IF_29_ELIF_0:
mov rax, [rbp-40]
push rax
pop rdi
call errs
lea rax, [str_94]
push rax
pop rdi
call errs
.L_ENDIF_29:
.L_IF_28_ELIF_0:
.L_ENDIF_28:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_prescan_extern_fn
.L_RET_FN_prescan_extern_fn:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_prescan_extern_fn:
prescan_fn:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 16
mov rax, [rbp-24]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_token_start]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-32]
push rax
pop rax
test rax, rax
jz .L_IF_30_ELIF_0
mov rax, [rbp-24]
push rax
mov rax, [tokens_line_number]
push rax
pop rdi
call erri
lea rax, [str_95]
push rax
pop rdi
call errs
push 1
pop rdi
mov rax, 60
syscall
.L_IF_30_ELIF_0:
.L_ENDIF_30:
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-32], rax
lea rax, [str_89]
push rax
pop rdi
call errs
mov rax, [rbp-32]
push rax
pop rdi
call errs
lea rax, [str_90]
push rax
pop rdi
call errs
mov rax, [rbp-32]
push rax
pop rax
test rax, rax
jz .L_IF_31_ELIF_0
lea rax, [str_91]
push rax
pop rdi
call errs
mov rax, [rbp-32]
push rax
pop rdi
call errs
call errnl
mov rax, [funcs]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [rbp-32]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
push -1
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_32_ELIF_0
mov rax, [rbp-32]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
lea rax, [str_92]
push rax
pop rdi
call errs
mov rax, [rbp-32]
push rax
pop rdi
call errs
lea rax, [str_93]
push rax
pop rdi
call errs
mov rax, [local_variables]
push rax
mov rax, [local_variables_cnt]
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rbx
pop rax
add rax, rbx
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_variable_start]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 0
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-24]
push rax
push 1
pop rcx
pop rdx
pop rsi
pop rdi
call prescan_fn_args
push rax
pop rax
mov [rbp-24], rax
push 0
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
jmp .L_ENDIF_32
.L_IF_32_ELIF_0:
mov rax, [rbp-32]
push rax
pop rdi
call errs
lea rax, [str_94]
push rax
pop rdi
call errs
push 1
pop rdi
mov rax, 60
syscall
.L_ENDIF_32:
.L_IF_31_ELIF_0:
.L_ENDIF_31:
mov rax, [rbp-24]
push rax
mov rax, [rbp-32]
push rax
jmp .L_RET_FN_prescan_fn
.L_RET_FN_prescan_fn:
pop rdx
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_prescan_fn:
prescan_assignment:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 16
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
mov rax, [rbp-48]
push rax
pop rax
test rax, rax
jz .L_IF_33_ELIF_0
mov rax, [rbp-32]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_variable_start]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
mov rax, [rbp-48]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_34_ELIF_0
lea rax, [str_96]
push rax
pop rdi
call errs
mov rax, [rbp-48]
push rax
pop rdi
call errs
call errnl
jmp .L_ENDIF_34
.L_IF_34_ELIF_0:
mov rax, [variables]
push rax
mov rax, [variables_cnt]
push rax
mov rax, [rbp-48]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
push -1
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_35_ELIF_0
mov rax, [rbp-48]
push rax
mov rax, [variables_cnt]
push rax
mov rax, [variables]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [variables_cnt], rax
.L_IF_35_ELIF_0:
.L_ENDIF_35:
.L_ENDIF_34:
.L_IF_33_ELIF_0:
.L_ENDIF_33:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_prescan_assignment
.L_RET_FN_prescan_assignment:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_prescan_assignment:
prescan_local:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 24
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-56], rax
mov rax, [rbp-32]
push rax
pop rax
test rax, rax
jz .L_IF_36_ELIF_0
mov rax, [rbp-48]
push rax
mov rax, [local_variables_cnt]
push rax
mov rax, [local_variables]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [local_variables_cnt], rax
push 1
pop rax
add [rbp-56], rax
.L_IF_36_ELIF_0:
.L_ENDIF_36:
mov rax, [rbp-56]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_prescan_local
.L_RET_FN_prescan_local:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_prescan_local:
prescan_struct:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 32
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-40]
push rax
mov rax, [structs_cnt]
push rax
mov rax, [structs]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
mov rax, [fields]
push rax
mov rax, [fields_cnt]
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rbx
pop rax
add rax, rbx
push rax
mov rax, [structs_cnt]
push rax
mov rax, [structs_field_start]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 0
pop rax
mov [rbp-56], rax
.L_WHILE_37:
mov rax, [rbp-24]
push rax
mov rax, [rbp-16]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-48], rax
lea rax, [str_97]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_37
mov rax, [rbp-48]
push rax
mov rax, [fields_cnt]
push rax
mov rax, [fields]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [fields_cnt], rax
push 1
pop rax
add [rbp-56], rax
push 1
pop rax
add [rbp-24], rax
jmp .L_WHILE_37
.L_ENDWHILE_37:
mov rax, [rbp-56]
push rax
mov rax, [structs_cnt]
push rax
mov rax, [structs_field_cnt]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [structs_cnt], rax
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_prescan_struct
.L_RET_FN_prescan_struct:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_prescan_struct:
prescan_new:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 24
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
mov rax, [structs]
push rax
mov rax, [structs_cnt]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-48], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_38_ELIF_0
mov rax, [rbp-48]
push rax
mov rax, [structs_field_cnt]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
mov rax, [alloc_cnt]
push rax
mov rax, [alloc_cells]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [alloc_cnt], rax
jmp .L_ENDIF_38
.L_IF_38_ELIF_0:
mov rax, [rbp-24]
push rax
mov rax, [tokens_line_number]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call erri
lea rax, [str_98]
push rax
pop rdi
call errs
mov rax, [rbp-40]
push rax
pop rdi
call errs
lea rax, [str_99]
push rax
pop rdi
call errs
push 1
pop rdi
mov rax, 60
syscall
.L_ENDIF_38:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_prescan_new
.L_RET_FN_prescan_new:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_prescan_new:
prescan:
push rbp
mov rbp, rsp
push rdi
push rsi
sub rsp, 24
lea rax, [str_100]
push rax
pop rdi
call errs
push 0
pop rax
mov [rbp-24], rax
push 0
pop rax
mov [rbp-32], rax
.L_WHILE_39:
mov rax, [rbp-32]
push rax
mov rax, [rbp-16]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_39
mov rax, [rbp-32]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
push 0
mov rax, [rbp-40]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 34
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_40_ELIF_0
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-32]
push rax
pop rdx
pop rsi
pop rdi
call prescan_string
push rax
pop rax
mov [rbp-32], rax
jmp .L_ENDIF_40
.L_IF_40_ELIF_0:
mov rax, [rbp-40]
push rax
lea rax, [str_101]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_40_ELIF_1
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-32]
push rax
pop rdx
pop rsi
pop rdi
call prescan_alloc_cell
push rax
pop rax
mov [rbp-32], rax
jmp .L_ENDIF_40
.L_IF_40_ELIF_1:
mov rax, [rbp-40]
push rax
lea rax, [str_102]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_40_ELIF_2
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-32]
push rax
pop rdx
pop rsi
pop rdi
call prescan_extern_fn
push rax
pop rax
mov [rbp-32], rax
jmp .L_ENDIF_40
.L_IF_40_ELIF_2:
mov rax, [rbp-40]
push rax
lea rax, [str_103]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_40_ELIF_3
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-32]
push rax
mov rax, [rbp-24]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call prescan_fn
push rdx
push rax
pop rax
mov [rbp-32], rax
pop rax
mov [rbp-24], rax
jmp .L_ENDIF_40
.L_IF_40_ELIF_3:
mov rax, [rbp-40]
push rax
lea rax, [str_104]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_40_ELIF_4
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-32]
push rax
mov rax, [rbp-24]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call prescan_assignment
push rax
pop rax
mov [rbp-32], rax
jmp .L_ENDIF_40
.L_IF_40_ELIF_4:
mov rax, [rbp-40]
push rax
lea rax, [str_105]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_40_ELIF_5
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-32]
push rax
mov rax, [rbp-24]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call prescan_local
push rax
pop rax
mov [rbp-32], rax
jmp .L_ENDIF_40
.L_IF_40_ELIF_5:
mov rax, [rbp-40]
push rax
lea rax, [str_106]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_40_ELIF_6
mov rax, [rbp-32]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [funcs_token_end]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [funcs_cnt], rax
push 0
pop rax
mov [rbp-24], rax
jmp .L_ENDIF_40
.L_IF_40_ELIF_6:
mov rax, [rbp-40]
push rax
lea rax, [str_107]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_40_ELIF_7
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-32]
push rax
pop rdx
pop rsi
pop rdi
call prescan_struct
push rax
pop rax
mov [rbp-32], rax
jmp .L_ENDIF_40
.L_IF_40_ELIF_7:
mov rax, [rbp-40]
push rax
lea rax, [str_108]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_40_ELIF_8
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-32]
push rax
pop rdx
pop rsi
pop rdi
call prescan_new
push rax
pop rax
mov [rbp-32], rax
.L_IF_40_ELIF_8:
.L_ENDIF_40:
push 1
pop rax
add [rbp-32], rax
jmp .L_WHILE_39
.L_ENDWHILE_39:
lea rax, [str_109]
push rax
pop rdi
call errs
.L_RET_FN_prescan:
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_prescan:
debug_print_struct:
push rbp
mov rbp, rsp
sub rsp, 16
push 0
pop rax
mov [rbp-8], rax
mov rax, [fields_cnt]
push rax
pop rdi
call erri
call errnl
.L_WHILE_41:
mov rax, [rbp-8]
push rax
mov rax, [fields_cnt]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_41
mov rax, [rbp-8]
push rax
mov rax, [fields]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call errs
call errnl
push 1
pop rax
add [rbp-8], rax
jmp .L_WHILE_41
.L_ENDWHILE_41:
push 0
pop rax
mov [rbp-8], rax
.L_WHILE_42:
mov rax, [rbp-8]
push rax
mov rax, [structs_cnt]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_42
mov rax, [rbp-8]
push rax
mov rax, [structs]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call errs
lea rax, [str_115]
push rax
pop rdi
call errs
mov rax, [rbp-8]
push rax
mov rax, [structs_field_cnt]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call erri
call errnl
push 0
pop rax
mov [rbp-16], rax
.L_WHILE_43:
mov rax, [rbp-16]
push rax
mov rax, [rbp-8]
push rax
mov rax, [structs_field_cnt]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_43
mov rax, [rbp-16]
push rax
mov rax, [rbp-8]
push rax
mov rax, [structs_field_start]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call errs
call errnl
push 1
pop rax
add [rbp-16], rax
jmp .L_WHILE_43
.L_ENDWHILE_43:
push 1
pop rax
add [rbp-8], rax
jmp .L_WHILE_42
.L_ENDWHILE_42:
.L_RET_FN_debug_print_struct:
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_debug_print_struct:
declare_fn:
push rbp
mov rbp, rsp
sub rsp, 8
push 0
pop rax
mov [rbp-8], rax
.L_WHILE_44:
mov rax, [rbp-8]
push rax
mov rax, [funcs_cnt]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_44
mov rax, [rbp-8]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
test rax, rax
jz .L_IF_45_ELIF_0
lea rax, [str_116]
push rax
pop rdi
call prints
jmp .L_ENDIF_45
.L_IF_45_ELIF_0:
lea rax, [str_117]
push rax
pop rdi
call prints
.L_ENDIF_45:
mov rax, [rbp-8]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call prints
call nl
push 1
pop rax
add [rbp-8], rax
jmp .L_WHILE_44
.L_ENDWHILE_44:
.L_RET_FN_declare_fn:
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_declare_fn:
declare_strings:
push rbp
mov rbp, rsp
sub rsp, 8
push 0
pop rax
mov [rbp-8], rax
.L_WHILE_46:
mov rax, [rbp-8]
push rax
mov rax, [str_cnt]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_46
mov rax, [rbp-8]
push rax
mov rax, [strings]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [raw_str], rax
push 96
push 0
mov rax, [raw_str]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
lea rax, [str_118]
push rax
pop rdi
call prints
mov rax, [rbp-8]
push rax
pop rdi
call printi
lea rax, [str_119]
push rax
pop rdi
call prints
mov rax, [raw_str]
push rax
pop rdi
call prints
lea rax, [str_120]
push rax
pop rdi
call prints
push 34
push 0
mov rax, [raw_str]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx], al
push 1
pop rax
add [rbp-8], rax
jmp .L_WHILE_46
.L_ENDWHILE_46:
.L_RET_FN_declare_strings:
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_declare_strings:
declare_alloc_cells:
push rbp
mov rbp, rsp
sub rsp, 8
push 0
pop rax
mov [rbp-8], rax
.L_WHILE_47:
mov rax, [rbp-8]
push rax
mov rax, [alloc_cnt]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_47
lea rax, [str_121]
push rax
pop rdi
call prints
mov rax, [rbp-8]
push rax
pop rdi
call printi
lea rax, [str_122]
push rax
pop rdi
call prints
mov rax, [rbp-8]
push rax
mov rax, [alloc_cells]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call printi
call nl
push 1
pop rax
add [rbp-8], rax
jmp .L_WHILE_47
.L_ENDWHILE_47:
.L_RET_FN_declare_alloc_cells:
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_declare_alloc_cells:
declare_variables:
push rbp
mov rbp, rsp
sub rsp, 8
push 0
pop rax
mov [rbp-8], rax
.L_WHILE_48:
mov rax, [rbp-8]
push rax
mov rax, [variables_cnt]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_48
mov rax, [rbp-8]
push rax
mov rax, [variables]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call prints
lea rax, [str_123]
push rax
pop rdi
call prints
push 1
pop rax
add [rbp-8], rax
jmp .L_WHILE_48
.L_ENDWHILE_48:
.L_RET_FN_declare_variables:
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_declare_variables:
emit_head:
push rbp
mov rbp, rsp
lea rax, [str_124]
push rax
pop rdi
call prints
call declare_fn
lea rax, [str_125]
push rax
pop rdi
call prints
lea rax, [str_126]
push rax
pop rdi
call prints
call declare_strings
lea rax, [str_127]
push rax
pop rdi
call prints
call declare_alloc_cells
call declare_variables
lea rax, [str_128]
push rax
pop rdi
call prints
lea rax, [str_129]
push rax
pop rdi
call prints
lea rax, [str_130]
push rax
pop rdi
call prints
lea rax, [str_131]
push rax
pop rdi
call prints
lea rax, [str_132]
push rax
pop rdi
call prints
lea rax, [str_133]
push rax
pop rdi
call prints
lea rax, [str_134]
push rax
pop rdi
call prints
.L_RET_FN_emit_head:
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_emit_head:
is_valid_integer:
push rbp
mov rbp, rsp
push rdi
sub rsp, 24
push 0
mov rax, [rbp-8]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 0
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_49_ELIF_0
push 0
jmp .L_RET_FN_is_valid_integer
.L_IF_49_ELIF_0:
.L_ENDIF_49:
push 0
pop rax
mov [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-32], rax
mov rax, [rbp-32]
push rax
push 43
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
mov rax, [rbp-32]
push rax
push 45
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
or al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_50_ELIF_0
push 1
pop rax
add [rbp-24], rax
.L_IF_50_ELIF_0:
.L_ENDIF_50:
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 0
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_51_ELIF_0
push 0
jmp .L_RET_FN_is_valid_integer
.L_IF_51_ELIF_0:
.L_ENDIF_51:
.L_WHILE_52:
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-32], rax
pop rax
test rax, rax
jz .L_ENDWHILE_52
mov rax, [rbp-32]
push rax
push 48
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-32]
push rax
push 57
pop rbx
pop rax
cmp rax, rbx
setg al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
or al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_53_ELIF_0
push 0
jmp .L_RET_FN_is_valid_integer
.L_IF_53_ELIF_0:
.L_ENDIF_53:
push 1
pop rax
add [rbp-24], rax
jmp .L_WHILE_52
.L_ENDWHILE_52:
push 1
jmp .L_RET_FN_is_valid_integer
.L_RET_FN_is_valid_integer:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_is_valid_integer:
parse_and_emit_integer:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 16
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
lea rax, [str_135]
push rax
pop rdi
call prints
mov rax, [rbp-40]
push rax
pop rdi
call prints
call nl
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_integer
.L_RET_FN_parse_and_emit_integer:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_integer:
parse_and_emit_string:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 24
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
push 0
pop rax
mov [rbp-48], rax
.L_WHILE_54:
mov rax, [rbp-48]
push rax
mov rax, [strings]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
mov rax, [rbp-40]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_54
push 1
pop rax
add [rbp-48], rax
jmp .L_WHILE_54
.L_ENDWHILE_54:
lea rax, [str_136]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call printi
lea rax, [str_137]
push rax
pop rdi
call prints
lea rax, [str_138]
push rax
pop rdi
call prints
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_string
.L_RET_FN_parse_and_emit_string:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_string:
parse_and_emit_if:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 16
mov rax, [label_cnt]
push rax
pop rax
mov [rbp-40], rax
push 1
pop rax
add [label_cnt], rax
mov rax, [rbp-40]
push rax
mov rax, [if_stack_top]
push rax
mov rax, [if_stack]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 0
mov rax, [if_stack_top]
push rax
mov rax, [elif_stack]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [if_stack_top], rax
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_if
.L_RET_FN_parse_and_emit_if:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_if:
parse_and_emit_elif:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 24
mov rax, [if_stack_top]
push rax
push 1
pop rbx
pop rax
sub rax, rbx
push rax
mov rax, [if_stack]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
mov rax, [if_stack_top]
push rax
push 1
pop rbx
pop rax
sub rax, rbx
push rax
mov rax, [elif_stack]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
lea rax, [str_139]
push rax
pop rdi
call prints
mov rax, [rbp-40]
push rax
pop rdi
call printi
call nl
lea rax, [str_140]
push rax
pop rdi
call prints
mov rax, [rbp-40]
push rax
pop rdi
call printi
lea rax, [str_141]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call printi
lea rax, [str_142]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
mov rax, [if_stack_top]
push rax
push 1
pop rbx
pop rax
sub rax, rbx
push rax
mov rax, [elif_stack]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_elif
.L_RET_FN_parse_and_emit_elif:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_elif:
parse_and_emit_then:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 24
mov rax, [if_stack_top]
push rax
push 1
pop rbx
pop rax
sub rax, rbx
push rax
mov rax, [if_stack]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
mov rax, [if_stack_top]
push rax
push 1
pop rbx
pop rax
sub rax, rbx
push rax
mov rax, [elif_stack]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
lea rax, [str_143]
push rax
pop rdi
call prints
lea rax, [str_144]
push rax
pop rdi
call prints
mov rax, [rbp-40]
push rax
pop rdi
call printi
lea rax, [str_141]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call printi
call nl
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_then
.L_RET_FN_parse_and_emit_then:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_then:
parse_and_emit_else:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 40
mov rax, [if_stack_top]
push rax
push 1
pop rbx
pop rax
sub rax, rbx
push rax
mov rax, [if_stack]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
mov rax, [if_stack_top]
push rax
push 1
pop rbx
pop rax
sub rax, rbx
push rax
mov rax, [elif_stack]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
push 0
pop rax
mov [rbp-56], rax
push 0
pop rax
mov [rbp-64], rax
.L_WHILE_55:
mov rax, [rbp-56]
push rax
mov rax, [has_else_cnt]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-64]
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_55
mov rax, [rbp-56]
push rax
mov rax, [has_else]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
mov rax, [rbp-40]
push rax
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_56_ELIF_0
push 1
pop rax
mov [rbp-64], rax
.L_IF_56_ELIF_0:
.L_ENDIF_56:
push 1
pop rax
add [rbp-56], rax
jmp .L_WHILE_55
.L_ENDWHILE_55:
mov rax, [rbp-64]
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_57_ELIF_0
mov rax, [rbp-40]
push rax
mov rax, [has_else_cnt]
push rax
mov rax, [has_else]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [has_else_cnt], rax
.L_IF_57_ELIF_0:
.L_ENDIF_57:
lea rax, [str_139]
push rax
pop rdi
call prints
mov rax, [rbp-40]
push rax
pop rdi
call printi
call nl
lea rax, [str_140]
push rax
pop rdi
call prints
mov rax, [rbp-40]
push rax
pop rdi
call printi
lea rax, [str_141]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call printi
lea rax, [str_142]
push rax
pop rdi
call prints
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_else
.L_RET_FN_parse_and_emit_else:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_else:
parse_and_emit_endif:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 40
push 1
pop rax
sub [if_stack_top], rax
mov rax, [if_stack_top]
push rax
mov rax, [if_stack]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
mov rax, [if_stack_top]
push rax
mov rax, [elif_stack]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
push 0
pop rax
mov [rbp-56], rax
push 0
pop rax
mov [rbp-64], rax
.L_WHILE_58:
mov rax, [rbp-56]
push rax
mov rax, [has_else_cnt]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-64]
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_58
mov rax, [rbp-56]
push rax
mov rax, [has_else]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
mov rax, [rbp-40]
push rax
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_59_ELIF_0
push 1
pop rax
mov [rbp-64], rax
.L_IF_59_ELIF_0:
.L_ENDIF_59:
push 1
pop rax
add [rbp-56], rax
jmp .L_WHILE_58
.L_ENDWHILE_58:
mov rax, [rbp-64]
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_60_ELIF_0
lea rax, [str_140]
push rax
pop rdi
call prints
mov rax, [rbp-40]
push rax
pop rdi
call printi
lea rax, [str_141]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call printi
lea rax, [str_142]
push rax
pop rdi
call prints
.L_IF_60_ELIF_0:
.L_ENDIF_60:
lea rax, [str_145]
push rax
pop rdi
call prints
mov rax, [rbp-40]
push rax
pop rdi
call printi
lea rax, [str_142]
push rax
pop rdi
call prints
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_endif
.L_RET_FN_parse_and_emit_endif:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_endif:
parse_and_emit_while:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 16
mov rax, [label_cnt]
push rax
pop rax
mov [rbp-40], rax
push 1
pop rax
add [label_cnt], rax
mov rax, [rbp-40]
push rax
mov rax, [while_stack_top]
push rax
mov rax, [while_stack]
push rax
pop rbx
pop rcx
pop rax
mov [rbx + rcx * 8], rax
push 1
pop rax
add [while_stack_top], rax
lea rax, [str_146]
push rax
pop rdi
call prints
mov rax, [rbp-40]
push rax
pop rdi
call printi
lea rax, [str_142]
push rax
pop rdi
call prints
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_while
.L_RET_FN_parse_and_emit_while:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_while:
parse_and_emit_do:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 16
mov rax, [while_stack_top]
push rax
push 1
pop rbx
pop rax
sub rax, rbx
push rax
mov rax, [while_stack]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
lea rax, [str_143]
push rax
pop rdi
call prints
lea rax, [str_147]
push rax
pop rdi
call prints
mov rax, [rbp-40]
push rax
pop rdi
call printi
call nl
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_do
.L_RET_FN_parse_and_emit_do:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_do:
parse_and_emit_endwhile:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 16
push 1
pop rax
sub [while_stack_top], rax
mov rax, [while_stack_top]
push rax
mov rax, [while_stack]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
lea rax, [str_148]
push rax
pop rdi
call prints
mov rax, [rbp-40]
push rax
pop rdi
call printi
call nl
lea rax, [str_149]
push rax
pop rdi
call prints
mov rax, [rbp-40]
push rax
pop rdi
call printi
lea rax, [str_142]
push rax
pop rdi
call prints
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_endwhile
.L_RET_FN_parse_and_emit_endwhile:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_endwhile:
parse_and_emit_assignment:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 40
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
lea rax, [str_71]
push rax
pop rdi
call prints
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_start]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-64], rax
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-72], rax
mov rax, [rbp-32]
push rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
mov rax, [rbp-64]
push rax
mov rax, [rbp-72]
push rax
mov rax, [rbp-48]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-56], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_61_ELIF_0
lea rax, [str_150]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
lea rax, [str_151]
push rax
pop rdi
call prints
jmp .L_ENDIF_61
.L_IF_61_ELIF_0:
lea rax, [str_152]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
lea rax, [str_151]
push rax
pop rdi
call prints
.L_ENDIF_61:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_assignment
.L_RET_FN_parse_and_emit_assignment:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_assignment:
parse_and_emit_add_and_assign:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 40
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
lea rax, [str_71]
push rax
pop rdi
call prints
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_start]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-64], rax
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-72], rax
mov rax, [rbp-32]
push rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
mov rax, [rbp-64]
push rax
mov rax, [rbp-72]
push rax
mov rax, [rbp-48]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-56], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_62_ELIF_0
lea rax, [str_153]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
lea rax, [str_151]
push rax
pop rdi
call prints
jmp .L_ENDIF_62
.L_IF_62_ELIF_0:
lea rax, [str_154]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
lea rax, [str_151]
push rax
pop rdi
call prints
.L_ENDIF_62:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_add_and_assign
.L_RET_FN_parse_and_emit_add_and_assign:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_add_and_assign:
parse_and_emit_sub_and_assign:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 40
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
lea rax, [str_71]
push rax
pop rdi
call prints
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_start]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-64], rax
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-72], rax
mov rax, [rbp-32]
push rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
mov rax, [rbp-64]
push rax
mov rax, [rbp-72]
push rax
mov rax, [rbp-48]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-56], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_63_ELIF_0
lea rax, [str_155]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
lea rax, [str_151]
push rax
pop rdi
call prints
jmp .L_ENDIF_63
.L_IF_63_ELIF_0:
lea rax, [str_156]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
lea rax, [str_151]
push rax
pop rdi
call prints
.L_ENDIF_63:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_sub_and_assign
.L_RET_FN_parse_and_emit_sub_and_assign:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_sub_and_assign:
parse_and_emit_mul_and_assign:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 40
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
lea rax, [str_71]
push rax
pop rdi
call prints
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_start]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-64], rax
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-72], rax
mov rax, [rbp-32]
push rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
mov rax, [rbp-64]
push rax
mov rax, [rbp-72]
push rax
mov rax, [rbp-48]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-56], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_64_ELIF_0
lea rax, [str_157]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
lea rax, [str_137]
push rax
pop rdi
call prints
lea rax, [str_150]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
lea rax, [str_151]
push rax
pop rdi
call prints
jmp .L_ENDIF_64
.L_IF_64_ELIF_0:
lea rax, [str_158]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
lea rax, [str_137]
push rax
pop rdi
call prints
lea rax, [str_152]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
lea rax, [str_151]
push rax
pop rdi
call prints
.L_ENDIF_64:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_mul_and_assign
.L_RET_FN_parse_and_emit_mul_and_assign:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_mul_and_assign:
parse_and_emit_div_and_assign:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 40
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
lea rax, [str_159]
push rax
pop rdi
call prints
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_start]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-64], rax
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-72], rax
mov rax, [rbp-32]
push rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
mov rax, [rbp-64]
push rax
mov rax, [rbp-72]
push rax
mov rax, [rbp-48]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-56], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_65_ELIF_0
lea rax, [str_160]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
lea rax, [str_137]
push rax
pop rdi
call prints
lea rax, [str_161]
push rax
pop rdi
call prints
lea rax, [str_150]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
lea rax, [str_151]
push rax
pop rdi
call prints
jmp .L_ENDIF_65
.L_IF_65_ELIF_0:
lea rax, [str_162]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
lea rax, [str_137]
push rax
pop rdi
call prints
lea rax, [str_161]
push rax
pop rdi
call prints
lea rax, [str_152]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
lea rax, [str_151]
push rax
pop rdi
call prints
.L_ENDIF_65:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_div_and_assign
.L_RET_FN_parse_and_emit_div_and_assign:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_div_and_assign:
parse_and_emit_mod_and_assign:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 40
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
lea rax, [str_159]
push rax
pop rdi
call prints
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_start]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-64], rax
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-72], rax
mov rax, [rbp-32]
push rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
mov rax, [rbp-64]
push rax
mov rax, [rbp-72]
push rax
mov rax, [rbp-48]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-56], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_66_ELIF_0
lea rax, [str_160]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
lea rax, [str_137]
push rax
pop rdi
call prints
lea rax, [str_161]
push rax
pop rdi
call prints
lea rax, [str_150]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
lea rax, [str_163]
push rax
pop rdi
call prints
jmp .L_ENDIF_66
.L_IF_66_ELIF_0:
lea rax, [str_162]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
lea rax, [str_137]
push rax
pop rdi
call prints
lea rax, [str_161]
push rax
pop rdi
call prints
lea rax, [str_152]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
lea rax, [str_163]
push rax
pop rdi
call prints
.L_ENDIF_66:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_mod_and_assign
.L_RET_FN_parse_and_emit_mod_and_assign:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_mod_and_assign:
parse_and_emit_alloc:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 16
lea rax, [str_164]
push rax
pop rdi
call prints
mov rax, [rbp-32]
push rax
pop rdi
call printi
lea rax, [str_137]
push rax
pop rdi
call prints
lea rax, [str_138]
push rax
pop rdi
call prints
push 1
pop rax
add [rbp-32], rax
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-32]
push rax
jmp .L_RET_FN_parse_and_emit_alloc
.L_RET_FN_parse_and_emit_alloc:
pop rdx
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_alloc:
parse_and_emit_fn:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 56
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
lea rax, [str_89]
push rax
pop rdi
call errs
mov rax, [rbp-48]
push rax
pop rdi
call errs
lea rax, [str_90]
push rax
pop rdi
call errs
mov rax, [rbp-48]
push rax
pop rax
test rax, rax
jz .L_IF_67_ELIF_0
lea rax, [str_91]
push rax
pop rdi
call errs
mov rax, [rbp-48]
push rax
pop rdi
call errs
call errnl
mov rax, [funcs]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [rbp-48]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
mov [rbp-40], rax
lea rax, [str_165]
push rax
pop rdi
call errs
mov rax, [rbp-40]
push rax
pop rdi
call erri
lea rax, [str_137]
push rax
pop rdi
call errs
mov rax, [rbp-40]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-56], rax
mov rax, [rbp-40]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-64], rax
.L_IF_67_ELIF_0:
.L_ENDIF_67:
mov rax, [rbp-48]
push rax
pop rdi
call prints
lea rax, [str_142]
push rax
pop rdi
call prints
lea rax, [str_166]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
pop rax
test rax, rax
jz .L_IF_68_ELIF_0
push 1
pop rax
mov [rbp-72], rax
.L_WHILE_69:
mov rax, [rbp-72]
push rax
mov rax, [rbp-56]
push rax
pop rbx
pop rax
cmp rax, rbx
setle al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_69
lea rax, [str_135]
push rax
pop rdi
call prints
mov rax, [rbp-72]
push rax
mov rax, [funcs_para_regs]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call prints
call nl
push 1
pop rax
add [rbp-72], rax
jmp .L_WHILE_69
.L_ENDWHILE_69:
.L_IF_68_ELIF_0:
.L_ENDIF_68:
mov rax, [rbp-40]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-80], rax
mov rax, [rbp-56]
push rax
mov rax, [rbp-80]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_70_ELIF_0
lea rax, [str_167]
push rax
pop rdi
call prints
mov rax, [rbp-80]
push rax
mov rax, [rbp-56]
push rax
pop rbx
pop rax
sub rax, rbx
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
call nl
.L_IF_70_ELIF_0:
.L_ENDIF_70:
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
lea rax, [str_84]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_71_ELIF_0
push 1
pop rax
add [rbp-24], rax
.L_WHILE_72:
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
lea rax, [str_87]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_72
push 1
pop rax
add [rbp-24], rax
jmp .L_WHILE_72
.L_ENDWHILE_72:
.L_IF_71_ELIF_0:
.L_ENDIF_71:
mov rax, [rbp-24]
push rax
mov rax, [rbp-40]
push rax
jmp .L_RET_FN_parse_and_emit_fn
.L_RET_FN_parse_and_emit_fn:
pop rdx
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_fn:
parse_and_emit_return:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 16
mov rax, [rbp-32]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
lea rax, [str_168]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
call nl
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_return
.L_RET_FN_parse_and_emit_return:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_return:
parse_and_emit_endfn:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 32
mov rax, [rbp-32]
push rax
mov rax, [funcs]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-56], rax
mov rax, [rbp-32]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-64], rax
lea rax, [str_169]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
pop rdi
call prints
lea rax, [str_142]
push rax
pop rdi
call prints
mov rax, [rbp-64]
push rax
push 1
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_73_ELIF_0
lea rax, [str_71]
push rax
pop rdi
call prints
jmp .L_ENDIF_73
.L_IF_73_ELIF_0:
mov rax, [rbp-64]
push rax
push 2
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_73_ELIF_1
lea rax, [str_170]
push rax
pop rdi
call prints
.L_IF_73_ELIF_1:
.L_ENDIF_73:
lea rax, [str_171]
push rax
pop rdi
call prints
lea rax, [str_172]
push rax
pop rdi
call prints
lea rax, [str_173]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
pop rdi
call prints
lea rax, [str_142]
push rax
pop rdi
call prints
mov rax, [rbp-24]
push rax
push -1
jmp .L_RET_FN_parse_and_emit_endfn
.L_RET_FN_parse_and_emit_endfn:
pop rdx
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_endfn:
parse_and_emit_fn_call:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 40
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
mov rax, [rbp-32]
push rax
mov rax, [funcs_input]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-56], rax
mov rax, [rbp-32]
push rax
mov rax, [funcs_output]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-64], rax
mov rax, [rbp-56]
push rax
pop rax
test rax, rax
jz .L_IF_74_ELIF_0
mov rax, [rbp-56]
push rax
pop rax
mov [rbp-72], rax
.L_WHILE_75:
mov rax, [rbp-72]
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_75
lea rax, [str_174]
push rax
pop rdi
call prints
mov rax, [rbp-72]
push rax
mov rax, [funcs_para_regs]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call prints
call nl
push 1
pop rax
sub [rbp-72], rax
jmp .L_WHILE_75
.L_ENDWHILE_75:
.L_IF_74_ELIF_0:
.L_ENDIF_74:
mov rax, [rbp-32]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
test rax, rax
jz .L_IF_76_ELIF_0
lea rax, [str_175]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
call nl
jmp .L_ENDIF_76
.L_IF_76_ELIF_0:
lea rax, [str_175]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
call nl
.L_ENDIF_76:
mov rax, [rbp-64]
push rax
pop rax
test rax, rax
jz .L_IF_77_ELIF_0
mov rax, [rbp-64]
push rax
pop rax
mov [rbp-72], rax
.L_WHILE_78:
mov rax, [rbp-72]
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_78
lea rax, [str_135]
push rax
pop rdi
call prints
mov rax, [rbp-72]
push rax
mov rax, [funcs_ret_regs]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call prints
call nl
push 1
pop rax
sub [rbp-72], rax
jmp .L_WHILE_78
.L_ENDWHILE_78:
.L_IF_77_ELIF_0:
.L_ENDIF_77:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_fn_call
.L_RET_FN_parse_and_emit_fn_call:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_fn_call:
parse_and_skip_fn:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 8
.L_WHILE_79:
mov rax, [rbp-24]
push rax
mov rax, [rbp-16]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
lea rax, [str_106]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_79
push 1
pop rax
add [rbp-24], rax
jmp .L_WHILE_79
.L_ENDWHILE_79:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_skip_fn
.L_RET_FN_parse_and_skip_fn:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_skip_fn:
parse_and_skip_struct:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 8
.L_WHILE_80:
mov rax, [rbp-24]
push rax
mov rax, [rbp-16]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
lea rax, [str_97]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rbx
pop rax
test rax, rax
setnz al
test rbx, rbx
setnz bl
and al, bl
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_80
push 1
pop rax
add [rbp-24], rax
jmp .L_WHILE_80
.L_ENDWHILE_80:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_skip_struct
.L_RET_FN_parse_and_skip_struct:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_skip_struct:
is_local_variable:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
sub rsp, 40
mov rax, [rbp-32]
push rax
push 0
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_81_ELIF_0
mov rax, [rbp-24]
push rax
push -1
jmp .L_RET_FN_is_local_variable
.L_IF_81_ELIF_0:
.L_ENDIF_81:
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-56], rax
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_start]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-64], rax
mov rax, [rbp-32]
push rax
mov rax, [funcs_variable_cnt]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
mov [rbp-72], rax
mov rax, [rbp-64]
push rax
mov rax, [rbp-72]
push rax
mov rax, [rbp-56]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
mov [rbp-48], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-48]
push rax
jmp .L_RET_FN_is_local_variable
.L_RET_FN_is_local_variable:
pop rdx
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_is_local_variable:
parse_and_emit_dot:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 56
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
mov rax, [structs]
push rax
mov rax, [structs_cnt]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-48], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_82_ELIF_0
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-56], rax
mov rax, [rbp-48]
push rax
mov rax, [structs_field_start]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-72], rax
mov rax, [rbp-48]
push rax
mov rax, [structs_field_cnt]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-80], rax
mov rax, [rbp-72]
push rax
mov rax, [rbp-80]
push rax
mov rax, [rbp-56]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-64], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_83_ELIF_0
lea rax, [str_176]
push rax
pop rdi
call prints
mov rax, [rbp-64]
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
lea rax, [str_177]
push rax
pop rdi
call prints
jmp .L_ENDIF_83
.L_IF_83_ELIF_0:
mov rax, [rbp-24]
push rax
mov rax, [tokens_line_number]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call erri
lea rax, [str_178]
push rax
pop rdi
call errs
mov rax, [rbp-56]
push rax
pop rdi
call errs
lea rax, [str_99]
push rax
pop rdi
call errs
push 1
pop rdi
mov rax, 60
syscall
.L_ENDIF_83:
jmp .L_ENDIF_82
.L_IF_82_ELIF_0:
mov rax, [rbp-24]
push rax
mov rax, [tokens_line_number]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call erri
lea rax, [str_98]
push rax
pop rdi
call errs
mov rax, [rbp-40]
push rax
pop rdi
call errs
lea rax, [str_99]
push rax
pop rdi
call errs
push 1
pop rdi
mov rax, 60
syscall
.L_ENDIF_82:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_dot
.L_RET_FN_parse_and_emit_dot:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_dot:
parse_and_emit_dot_assign:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 56
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
mov rax, [structs]
push rax
mov rax, [structs_cnt]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-48], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_84_ELIF_0
push 1
pop rax
add [rbp-24], rax
mov rax, [rbp-24]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-56], rax
mov rax, [rbp-48]
push rax
mov rax, [structs_field_start]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-72], rax
mov rax, [rbp-48]
push rax
mov rax, [structs_field_cnt]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-80], rax
mov rax, [rbp-72]
push rax
mov rax, [rbp-80]
push rax
mov rax, [rbp-56]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-64], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_85_ELIF_0
lea rax, [str_179]
push rax
pop rdi
call prints
mov rax, [rbp-64]
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
lea rax, [str_151]
push rax
pop rdi
call prints
jmp .L_ENDIF_85
.L_IF_85_ELIF_0:
mov rax, [rbp-24]
push rax
mov rax, [tokens_line_number]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call erri
lea rax, [str_178]
push rax
pop rdi
call errs
mov rax, [rbp-56]
push rax
pop rdi
call errs
lea rax, [str_99]
push rax
pop rdi
call errs
push 1
pop rdi
mov rax, 60
syscall
.L_ENDIF_85:
jmp .L_ENDIF_84
.L_IF_84_ELIF_0:
mov rax, [rbp-24]
push rax
mov rax, [tokens_line_number]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call erri
lea rax, [str_98]
push rax
pop rdi
call errs
mov rax, [rbp-40]
push rax
pop rdi
call errs
lea rax, [str_99]
push rax
pop rdi
call errs
push 1
pop rdi
mov rax, 60
syscall
.L_ENDIF_84:
mov rax, [rbp-24]
push rax
jmp .L_RET_FN_parse_and_emit_dot_assign
.L_RET_FN_parse_and_emit_dot_assign:
pop rax
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_dot_assign:
parse_and_emit:
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
sub rsp, 48
push -1
pop rax
mov [rbp-32], rax
push 0
pop rax
mov [rbp-40], rax
.L_WHILE_86:
mov rax, [rbp-40]
push rax
mov rax, [rbp-16]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_86
mov rax, [rbp-40]
push rax
mov rax, [rbp-8]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-48], rax
mov rax, [rbp-48]
push rax
pop rdi
call is_valid_integer
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_0
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_integer
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_0:
push 0
mov rax, [rbp-48]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 34
pop rbx
pop rax
cmp rax, rbx
sete al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_1
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_string
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_1:
mov rax, [rbp-48]
push rax
lea rax, [str_180]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_2
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_if
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_2:
mov rax, [rbp-48]
push rax
lea rax, [str_181]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_3
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_elif
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_3:
mov rax, [rbp-48]
push rax
lea rax, [str_182]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_4
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_then
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_4:
mov rax, [rbp-48]
push rax
lea rax, [str_183]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_5
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_else
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_5:
mov rax, [rbp-48]
push rax
lea rax, [str_184]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_6
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_endif
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_6:
mov rax, [rbp-48]
push rax
lea rax, [str_185]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_7
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_while
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_7:
mov rax, [rbp-48]
push rax
lea rax, [str_186]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_8
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_do
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_8:
mov rax, [rbp-48]
push rax
lea rax, [str_187]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_9
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_endwhile
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_9:
mov rax, [rbp-48]
push rax
lea rax, [str_104]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_10
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
mov rax, [rbp-32]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call parse_and_emit_assignment
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_10:
mov rax, [rbp-48]
push rax
lea rax, [str_188]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_11
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
mov rax, [rbp-32]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call parse_and_emit_add_and_assign
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_11:
mov rax, [rbp-48]
push rax
lea rax, [str_189]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_12
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
mov rax, [rbp-32]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call parse_and_emit_sub_and_assign
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_12:
mov rax, [rbp-48]
push rax
lea rax, [str_190]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_13
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
mov rax, [rbp-32]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call parse_and_emit_mul_and_assign
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_13:
mov rax, [rbp-48]
push rax
lea rax, [str_191]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_14
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
mov rax, [rbp-32]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call parse_and_emit_div_and_assign
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_14:
mov rax, [rbp-48]
push rax
lea rax, [str_192]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_15
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
mov rax, [rbp-32]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call parse_and_emit_mod_and_assign
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_15:
mov rax, [rbp-48]
push rax
lea rax, [str_193]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_16
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_dot
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_16:
mov rax, [rbp-48]
push rax
lea rax, [str_194]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_17
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_dot_assign
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_17:
mov rax, [rbp-48]
push rax
lea rax, [str_101]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_18
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
mov rax, [alloc_idx]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call parse_and_emit_alloc
push rdx
push rax
pop rax
mov [rbp-40], rax
pop rax
mov [alloc_idx], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_18:
mov rax, [rbp-48]
push rax
lea rax, [str_108]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_19
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
mov rax, [alloc_idx]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call parse_and_emit_alloc
push rdx
push rax
pop rax
mov [rbp-40], rax
pop rax
mov [alloc_idx], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_19:
mov rax, [rbp-48]
push rax
lea rax, [str_102]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_20
lea rax, [str_195]
push rax
pop rdi
call errs
jmp .L_ENDIF_87
.L_IF_87_ELIF_20:
mov rax, [rbp-48]
push rax
lea rax, [str_103]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_21
mov rax, [rbp-24]
push rax
pop rax
test rax, rax
jz .L_IF_88_ELIF_0
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_emit_fn
push rdx
push rax
pop rax
mov [rbp-40], rax
pop rax
mov [rbp-32], rax
jmp .L_ENDIF_88
.L_IF_88_ELIF_0:
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_skip_fn
push rax
pop rax
mov [rbp-40], rax
.L_ENDIF_88:
jmp .L_ENDIF_87
.L_IF_87_ELIF_21:
mov rax, [rbp-48]
push rax
lea rax, [str_196]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_22
mov rax, [rbp-24]
push rax
pop rax
test rax, rax
jz .L_IF_89_ELIF_0
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
mov rax, [rbp-32]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call parse_and_emit_return
push rax
pop rax
mov [rbp-40], rax
.L_IF_89_ELIF_0:
.L_ENDIF_89:
jmp .L_ENDIF_87
.L_IF_87_ELIF_22:
mov rax, [rbp-48]
push rax
lea rax, [str_106]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_23
mov rax, [rbp-24]
push rax
pop rax
test rax, rax
jz .L_IF_90_ELIF_0
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
mov rax, [rbp-32]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call parse_and_emit_endfn
push rdx
push rax
pop rax
mov [rbp-40], rax
pop rax
mov [rbp-32], rax
.L_IF_90_ELIF_0:
.L_ENDIF_90:
jmp .L_ENDIF_87
.L_IF_87_ELIF_23:
mov rax, [rbp-48]
push rax
lea rax, [str_105]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_24
push 1
pop rax
add [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_24:
mov rax, [rbp-48]
push rax
lea rax, [str_107]
push rax
pop rsi
pop rdi
call streq
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_25
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
pop rdx
pop rsi
pop rdi
call parse_and_skip_struct
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_25:
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
mov rax, [rbp-32]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call is_local_variable
push rdx
push rax
pop rax
mov [rbp-40], rax
pop rax
push rax
push rax
pop rax
mov [rbp-56], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_26
lea rax, [str_160]
push rax
pop rdi
call prints
mov rax, [rbp-56]
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rdi
call printi
lea rax, [str_137]
push rax
pop rdi
call prints
lea rax, [str_138]
push rax
pop rdi
call prints
jmp .L_ENDIF_87
.L_IF_87_ELIF_26:
mov rax, [variables]
push rax
mov rax, [variables_cnt]
push rax
mov rax, [rbp-48]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_27
lea rax, [str_162]
push rax
pop rdi
call prints
mov rax, [rbp-48]
push rax
pop rdi
call prints
lea rax, [str_137]
push rax
pop rdi
call prints
lea rax, [str_138]
push rax
pop rdi
call prints
jmp .L_ENDIF_87
.L_IF_87_ELIF_27:
mov rax, [funcs]
push rax
mov rax, [funcs_cnt]
push rax
mov rax, [rbp-48]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-64], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_28
mov rax, [rbp-8]
push rax
mov rax, [rbp-16]
push rax
mov rax, [rbp-40]
push rax
mov rax, [rbp-64]
push rax
pop rcx
pop rdx
pop rsi
pop rdi
call parse_and_emit_fn_call
push rax
pop rax
mov [rbp-40], rax
jmp .L_ENDIF_87
.L_IF_87_ELIF_28:
mov rax, [ops_name]
push rax
mov rax, [ops_cnt]
push rax
mov rax, [rbp-48]
push rax
pop rdx
pop rsi
pop rdi
call find_name
push rax
pop rax
push rax
push rax
pop rax
mov [rbp-72], rax
push -1
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_87_ELIF_29
mov rax, [rbp-72]
push rax
mov rax, [ops_code]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call prints
jmp .L_ENDIF_87
.L_IF_87_ELIF_29:
push 0
mov rax, [rbp-48]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
push 0
pop rbx
pop rax
cmp rax, rbx
setne al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_91_ELIF_0
mov rax, [rbp-40]
push rax
mov rax, [tokens_line_number]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rdi
call erri
lea rax, [str_197]
push rax
pop rdi
call errs
mov rax, [rbp-48]
push rax
pop rdi
call errs
lea rax, [str_99]
push rax
pop rdi
call errs
push 1
pop rdi
mov rax, 60
syscall
.L_IF_91_ELIF_0:
.L_ENDIF_91:
.L_ENDIF_87:
push 1
pop rax
add [rbp-40], rax
jmp .L_WHILE_86
.L_ENDWHILE_86:
.L_RET_FN_parse_and_emit:
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit:
parse_and_emit_standalone_fn:
push rbp
mov rbp, rsp
push rdi
push rsi
sub rsp, 40
push 0
pop rax
mov [rbp-24], rax
.L_WHILE_92:
mov rax, [rbp-24]
push rax
mov rax, [funcs_cnt]
push rax
pop rbx
pop rax
cmp rax, rbx
setl al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_ENDWHILE_92
mov rax, [rbp-24]
push rax
mov rax, [funcs_is_extern]
push rax
pop rbx
pop rax
movzx rax, byte [rbx + rax]
push rax
pop rax
test rax, rax
setz al
movzx rax, al
push rax
pop rax
test rax, rax
jz .L_IF_93_ELIF_0
mov rax, [rbp-24]
push rax
mov rax, [funcs_token_start]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-32], rax
mov rax, [rbp-24]
push rax
mov rax, [funcs_token_end]
push rax
pop rbx
pop rax
mov rax, [rbx + rax * 8]
push rax
pop rax
mov [rbp-40], rax
mov rax, [rbp-8]
push rax
mov rax, [rbp-32]
push rax
push 8
pop rbx
pop rax
imul rax, rbx
push rax
pop rbx
pop rax
add rax, rbx
push rax
pop rax
mov [rbp-48], rax
mov rax, [rbp-40]
push rax
mov rax, [rbp-32]
push rax
pop rbx
pop rax
sub rax, rbx
push rax
push 1
pop rbx
pop rax
add rax, rbx
push rax
pop rax
mov [rbp-56], rax
mov rax, [rbp-48]
push rax
mov rax, [rbp-56]
push rax
push 1
pop rdx
pop rsi
pop rdi
call parse_and_emit
.L_IF_93_ELIF_0:
.L_ENDIF_93:
push 1
pop rax
add [rbp-24], rax
jmp .L_WHILE_92
.L_ENDWHILE_92:
.L_RET_FN_parse_and_emit_standalone_fn:
mov rsp, rbp
pop rbp
ret
.L_SKIP_FN_parse_and_emit_standalone_fn:
section .note.GNU-stack noalloc noexec nowrite progbits
