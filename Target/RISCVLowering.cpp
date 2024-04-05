#include "RISCVLowering.hpp"
#include "RISCVISel.hpp"

bool RISCVModuleLowering::run(Module* m){
    LoweringGlobalValue(m);
    // start lowering function
    RISCVFunctionLowering funclower;
    auto& funcS=m->GetFuncTion();
    for(auto &func:funcS){
        if(funclower.run(func.get())){
            func->print();
            std::cerr<<"FUNC Lowering failed\n";
        }
    }
}

bool RISCVFunctionLowering::run(Function* m){
    RISCVISel isel(ctx);
    isel.run(m);
    // only imm, call, ret is not dealt with after this
    // if it is a legal imm, we should add i suffix
    // all we should alloca register to it and generate li
    
    // legalize imm here, if it is illegal, we treat it as a vreg. Generate li where is is used when spilled in RA, if is not spilled to stack, we generate li in prologue. Or we generate li in the beginning of the function, and the see if it spilled or not.

    // Register Allocation


    // Instruction Schedule
}