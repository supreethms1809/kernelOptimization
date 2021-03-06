MODULE mo_transpose
  USE mo_kind,          ONLY: wp
  USE mo_decomposition, ONLY: pe_decomposed
  IMPLICIT NONE
  
  INTERFACE scatter_gp
    MODULE PROCEDURE scatter_gp2, scatter_gp3, scatter_gp4
  END INTERFACE 
CONTAINS

  SUBROUTINE scatter_gp4 (gl, lc, gl_dc)
    REAL(wp), POINTER                :: gl   (:,:,:,:) ! global field
    REAL(wp), TARGET ,INTENT(out)    :: lc   (:,:,:,:) ! local  field
    TYPE (pe_decomposed) ,INTENT(in) :: gl_dc(0:)    ! global decomposition
    
    lc(:,:,:,:) = gl(:,:,:,:) 
  END SUBROUTINE scatter_gp4 

  SUBROUTINE scatter_gp3 (gl, lc, gl_dc)
    REAL(wp), POINTER                :: gl   (:,:,:) ! global field
    REAL(wp), TARGET ,INTENT(out)    :: lc   (:,:,:) ! local  field
    TYPE (pe_decomposed) ,INTENT(in) :: gl_dc(0:)    ! global decomposition
    
    lc(:,:,:) = gl(:,:,:) 
  END SUBROUTINE scatter_gp3 

  SUBROUTINE scatter_gp2 (gl, lc, gl_dc)
    REAL(wp), POINTER                :: gl   (:,:) ! global field
    REAL(wp), TARGET ,INTENT(out)    :: lc   (:,:) ! local  field
    TYPE (pe_decomposed) ,INTENT(in) :: gl_dc(0:)    ! global decomposition
    
    lc(:,:) = gl(:,:) 
  END SUBROUTINE scatter_gp2
END MODULE mo_transpose