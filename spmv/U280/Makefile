.PHONY: help

help::
	$(ECHO) "Makefile Usage:"
	$(ECHO) "  make all TARGET=<sw_emu/hw_emu/hw> DEVICE=<FPGA platform>"
	$(ECHO) "      Command to generate the design for specified Target and Device."
	$(ECHO) ""
	$(ECHO) "  make clean "
	$(ECHO) "      Command to remove the generated non-hardware files."
	$(ECHO) ""
	$(ECHO) "  make cleanall"
	$(ECHO) "      Command to remove all the generated files."
	$(ECHO) ""
	$(ECHO) "  make check TARGET=<sw_emu/hw_emu/hw> DEVICE=<FPGA platform>"
	$(ECHO) "      Command to run application in emulation."
	$(ECHO) ""
	$(ECHO) "  make build TARGET=<sw_emu/hw_emu/hw> DEVICE=<FPGA platform>"
	$(ECHO) "      Command to build xclbin application."
	$(ECHO) ""
	$(ECHO) "  make run_nimbix DEVICE=<FPGA platform>"
	$(ECHO) "      Command to run application on Nimbix Cloud."
	$(ECHO) ""
	$(ECHO) "  make aws_build DEVICE=<FPGA platform>"
	$(ECHO) "      Command to build AWS xclbin application on AWS Cloud."
	$(ECHO) ""

# Points to Utility Directory
COMMON_REPO = ../../../
ABS_COMMON_REPO = /opt/xilinx/xrt/
#$(shell readlink -f $(COMMON_REPO))

TARGETS := hw
TARGET := $(TARGETS)
DEVICE := $(DEVICES)
XCLBIN := ./xclbin

include ./utils.mk

DSA := $(call device2dsa, $(DEVICE))
BUILD_DIR := ./_x.$(TARGET).$(DSA)

BUILD_DIR_kernel = $(BUILD_DIR)/kernel

CXX := xcpp -std=c++0x
#$(XILINX_SDX)/bin/xcpp
XOCC := v++

#Include Libraries
#include $(ABS_COMMON_REPO)/libs/opencl/opencl.mk
#include $(ABS_COMMON_REPO)/libs/xcl2/xcl2.mk
CXXFLAGS += $(xcl2_CXXFLAGS) -I/opt/xilinx/xrt/include
LDFLAGS += $(xcl2_LDFLAGS)
HOST_SRCS += $(xcl2_SRCS)
CXXFLAGS += $(opencl_CXXFLAGS) -Wall -O0 -g -std=c++14
LDFLAGS += $(opencl_LDFLAGS)

HOST_SRCS += src/host.cpp

# Host compiler global settings
CXXFLAGS += -fmessage-length=0
LDFLAGS += -lrt -lstdc++ 

# Kernel compiler global settings
CLFLAGS += -t $(TARGET) --platform $(DEVICE) --save-temps 


EXECUTABLE = kernel.cl
CMD_ARGS = $(XCLBIN)/kernel.$(TARGET).$(DSA).xclbin

EMCONFIG_DIR = $(XCLBIN)/$(DSA)

BINARY_CONTAINERS += $(XCLBIN)/kernel.$(TARGET).$(DSA).xclbin
BINARY_CONTAINER_kernel_OBJS += $(XCLBIN)/csr.$(TARGET).$(DSA).xo

CP = cp -rf

.PHONY: all clean cleanall docs emconfig
all: check-devices $(EXECUTABLE) $(BINARY_CONTAINERS) emconfig

.PHONY: exe
exe: $(EXECUTABLE)

.PHONY: build
build: $(BINARY_CONTAINERS)

#LDCLFLAGS += --kernel_frequency 200
LDCLFLAGS += --sp csr0_1.Ap:HBM[0] --sp csr0_1.Aj:HBM[0]  --sp csr0_1.Ax:HBM[0]  --sp csr0_1.x_g:HBM[0]  --sp csr0_1.y:HBM[0]
LDCLFLAGS += --sp csr1_1.Ap:HBM[0] --sp csr1_1.Aj:HBM[0]  --sp csr1_1.Ax:HBM[0]  --sp csr1_1.x_g:HBM[0]  --sp csr1_1.y:HBM[0]
LDCLFLAGS += --sp csr2_1.Ap:HBM[0] --sp csr2_1.Aj:HBM[0]  --sp csr2_1.Ax:HBM[0]  --sp csr2_1.x_g:HBM[0]  --sp csr2_1.y:HBM[0]

LDCLFLAGS += --sp csr0_2.Ap:HBM[1] --sp csr0_2.Aj:HBM[1]  --sp csr0_2.Ax:HBM[1]  --sp csr0_2.x_g:HBM[1]  --sp csr0_2.y:HBM[1]
LDCLFLAGS += --sp csr1_2.Ap:HBM[1] --sp csr1_2.Aj:HBM[1]  --sp csr1_2.Ax:HBM[1]  --sp csr1_2.x_g:HBM[1]  --sp csr1_2.y:HBM[1]
LDCLFLAGS += --sp csr2_2.Ap:HBM[1] --sp csr2_2.Aj:HBM[1]  --sp csr2_2.Ax:HBM[1]  --sp csr2_2.x_g:HBM[1]  --sp csr2_2.y:HBM[1]

