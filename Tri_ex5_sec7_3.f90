program main
      implicit none
      
interface                                                       
      subroutine tri(n,a,d,c,b,x)    
      implicit none
      integer, intent(in)::n                                    
      real, dimension(n), intent(inout):: a,d,c,b                  
      real, dimension(n), intent(out)::x                        
      end subroutine tri                                        
end interface 

      real, dimension (100):: a,d,c,b,x
      integer ::n = 100   
      integer :: i


      do i=1,n 
      d(i) = -4.0    
      a(i) = 1.0
      c(i) = 1.0      
      b(i) = 40 
      end do
      d(1) = 4.0
      d(n) = 4.0
      c(1) = -1.0
      a(n) = -1.0
      b(1) = -20
      b(n) = -20     
      call tri(n,a,d,c,b,x) 
      print*, "subroutine tri" 
      print"(f22.14)",(x(i),i=1,n)  
      !do  i=1,n 
      !d(i) = 1.0    
      !c(i) = 0.5   
      !b(i) = 2.0 
      !end do
      !b(1) = 1.5
      !b(n) = 1.5     
      !call tri(n,c,d,c,b,x) 
      !print*, "subroutine tri again" 
      !print "(f22.14)",(x(i),i=1,n)  
    end program main

    subroutine tri(n,a,d,c,b,x)    
      implicit none
      integer, intent(in)::n                                       
      real, dimension(n), intent(inout)::a,d,c,b                      
      real, dimension(n), intent(out):: x                          
      integer ::i                                                  
      real :: xmult                                                
      do i = 2,n                                                   
        xmult = a(i-1)/d(i-1)                                      
        d(i) = d(i) - xmult*c(i-1)                                 
        b(i) = b(i) - xmult*b(i-1)                                 
      end do                                                       
      x(n) = b(n)/d(n)                                             
      do i = n-1,1,-1                                              
        x(i) = (b(i) - c(i)*x(i+1))/d(i)                           
      end do                                                       
    end subroutine tri
