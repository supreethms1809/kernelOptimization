# Generated automatically by createMakefiles.pl
 
PROG =	../PSrad.exe

SRCS =	mo_aero_kinne.f90 mo_aero_volc_stub.f90 mo_cld_sampling.f90 \
	mo_cloud_optics.f90 mo_control.f90 mo_cosp_simulator_stub.f90 \
	mo_decomposition_stub.f90 mo_exception_stub.f90 mo_filename_stub.f90 \
	mo_interpo.f90 mo_io_stub.f90 mo_io_units.f90 mo_kind.f90 \
	mo_lrtm_driver.f90 mo_lrtm_gas_optics.f90 mo_lrtm_kgs.f90 \
	mo_lrtm_netcdf.f90 mo_lrtm_setup.f90 mo_lrtm_solver.f90 \
	mo_math_constants.f90 mo_memory_g3b_stub.f90 mo_mpi_stub.f90 \
	mo_netcdf.f90 mo_parameters.f90 mo_physical_constants.f90 \
	mo_psrad_interface.f90 mo_rad_fastmath.f90 \
	mo_radiation_parameters.f90 mo_random_numbers.f90 \
	mo_read_netcdf77.f90 mo_rrtm_coeffs.f90 mo_rrtm_params.f90 \
	mo_spec_sampling.f90 mo_srtm_driver.f90 mo_srtm_gas_optics.f90 \
	mo_srtm_kgs.f90 mo_srtm_netcdf.f90 mo_srtm_setup.f90 \
	mo_srtm_solver.f90 mo_submodel_stub.f90 mo_transpose_stub.f90 \
	radiation_prog.f90

OBJS := $(SRCS:.f90=.o)

all: $(PROG)

$(PROG): $(OBJS) 
	$(F90) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

clean:
	rm -f $(PROG) $(OBJS) *.mod

.SUFFIXES: $(SUFFIXES) .f90

%.o: %.f90
	$(F90) $(F90FLAGS) -c $<

mo_lrtm_gas_optics.o: mo_lrtm_gas_optics.f90
	$(F90) $(F90FLAGS_NOOPT) -c $<

mo_aero_kinne.o: mo_decomposition_stub.o mo_exception_stub.o mo_interpo.o \
	mo_kind.o mo_memory_g3b_stub.o mo_mpi_stub.o mo_physical_constants.o \
	mo_read_netcdf77.o mo_rrtm_params.o mo_transpose_stub.o
mo_aero_volc_stub.o: mo_kind.o
mo_cld_sampling.o: mo_exception_stub.o mo_kind.o mo_random_numbers.o
mo_cloud_optics.o: mo_control.o mo_exception_stub.o mo_io_stub.o mo_kind.o \
	mo_math_constants.o mo_mpi_stub.o mo_netcdf.o mo_physical_constants.o
mo_control.o: mo_kind.o
mo_cosp_simulator_stub.o: mo_kind.o
mo_interpo.o: mo_kind.o
mo_io_stub.o: mo_filename_stub.o mo_kind.o mo_netcdf.o
mo_lrtm_driver.o: mo_cld_sampling.o mo_kind.o mo_lrtm_gas_optics.o \
	mo_lrtm_kgs.o mo_lrtm_setup.o mo_lrtm_solver.o \
	mo_physical_constants.o mo_radiation_parameters.o mo_rrtm_coeffs.o \
	mo_rrtm_params.o mo_spec_sampling.o
mo_lrtm_gas_optics.o: mo_exception_stub.o mo_kind.o mo_lrtm_kgs.o \
	mo_lrtm_setup.o mo_rrtm_params.o
mo_lrtm_kgs.o: mo_kind.o mo_rrtm_params.o
mo_lrtm_netcdf.o: mo_exception_stub.o mo_io_stub.o mo_lrtm_kgs.o \
	mo_mpi_stub.o mo_netcdf.o
mo_lrtm_setup.o: mo_kind.o mo_lrtm_kgs.o mo_lrtm_netcdf.o mo_rad_fastmath.o \
	mo_rrtm_params.o
mo_lrtm_solver.o: mo_kind.o mo_math_constants.o mo_rad_fastmath.o \
	mo_rrtm_params.o
mo_math_constants.o: mo_kind.o
mo_memory_g3b_stub.o: mo_decomposition_stub.o mo_kind.o
mo_mpi_stub.o: mo_kind.o
mo_netcdf.o: mo_control.o mo_exception_stub.o mo_filename_stub.o mo_kind.o
mo_physical_constants.o: mo_kind.o
mo_psrad_interface.o: mo_aero_kinne.o mo_aero_volc_stub.o mo_cloud_optics.o \
	mo_cosp_simulator_stub.o mo_exception_stub.o mo_kind.o \
	mo_lrtm_driver.o mo_lrtm_setup.o mo_physical_constants.o \
	mo_radiation_parameters.o mo_random_numbers.o mo_rrtm_params.o \
	mo_spec_sampling.o mo_srtm_driver.o mo_srtm_setup.o \
	mo_submodel_stub.o
mo_rad_fastmath.o: mo_kind.o
mo_radiation_parameters.o: mo_kind.o mo_math_constants.o
mo_random_numbers.o: mo_kind.o
mo_read_netcdf77.o: mo_exception_stub.o mo_kind.o mo_netcdf.o
mo_rrtm_coeffs.o: mo_kind.o mo_lrtm_kgs.o mo_rrtm_params.o
mo_rrtm_params.o: mo_kind.o
mo_spec_sampling.o: mo_exception_stub.o mo_kind.o mo_random_numbers.o \
	mo_rrtm_params.o
mo_srtm_driver.o: mo_cld_sampling.o mo_kind.o mo_radiation_parameters.o \
	mo_rrtm_coeffs.o mo_rrtm_params.o mo_spec_sampling.o \
	mo_srtm_gas_optics.o mo_srtm_setup.o mo_srtm_solver.o
mo_srtm_gas_optics.o: mo_kind.o mo_rrtm_params.o mo_srtm_kgs.o \
	mo_srtm_setup.o
mo_srtm_kgs.o: mo_kind.o
mo_srtm_netcdf.o: mo_exception_stub.o mo_io_stub.o mo_kind.o mo_mpi_stub.o \
	mo_netcdf.o mo_srtm_kgs.o
mo_srtm_setup.o: mo_kind.o mo_rad_fastmath.o mo_rrtm_params.o mo_srtm_kgs.o \
	mo_srtm_netcdf.o
mo_srtm_solver.o: mo_kind.o mo_rad_fastmath.o
mo_submodel_stub.o: mo_kind.o
mo_transpose_stub.o: mo_decomposition_stub.o mo_kind.o
radiation_prog.o: mo_cloud_optics.o mo_control.o mo_decomposition_stub.o \
	mo_exception_stub.o mo_interpo.o mo_io_units.o mo_kind.o \
	mo_math_constants.o mo_memory_g3b_stub.o mo_mpi_stub.o \
	mo_physical_constants.o mo_psrad_interface.o \
	mo_radiation_parameters.o mo_read_netcdf77.o mo_rrtm_params.o \
	mo_spec_sampling.o mo_srtm_setup.o radiation_prog.o \
	$(INCLUDE)/radctl.inc
