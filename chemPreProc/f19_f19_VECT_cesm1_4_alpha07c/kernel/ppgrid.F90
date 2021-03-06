!KGEN-generated Fortran source file

!Generated at : 2016-03-01 11:27:41
!KGEN version : 0.6.2


module ppgrid

!----------------------------------------------------------------------- 
! 
! Purpose: 
! Initialize physics grid resolution parameters
!  for a chunked data structure
! 
! Author: 
! 
!-----------------------------------------------------------------------

    USE kgen_utils_mod, ONLY: kgen_dp, kgen_array_sumcheck
    IMPLICIT NONE
    PRIVATE
    SAVE
 
    PUBLIC pver


! Grid point resolution parameters

   integer pver       ! number of vertical levels

   PARAMETER (pver      = 66)
!
! start, end indices for chunks owned by a given MPI task
! (set in phys_grid_init).
!

end module ppgrid