LDCLFLAGS += --sp csr0_3.Ap:HBM[2] --sp csr0_3.Aj:HBM[2]  --sp csr0_3.Ax:HBM[2]  --sp csr0_3.x_g:HBM[2]  --sp csr0_3.y:HBM[2]
LDCLFLAGS += --sp csr1_3.Ap:HBM[2] --sp csr1_3.Aj:HBM[2]  --sp csr1_3.Ax:HBM[2]  --sp csr1_3.x_g:HBM[2]  --sp csr1_3.y:HBM[2]
LDCLFLAGS += --sp csr2_3.Ap:HBM[2] --sp csr2_3.Aj:HBM[2]  --sp csr2_3.Ax:HBM[2]  --sp csr2_3.x_g:HBM[2]  --sp csr2_3.y:HBM[2]

LDCLFLAGS += --sp csr0_4.Ap:HBM[3] --sp csr0_4.Aj:HBM[3]  --sp csr0_4.Ax:HBM[3]  --sp csr0_4.x_g:HBM[3]  --sp csr0_4.y:HBM[3]
LDCLFLAGS += --sp csr1_4.Ap:HBM[3] --sp csr1_4.Aj:HBM[3]  --sp csr1_4.Ax:HBM[3]  --sp csr1_4.x_g:HBM[3]  --sp csr1_4.y:HBM[3]
LDCLFLAGS += --sp csr2_4.Ap:HBM[3] --sp csr2_4.Aj:HBM[3]  --sp csr2_4.Ax:HBM[3]  --sp csr2_4.x_g:HBM[3]  --sp csr2_4.y:HBM[3]

LDCLFLAGS += -O3

# Building kernel
$(XCLBIN)/csr.$(TARGET).$(DSA).xo: src/kernel.cl
	mkdir -p $(XCLBIN)
	$(XOCC) $(CLFLAGS) --temp_dir $(BUILD_DIR_kernel) -c -k csr0 -I'$(<D)' -o'$@' '$<'
	$(XOCC) $(CLFLAGS) --temp_dir $(BUILD_DIR_kernel) -c -k csr1 -I'$(<D)' -o'$@' '$<'
	$(XOCC) $(CLFLAGS) --temp_dir $(BUILD_DIR_kernel) -c -k csr2 -I'$(<D)' -o'$@' '$<'

$(XCLBIN)/kernel.$(TARGET).$(DSA).xclbin: $(BINARY_CONTAINER_kernel_OBJS)
	mkdir -p $(XCLBIN)
	$(XOCC) $(CLFLAGS) --temp_dir $(BUILD_DIR_kernel) -l $(LDCLFLAGS) --nk csr0:4 --nk csr1:4 --nk csr2:4 -o'$@' $(+)

# Building Host
$(EXECUTABLE): check-xrt $(HOST_SRCS) $(HOST_HDRS)
	$(CXX) $(CXXFLAGS) -c $(HOST_SRCS) $(HOST_HDRS) -o host.o $(LDFLAGS)
	$(CXX) $(CXXFLAGS) -c common_args.c $(HOST_HDRS) -o common_args.o $(LDFLAGS)
	$(CXX) host.o common_args.o -o spmv /opt/xilinx/xrt/lib/libxilinxopencl.so.2.6.655 -fopenmp

emconfig:$(EMCONFIG_DIR)/emconfig.json
$(EMCONFIG_DIR)/emconfig.json:
	emconfigutil --platform $(DEVICE) --od $(EMCONFIG_DIR)

check: all
ifeq ($(TARGET),$(filter $(TARGET),sw_emu hw_emu))
	$(CP) $(EMCONFIG_DIR)/emconfig.json .
	XCL_EMULATION_MODE=$(TARGET) ./$(EXECUTABLE) $(XCLBIN)/kernel.$(TARGET).$(DSA).xclbin
else
	 ./$(EXECUTABLE) $(XCLBIN)/kernel.$(TARGET).$(DSA).xclbin
endif
	sdx_analyze profile -i profile_summary.csv -f html

run_nimbix: all
	$(COMMON_REPO)/utility/nimbix/run_nimbix.py $(EXECUTABLE) $(CMD_ARGS) $(DSA)

aws_build: check-aws_repo $(BINARY_CONTAINERS)
	$(COMMON_REPO)/utility/aws/run_aws.py $(BINARY_CONTAINERS)

# Cleaning stuff
clean:
	-$(RMDIR) $(EXECUTABLE) $(XCLBIN)/{*sw_emu*,*hw_emu*} 
	-$(RMDIR) profile_* TempConfig system_estimate.xtxt *.rpt *.csv 
	-$(RMDIR) src/*.ll _xocc_* .Xil emconfig.json dltmp* xmltmp* *.log *.jou *.wcfg *.wdb
	rm *.o

cleanall: clean
	-$(RMDIR) $(XCLBIN)
	-$(RMDIR) _x.*

