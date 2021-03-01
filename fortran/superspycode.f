        program superspy
        implicit none
        integer :: a, b, c
        print*, "Hat size?" 
        read*, a
        call get_values(a, b, c)
        call get_answer(b, c) 
        end program superspy
        subroutine get_values(x, y, z)
        implicit none
        integer :: x, y, z
        y = mod(x/10, 10)
        z = mod(x/100, 10)
        end subroutine get_values
        subroutine get_answer(x, y)
        implicit none
        character(1) :: val_1, val_2
        character(2) :: val_3
        integer :: x, y
        write(val_1,'(i1)')x
        write(val_2,'(i1)')y
        val_3 = val_1 // val_2
        print*, "Use ", val_3
        end subroutine get_answer
