bits 64
org 0x400000

ehdr:   db 0x7f, "ELF", 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0
        dw 2                    ; e_type (ET_EXEC)
        dw 0x3e                 ; e_machine (x86-64)
        dd 1                    ; e_version
        dq _start               ; e_entry
        dq 64                   ; e_phoff
        dq 0                    ; e_shoff
        dd 0                    ; e_flags
        dw phdr - ehdr          ; e_ehsize
        dw _start - phdr        ; e_phentsize
        dw 1                    ; e_phnum
        dw 0                    ; e_shentsize
        dw 0                    ; e_shnum
        dw 0                    ; e_shstrndx
phdr:   dd 1                    ; p_type
        dd 5                    ; p_flags
        dq _start - ehdr        ; p_offset
        dq _start               ; p_vaddr
        dq 0                    ; p_paddr
        dq filesz               ; p_filesz
        dq filesz               ; p_memsz
        dq 0                    ; p_align

_start: xor   ebp, ebp
.main:  mov   ebx, ebp
        mov   edi, 1
        ;; On the ...
        mov   esi, onthe
        mov   edx, dayof - onthe
        mov   eax, edi
        syscall
        ;; Xth
        movzx eax, byte [daytab + ebp]
        lea   esi, [d0 + eax]
        movzx edx, byte [daytab + ebp + 1]
        sub   edx, eax
        mov   eax, edi
        syscall
        ;; day of Christmas, my true love send to me:
        mov   esi, dayof
        mov   edx, d0 - dayof
        mov   eax, edi
        syscall
.loop:  mov   edi, 1
        movzx eax, byte [strtab + ebx]
        lea   esi, [o0 + rax]
        movzx edx, byte [strtab + ebx + 1]
        sub   edx, eax
        mov   eax, edi
        syscall
        dec   ebx
        jge   .loop
        inc   ebp
        cmp   ebp, 12
        jl    .main
.exit:  xor   edi, edi
        mov   eax, 60
        syscall

onthe:  db "On the "
dayof:  db " day of Christmas", 10, "my true love sent to me:", 10

d0:     db "first"
d1:     db "second"
d2:     db "third"
d3:     db "fourth"
d4:     db "fifth"
d5:     db "sixth"
d6:     db "seventh"
d7:     db "eighth"
d8:     db "ninth"
d9:     db "tenth"
d10:    db "eleventh"
d11:    db "twelfth"
daytab: db d0 - d0, d1 - d0, d2 - d0, d3 - d0, d4 - d0, d5 - d0, d6 - d0,
        db d7 - d0, d8 - d0, d9 - d0, d10 - d0, d11 - d0, daytab - d0

o0:     db "one Partridge in a Pear Tree", 10, 10
o1:     db "two Turtle Doves", 10
o2:     db "three French Hens", 10
o3:     db "four Calling Birds", 10
o4:     db "five Golden Rings", 10
o5:     db "six Geese a Laying", 10
o6:     db "seven Swans a Swimming", 10
o7:     db "eight Maids a Milking", 10
o8:     db "nine Ladies Dancing", 10
o9:     db "ten Lords a Leaping", 10
o10:    db "eleven Pipers Piping", 10
o11:    db "twelve Drummers Drumming", 10
strtab: db o0 - o0, o1 - o0, o2 - o0, o3 - o0, o4 - o0, o5 - o0, o6 - o0,
        db o7 - o0, o8 - o0, o9 - o0, o10 - o0, o11 - o0, strtab - o0

filesz: equ $ - _start
