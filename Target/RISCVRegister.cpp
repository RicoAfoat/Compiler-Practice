#include "RISCVRegister.hpp"

PhyRegister::PhyRegister(PhyReg _regenum):Register(RISCVType::riscv_none),regenum(_regenum){}

VirRegister::VirRegister(RISCVType tp):Register(tp){}