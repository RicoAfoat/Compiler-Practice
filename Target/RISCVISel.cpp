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
    if(inst->GetOperand(0)->GetType()==IntType::NewIntTypeGet())
        RISCVMIR::replace_with_mir_opcode(RISCVMIR::_sw,inst);
    else if(inst->GetOperand(0)->GetType()==FloatType::NewFloatTypeGet())
        RISCVMIR::replace_with_mir_opcode(RISCVMIR::_fsw,inst);
    else assert("invalid store type");
}

void InstLowering(LoadInst* inst){
    if(inst->GetOperand(0)->GetType()==IntType::NewIntTypeGet())
        RISCVMIR::replace_with_mir_opcode(RISCVMIR::_lw,inst);
    else if(inst->GetOperand(0)->GetType()==FloatType::NewFloatTypeGet())
        RISCVMIR::replace_with_mir_opcode(RISCVMIR::_flw,inst);
    else assert("invalid load type");
}

void InstLowering(FPTSI* inst){
    RISCVMIR::replace_with_mir_opcode(RISCVMIR::_fcvt_w_s,inst);
}

void InstLowering(SITFP* inst){
    RISCVMIR::replace_with_mir_opcode(RISCVMIR::_fcvt_s_w,inst);
}

void InstLowering(UnCondInst* inst){
    RISCVMIR::replace_with_mir_opcode(RISCVMIR::_j,inst);
}

void InstLowering(CondInst* inst){
    auto cond=inst->GetOperand(0)->as<BinaryInst>();
    User* result=nullptr;
    switch (cond->getopration())
    {
    case BinaryInst::Op_L:
        break;
    case BinaryInst::Op_LE:
        break;
    case BinaryInst::Op_G:
        break;
    case BinaryInst::Op_GE:
        break;
    case BinaryInst::Op_E:
        break;
    case BinaryInst::Op_NE:
        break;
    case BinaryInst::Op_Or:
        break;
    case BinaryInst::Op_And:
        break;
    default:
        break;
    }
    inst->Replace(result);
}

void InstLowering(CallInst* inst){
    //call inst留到寄存器分配完，做栈帧管理的时候来
    return;
}

void InstLowering(RetInst* inst){
    // 你也一样
    return;
}

void InstLowering(BinaryInst* inst){
    if(inst->getopration()<BinaryInst::Op_And){
        if(inst->ConstCalc())return;
        switch (inst->getopration())
        {
        case BinaryInst::Op_Add:
            RISCVMIR::replace_with_mir_opcode(RISCVMIR::_add,inst);
            break;
        case BinaryInst::Op_Sub:
            RISCVMIR::replace_with_mir_opcode(RISCVMIR::_sub,inst);
            break;
        case BinaryInst::Op_Mul:
            RISCVMIR::replace_with_mir_opcode(RISCVMIR::_mul,inst);
            break;
        case BinaryInst::Op_Div:
            RISCVMIR::replace_with_mir_opcode(RISCVMIR::_div,inst);
            break;
        case BinaryInst::Op_Mod:
            RISCVMIR::replace_with_mir_opcode(RISCVMIR::_rem,inst);
            break;
        default:
            break;
        }
    }
}

void InstLowering(GetElementPtrInst* inst){
    // FrameControl needed
}

void InstLowering(User* inst){
    if(auto store=dynamic_cast<StoreInst*>(inst))InstLowering(store);
    else if(auto load=dynamic_cast<LoadInst*>(inst))InstLowering(load);
}
}