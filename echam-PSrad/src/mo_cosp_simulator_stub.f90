MODULE mo_cosp_simulator
  USE mo_kind, ONLY: wp 
  IMPLICIT NONE
  
  LOGICAL, PARAMETER :: locosp = .false., Lisccp_sim = .false. 
  REAL(wp), PUBLIC, POINTER, DIMENSION(:,:,:) :: cosp_reffl     ! Liquid water droplet effective radius [um]
  REAL(wp), PUBLIC, POINTER, DIMENSION(:,:,:) :: cosp_reffi     ! Ice crystal effective radius [um]

  REAL(wp), PUBLIC,  POINTER, DIMENSION(:,:,:) :: cisccp_cldtau3d  ! Cloud optical thickness
  REAL(wp), PUBLIC,  POINTER, DIMENSION(:,:,:) :: cisccp_cldemi3d  ! Cloud emissivity @ 10.5 µm

  REAL(wp), PUBLIC, POINTER, DIMENSION(:,:,:) :: cosp_f3d ! 3-d cloud fraction as seen in radiation

END MODULE mo_cosp_simulator
