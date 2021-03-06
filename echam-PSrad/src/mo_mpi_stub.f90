MODULE mo_mpi
!
! This module is a stub to provide similar functionality to the ECHAM6 IO
! routines.  Combining this with original ECHAM6 source code provides the
! ECHAM6 code with functionality that in many cases is sufficient for unit
! testing on non MPI architectures, i.e., as is done for the radiation 
! module
!
!  B. Stevens, August 2010
!

  USE mo_kind,      ONLY: wp

  LOGICAL, PARAMETER :: p_parallel_io = .TRUE., p_parallel = .TRUE.
  INTEGER, PARAMETER :: p_io = 0

  INTERFACE p_bcast
     MODULE PROCEDURE p_bcast_real_0D
     MODULE PROCEDURE p_bcast_real_1D
     MODULE PROCEDURE p_bcast_real_2D
     MODULE PROCEDURE p_bcast_real_3D
     MODULE PROCEDURE p_bcast_real_4D
     MODULE PROCEDURE p_bcast_integer_0D
     MODULE PROCEDURE p_bcast_integer_1D
     MODULE PROCEDURE p_bcast_integer_2D
     MODULE PROCEDURE p_bcast_integer_3D
     MODULE PROCEDURE p_bcast_integer_4D
     MODULE PROCEDURE p_bcast_logical_0D
     MODULE PROCEDURE p_bcast_logical_1D
   END INTERFACE p_bcast

CONTAINS

  SUBROUTINE p_bcast_real_0D (buffer, idmy)
   
    REAL(wp) :: buffer
    INTEGER, INTENT (IN) :: idmy
    !
    ! here the intent is to do nothing, but to preven compiler complaints
    !
    IF (idmy == -999) PRINT *, buffer

  END SUBROUTINE p_bcast_real_0D

  SUBROUTINE p_bcast_real_1D (buffer, idmy)
    
    REAL(wp) :: buffer(:)
    INTEGER, INTENT (IN) :: idmy
    !
    ! here the intent is to do nothing, but to preven compiler complaints
    !
    IF (idmy == -999) PRINT *, buffer

  END SUBROUTINE p_bcast_real_1D

  SUBROUTINE p_bcast_real_2D (buffer, idmy)
    
    REAL(wp) :: buffer(:,:)
    INTEGER, INTENT (IN) :: idmy
    !
    ! here the intent is to do nothing, but to preven compiler complaints
    !
    IF (idmy == -999) PRINT *, buffer

  END SUBROUTINE p_bcast_real_2D

  SUBROUTINE p_bcast_real_3D (buffer, idmy)
    
    REAL(wp) :: buffer(:,:,:)
    INTEGER, INTENT (IN) :: idmy
    !
    ! here the intent is to do nothing, but to preven compiler complaints
    !
    IF (idmy == -999) PRINT *, buffer

  END SUBROUTINE p_bcast_real_3D

  SUBROUTINE p_bcast_real_4D (buffer, idmy)
    
    REAL(wp) :: buffer(:,:,:,:)
    INTEGER, INTENT (IN) :: idmy
    !
    ! here the intent is to do nothing, but to preven compiler complaints
    !
    IF (idmy == -999) PRINT *, buffer

  END SUBROUTINE p_bcast_real_4D
    
  SUBROUTINE p_bcast_integer_0D (buffer, idmy)
   
    INTEGER :: buffer
    INTEGER, INTENT (IN) :: idmy
    !
    ! here the intent is to do nothing, but to preven compiler complaints
    !
    IF (idmy == -999) PRINT *, buffer

  END SUBROUTINE p_bcast_integer_0D

  SUBROUTINE p_bcast_integer_1D (buffer, idmy)
    
    INTEGER :: buffer(:)
    INTEGER, INTENT (IN) :: idmy
    !
    ! here the intent is to do nothing, but to preven compiler complaints
    !
    IF (idmy == -999) PRINT *, buffer

  END SUBROUTINE p_bcast_integer_1D

  SUBROUTINE p_bcast_integer_2D (buffer, idmy)
    
    INTEGER :: buffer(:,:)
    INTEGER, INTENT (IN) :: idmy
    !
    ! here the intent is to do nothing, but to preven compiler complaints
    !
    IF (idmy == -999) PRINT *, buffer

  END SUBROUTINE p_bcast_integer_2D

  SUBROUTINE p_bcast_integer_3D (buffer, idmy)
    
    INTEGER :: buffer(:,:,:)
    INTEGER, INTENT (IN) :: idmy
    !
    ! here the intent is to do nothing, but to preven compiler complaints
    !
    IF (idmy == -999) PRINT *, buffer

  END SUBROUTINE p_bcast_integer_3D

  SUBROUTINE p_bcast_integer_4D (buffer, idmy)
    
    INTEGER :: buffer(:,:,:,:)
    INTEGER, INTENT (IN) :: idmy
    !
    ! here the intent is to do nothing, but to preven compiler complaints
    !
    IF (idmy == -999) PRINT *, buffer

  END SUBROUTINE p_bcast_integer_4D

  SUBROUTINE p_bcast_logical_0D (buffer, idmy)
   
    LOGICAL :: buffer
    INTEGER, INTENT (IN) :: idmy
    !
    ! here the intent is to do nothing, but to preven compiler complaints
    !
    IF (idmy == -999) PRINT *, buffer

  END SUBROUTINE p_bcast_logical_0D

  SUBROUTINE p_bcast_logical_1D (buffer, idmy)
    
    LOGICAL :: buffer(:)
    INTEGER, INTENT (IN) :: idmy
    !
    ! here the intent is to do nothing, but to preven compiler complaints
    !
    IF (idmy == -999) PRINT *, buffer

  END SUBROUTINE p_bcast_logical_1D


END MODULE mo_mpi
