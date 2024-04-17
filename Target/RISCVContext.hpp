#pragma once
#include "CFG.hpp"
#include "RISCVRegister.hpp"
/// @note This class intend to store the context of the lowering process
/// maybe Singleton is a good choice
class RISCVLoweringContext{
    std::map<Value*,RISCVMOperand*> val2mop;
    std::map<Register*,std::string> reg2str;
    public:  
    void operator()(RISCVMIR*);
    RISCVMOperand* mapping(Value*);
    VirRegister* createVReg(RISCVType);
};