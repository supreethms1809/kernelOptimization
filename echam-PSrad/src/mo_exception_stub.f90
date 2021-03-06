MODULE mo_exception

  IMPLICIT NONE

  PRIVATE

  PUBLIC :: finish, em_warn, message, message_text

  INTEGER, PARAMETER :: em_none  = 0   ! normal message
  INTEGER, PARAMETER :: em_info  = 1   ! informational message
  INTEGER, PARAMETER :: em_warn  = 2   ! warning message: number of warnings counted
  INTEGER, PARAMETER :: em_error = 3   ! error message: number of errors counted
  INTEGER, PARAMETER :: em_param = 4   ! report parameter value
  INTEGER, PARAMETER :: em_debug = 5   ! debugging message

  INTEGER, PARAMETER :: nerr = 80
  INTEGER, PARAMETER :: nlog = 81

  CHARACTER(len=256) :: message_text = ''         !++mgs

  INTEGER :: number_of_warnings  = 0
  INTEGER :: number_of_errors    = 0

CONTAINS

  SUBROUTINE finish (name, text, exit_no)

    CHARACTER(len=*), INTENT(in)           :: name
    CHARACTER(len=*), INTENT(in), OPTIONAL :: text
    INTEGER,          INTENT(in), OPTIONAL :: exit_no

    INTEGER           :: ifile

    IF (PRESENT(exit_no)) THEN
       ifile = exit_no
    ELSE
       ifile = 6
    END IF

    WRITE (ifile,'(/,80("*"),/)')
    IF (PRESENT(text)) THEN
      WRITE (ifile,'(1x,a,a,a)') TRIM(name), ': ', TRIM(text)
    ELSE
      WRITE (ifile,'(1x,a,a)') TRIM(name), ': '
    ENDIF
    WRITE (ifile,'(/,80("-"),/,/)')
    STOP

  END SUBROUTINE finish
  SUBROUTINE message (name, text, out, level, all_print, adjust_right)

    CHARACTER (len=*), INTENT(in) :: name
    CHARACTER (len=*), INTENT(in) :: text
    INTEGER,           INTENT(in), OPTIONAL :: out
    INTEGER,           INTENT(in), OPTIONAL :: level
    LOGICAL,           INTENT(in), OPTIONAL :: all_print
    LOGICAL,           INTENT(in), OPTIONAL :: adjust_right

    INTEGER :: iout
    INTEGER :: ilevel
    LOGICAL :: lprint
    LOGICAL :: ladjustr     !++mgs renamed from ladjust to ladjustr

    CHARACTER(len=32) :: prefix

    CHARACTER(len=LEN(message_text)) :: write_text

    IF (PRESENT(all_print)) THEN
      lprint = all_print
    ELSE
      lprint = .FALSE.
    ENDIF

    IF (PRESENT(adjust_right)) THEN
      ladjustr = adjust_right 
    ELSE
      ladjustr = .FALSE.
    ENDIF

    IF (PRESENT(out)) THEN
      iout = out
    ELSE
      iout = nerr
    END IF

    IF (PRESENT(level)) THEN
      ilevel = level
    ELSE
      ilevel = em_none
    END IF

    SELECT CASE (ilevel)
    CASE (em_none)  ; prefix = '        '
    CASE (em_info)  ; prefix = 'INFO   :'
    CASE (em_warn)  ; prefix = 'WARNING:' ; number_of_warnings  = number_of_warnings+1
    CASE (em_error) ; prefix = 'ERROR  :' ; number_of_errors    = number_of_errors+1
    CASE (em_param) ; prefix = '---     '
    CASE (em_debug) ; prefix = 'DEBUG  :'
    END SELECT


    IF (.NOT. ladjustr) THEN
      message_text = TRIM(ADJUSTL(text))
    ENDIF
    IF (name /= '')  THEN
      message_text = TRIM(name) // ': ' // TRIM(message_text)
    ENDIF
    IF (ilevel > em_none) THEN
      message_text = TRIM(prefix) // ' ' // TRIM(message_text)
    ENDIF

!    IF (p_parallel .AND. (l_debug .OR. ilevel == em_error)) THEN
!    WRITE(write_text,'(1x,a,i6,a,a)') 'PE ', p_pe, ' ', TRIM(message_text)
     lprint = .TRUE.
!   ELSE
     write_text = message_text
!   END IF

!   IF (p_parallel_io .OR. lprint) THEN
     WRITE(iout,'(1x,a)') TRIM(write_text)
!     IF (l_log) WRITE(nlog,'(1x,a)') TRIM(write_text)
!   END IF
     
  END SUBROUTINE message


END MODULE mo_exception
