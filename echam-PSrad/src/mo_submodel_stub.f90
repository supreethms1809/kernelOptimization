MODULE mo_submodel 
  IMPLICIT NONE
  
  LOGICAL, PARAMETER :: lanysubmodel = .false. 
END MODULE mo_submodel 

MODULE mo_submodel_interface
  USE mo_kind, ONLY: wp
  IMPLICIT NONE

  PRIVATE
  PUBLIC :: radiation_subm_1        ! initialize submodel fields needed for radiation calculation
  PUBLIC :: radiation_subm_2        ! diagnose radiation after radiation calculation
CONTAINS
  SUBROUTINE radiation_subm_1(kproma           ,kbdim            ,klev         ,krow  ,&
                              ktrac            ,kaero            ,kpband       ,kb_sw ,&
                              aer_tau_sw_vr    ,aer_piz_sw_vr    ,aer_cg_sw_vr        ,&
                              aer_tau_lw_vr                                           ,&
                              ppd_hl           ,pxtm1                                  )

  INTEGER, INTENT(in) :: kproma                     ! geographic block number of locations
  INTEGER, INTENT(in) :: kbdim                      ! geographic block maximum number of locations
  INTEGER, INTENT(in) :: klev                       ! numer of levels
  INTEGER, INTENT(in) :: ktrac                      ! numer of tracers
  INTEGER, INTENT(in) :: krow                       ! geographic block number
  INTEGER, INTENT(in) :: kaero                      ! switch for aerosol radiation coupling
  INTEGER, INTENT(in) :: kpband                     ! number of LW bands
  INTEGER, INTENT(in) :: kb_sw                      ! number of SW bands
  REAL(wp), INTENT(in):: ppd_hl(kbdim,klev)         ! pressure diff between half levels [Pa]
  REAL(wp), INTENT(in):: pxtm1(kbdim,klev,ktrac)    ! tracer mass/number mixing ratio (t-dt)   [kg/kg]/[

  REAL(wp), INTENT(inout) :: aer_tau_lw_vr(kbdim,klev,kpband),& !< LW optical thickness of aerosols
                             aer_tau_sw_vr(kbdim,klev,kb_sw), & !< aerosol optical thickness
                             aer_cg_sw_vr(kbdim,klev,kb_sw),  & !< aerosol asymmetry factor
                             aer_piz_sw_vr(kbdim,klev,kb_sw)    !< aerosol single scattering albedo
  
  IF(kproma < 1) print *, "Error calling submodel!" 
  
  END SUBROUTINE radiation_subm_1
  ! -------------------------------------
  SUBROUTINE radiation_subm_2(kproma, kbdim, krow, klev, &
                              ktrac, kaero,              &
                              pxtm1                      )
  INTEGER,  INTENT(in) :: kproma                   ! geographic block number of locations
  INTEGER,  INTENT(in) :: kbdim                    ! geographic block maximum number of locations
  INTEGER,  INTENT(in) :: klev                     ! numer of levels
  INTEGER,  INTENT(in) :: ktrac                    ! numer of tracers
  INTEGER,  INTENT(in) :: krow                     ! geographic block number
  INTEGER,  INTENT(in) :: kaero                    ! geographic block number
  REAL(wp), INTENT(in) :: pxtm1 (kbdim,klev,ktrac) ! tracer mass/number mixing ratio (t-dt)   [kg/kg]/[#/k

  IF(kproma < 1) print *, "Error calling submodel!" 

  END SUBROUTINE radiation_subm_2

END MODULE mo_submodel_interface
