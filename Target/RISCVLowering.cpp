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
    // Instruction Selection
    RISCVISel isel;
    isel.run(m);
    // Register Allocation
    // Instruction Schedule
}