#include "RISCVISel.hpp"
#include "RISCVMIR.hpp"

namespace RISCVISel{
bool run(Function* m){
    for(auto i:*m)
        for(auto inst:*i)
            InstLowering(inst);
    return true;
}
void InstLowering(StoreInst* inst){
    if(inst->GetOperand(0)->GetType()==IntType::NewIntTypeGet()){
        auto SW=new RISCVMIR(RISCVMIR::RISCVISA::_sw);
        for(int i=0;i<2;i++)SW->add_use(inst->GetOperand(i));
        inst->Replace(SW);
    }
    else if(inst->GetOperand(0)->GetType()==FloatType::NewFloatTypeGet()){
        auto FSW=new RISCVMIR(RISCVMIR::RISCVISA::_fsw);
        for(int i=0;i<2;i++)FSW->add_use(inst->GetOperand(i));
        inst->Replace(FSW);
    }
    else assert("invalid store type");
}

void InstLowering(LoadInst* inst){
    if(inst->GetOperand(0)->GetType()==IntType::NewIntTypeGet()){
        auto LW=new RISCVMIR(RISCVMIR::RISCVISA::_lw);
        for(int i=0;i<2;i++)LW->add_use(inst->GetOperand(i));
        inst->Replace(LW);
    }
    else if(inst->GetOperand(0)->GetType()==FloatType::NewFloatTypeGet()){
        auto FLW=new RISCVMIR(RISCVMIR::RISCVISA::_flw);
        for(int i=0;i<2;i++)FLW->add_use(inst->GetOperand(i));
        inst->Replace(FLW);
    }
    else assert("invalid load type");
}

void InstLowering(User* inst){
    if(auto store=dynamic_cast<StoreInst*>(inst))InstLowering(store);
    else if(auto load=dynamic_cast<LoadInst*>(inst))InstLowering(load);
}
}