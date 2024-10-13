program moody
implicit none

integer::i
real(8)::Re,eps

!eps=epsilon/d, where epsilon is the surface roughness and d is the pipe diameter.
eps=0.0001

write(*,*) "# epsilon/d=",eps
write(*,*) "# Re, Blasius, PK, Colebrook"

do i=1,41
	Re=10d0**(4d0+(i-1d0)*0.1)
	write(*,*) Re,lambda_blasius(Re),lambda_PK(Re),lambda_colebrook(Re,eps)
end do

contains

!The functions below calculate the friction factor, following each formula.

real(8) function lambda_blasius(Re)
	real(8)::Re
	lambda_blasius = 0.3164*Re**(-0.25)
end function

real(8) function lambda_PK(Re)
	real(8)::Re,f,df,x
	integer::i,imax
	
	x=0.001
	imax=10
	
	!Solving Prandtl-Karman equation with Newton's method
	do i=1,imax
		f  = 1d0/sqrt(x)-2d0*log10(Re*sqrt(x))+0.8
		df = -0.5*x**(-1.5)-1d0/x/log(10d0)
		x  = x-f/df
	end do
	
	lambda_PK = x
end function

real(8) function lambda_colebrook(Re,eps)
	real(8)::Re,eps,f,df,x,A
	integer::i,imax
	
	x=0.001
	imax=10
	
	!Solving Colebrook equation with Newton's method
	do i=1,imax
		A  = 2.51/Re/sqrt(x)+1d0/3.71*eps
		f  = 1d0/sqrt(x)+2d0*log10(A)
		df = -0.5*x**(-1.5)-1d0/A/log(10d0)*2.51/Re*x**(-1.5)
		x  = x-f/df
	end do

	lambda_colebrook = x
end function

end program