        program superspy
        implicit none
        ! Variables for input, and grabbing the two digits from the
        ! input
        integer :: a, b, c
        print*, "Hat size?" 
        read*, a
        ! Calls the two needed subroutines 
        call get_values(a, b, c)
        call get_answer(b, c) 
        end program superspy
        
        ! Subroutine for getting the two digits from the provided input 
        subroutine get_values(x, y, z)
        implicit none
        integer :: x, y, z
        ! Uses mod x/10 to shave the first digit off and obtain the
        ! digit in the 2nd place
        y = mod(x/10, 10)
        ! Uses mod x/100 to shave off the first two digits and obtain
        ! the digit in the 3rd place
        z = mod(x/100, 10)
        end subroutine get_values
      
        ! Subroutine to concatenate the two digits provided by the other
        ! subroutine
        subroutine get_answer(x, y)
        implicit none
        ! 1 character field for each individual digit
        character(1) :: val_1, val_2
        ! 2 character field to concatenate the two digits into 
        character(2) :: val_3
        integer :: x, y
        ! Converts the two digits to strings
        write(val_1,'(i1)')x
        write(val_2,'(i1)')y
        ! String concatenates the two digits into one string 
        val_3 = val_1 // val_2
        print*, "Use ", val_3
        end subroutine get_answer
