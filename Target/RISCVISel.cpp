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
        RISCVMIR* result;
        switch (inst->getopration())
        {
        case BinaryInst::Op_Add:
            result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_add,inst);
            break;
        case BinaryInst::Op_Sub:
            result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_sub,inst);
            break;
        case BinaryInst::Op_Mul:
            result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_mul,inst);
            break;
        case BinaryInst::Op_Div:
            result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_div,inst);
            break;
        case BinaryInst::Op_Mod:
            result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_rem,inst);
            break;
        default:
            break;
        }
        /// @todo convert to addi
        /// @todo convert to float
    }
}

void InstLowering(GetElementPtrInst* inst){
    // cast it to multiple add and mul first 
    /// @todo 循环不变量外提很重要了这里，之后会做一个循环不变量外提的优化
    int limi=inst->Getuselist().size();
    auto baseptr=inst->GetOperand(0);
    auto hasSubtype=dynamic_cast<HasSubType*>(baseptr->GetType());
    size_t offset=0;
    for(int i=1;i<limi;i++){
        // just make sure
        assert(hasSubtype!=nullptr&&"Impossible Here");
        size_t size=hasSubtype->GetSubType()->get_size();
        auto index=inst->GetOperand(i);
        if(index->isConst()){
            if(auto constindex=dynamic_cast<ConstIRInt*>(index))
                offset+=size*(size_t)constindex->GetVal();
            else assert("?Impossible Here");
        }
        else{
            /// @warning Dangerous Conversion Here
            auto mul=new RISCVMIR(RISCVMIR::RISCVISA::_mulw,index,ConstIRInt::GetNewConstant((int)size));
            baseptr=new RISCVMIR(RISCVMIR::RISCVISA::_add,baseptr,mul);
        }
        hasSubtype=dynamic_cast<HasSubType*>(hasSubtype->GetSubType());
    }
    if(offset!=0)
        auto add=new RISCVMIR(RISCVMIR::RISCVISA::_addi,baseptr,offset);
}

void InstLowering(User* inst){
    if(auto store=dynamic_cast<StoreInst*>(inst))InstLowering(store);
    else if(auto load=dynamic_cast<LoadInst*>(inst))InstLowering(load);
}
}