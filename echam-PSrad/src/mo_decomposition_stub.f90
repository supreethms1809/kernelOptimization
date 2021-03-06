MODULE mo_decomposition
  !
  ! This module defines lon/lat dimensions for radiation_prog
  !
  IMPLICIT NONE

  PRIVATE

  !
  ! Module variables
  !
  PUBLIC :: local_decomposition, global_decomposition, grid_init  ! decomposition info for this PE

  TYPE, PUBLIC    :: pe_decomposed
     !
     SEQUENCE
     !
     ! Information regarding the whole model domain and discretization

     INTEGER          :: nlon     ! number of longitudes
     INTEGER          :: nlat     ! number of latitudes
     INTEGER          :: nlev     ! number of levels
     INTEGER          :: ntime    ! number of time steps

     INTEGER          :: ngpblks   ! number of rows
     INTEGER          :: nproma    ! number of columns
     INTEGER          :: npromz    ! number of columns in last row

  END TYPE pe_decomposed

  TYPE (pe_decomposed), SAVE          :: local_decomposition
  TYPE (pe_decomposed), POINTER, SAVE :: global_decomposition(:)
  TYPE (pe_decomposed), TARGET , SAVE :: decompostion(1)
CONTAINS

  SUBROUTINE grid_init (lon,lat,nlev,ntime)

    INTEGER, INTENT(in)  :: lon,lat,nlev,ntime

    local_decomposition%nlon = lon
    local_decomposition%nlat = lat
    local_decomposition%nlev = nlev
    local_decomposition%ntime = ntime
    local_decomposition%ngpblks = local_decomposition%nlat
    local_decomposition%nproma = local_decomposition%nlon  
    local_decomposition%npromz = local_decomposition%nlon
    
    decompostion(1) = local_decomposition
    global_decomposition => decompostion
  END SUBROUTINE grid_init

END MODULE mo_decomposition
