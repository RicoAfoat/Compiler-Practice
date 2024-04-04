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
    assert(cond!=nullptr&&"Invalid Condition");
    assert((cond->GetOperand(0)->GetType()==IntType::NewIntTypeGet()||cond->GetOperand(0)->GetType()==FloatType::NewFloatTypeGet())&&"Invalid Condition Type");
    if(cond->GetOperand(0)->GetType()==IntType::NewIntTypeGet()){
        switch (cond->getopration())
        {
            case BinaryInst::Op_L:
            {
                auto fi=new RISCVMIR(VoidType::NewVoidTypeGet(),RISCVMIR::_blt,cond->GetOperand(0),cond->GetOperand(1),inst->GetOperand(1));
                auto se=new RISCVMIR(VoidType::NewVoidTypeGet(),RISCVMIR::_j,inst->GetOperand(2));
                inst->Replace(fi,se);
                break;
            }
            case BinaryInst::Op_LE:
            {
                auto fi=new RISCVMIR(VoidType::NewVoidTypeGet(),RISCVMIR::_bge,cond->GetOperand(1),cond->GetOperand(0),inst->GetOperand(1));
                auto se=new RISCVMIR(VoidType::NewVoidTypeGet(),RISCVMIR::_j,inst->GetOperand(2));
                break;
            }
            case BinaryInst::Op_G:
            {
                auto fi=new RISCVMIR(VoidType::NewVoidTypeGet(),RISCVMIR::_blt,cond->GetOperand(1),cond->GetOperand(0),inst->GetOperand(1));
                auto se=new RISCVMIR(VoidType::NewVoidTypeGet(),RISCVMIR::_j,inst->GetOperand(2));
                inst->Replace(fi,se);
                break;
            }
            case BinaryInst::Op_GE:
            {
                auto fi=new RISCVMIR(VoidType::NewVoidTypeGet(),RISCVMIR::_bge,cond->GetOperand(0),cond->GetOperand(1),inst->GetOperand(1));
                auto se=new RISCVMIR(VoidType::NewVoidTypeGet(),RISCVMIR::_j,inst->GetOperand(2));
                inst->Replace(fi,se);
                break;
            }
            case BinaryInst::Op_E:
            {    
                auto fi=new RISCVMIR(VoidType::NewVoidTypeGet(),RISCVMIR::_beq,cond->GetOperand(0),cond->GetOperand(1),inst->GetOperand(1));
                auto se=new RISCVMIR(VoidType::NewVoidTypeGet(),RISCVMIR::_j,inst->GetOperand(2));
                inst->Replace(fi,se);
                break;
            }
            case BinaryInst::Op_NE:
            {
                auto fi=new RISCVMIR(VoidType::NewVoidTypeGet(),RISCVMIR::_bne,cond->GetOperand(0),cond->GetOperand(1),inst->GetOperand(1));
                auto se=new RISCVMIR(VoidType::NewVoidTypeGet(),RISCVMIR::_j,inst->GetOperand(2));
                inst->Replace(fi,se);
                break;
            }
            case BinaryInst::Op_Or:
            {
                assert("Or will not appear in IR");
                break;
            }
            case BinaryInst::Op_And:
            {
                assert("And will not appear in IR");
                break;
            }
            default:
                break;
        }
    }
    else{

    }
}

void InstLowering(BinaryInst* inst){
    if(inst->getopration()<BinaryInst::Op_And){
        if(inst->ConstCalc())return;
        RISCVMIR* result;
        switch (inst->getopration())
        {
        case BinaryInst::Op_Add:
        {
            if(inst->GetType()==IntType::NewIntTypeGet())
                result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_add,inst);
            else if(inst->GetType()==FloatType::NewFloatTypeGet())
                result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_fadd_s,inst);
            else assert("Illegal!");
            break;
        }
        case BinaryInst::Op_Sub:
        {
            if(inst->GetType()==IntType::NewIntTypeGet())
                result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_sub,inst);
            else if(inst->GetType()==FloatType::NewFloatTypeGet())
                result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_fsub_s,inst);
            else assert("Illegal!");
            break;
        }
        case BinaryInst::Op_Mul:
        {
            if(inst->GetType()==IntType::NewIntTypeGet())
                result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_mul,inst);
            else if(inst->GetType()==FloatType::NewFloatTypeGet())
                result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_fmul_s,inst);
            else assert("Illegal!");
            break;
        }
        case BinaryInst::Op_Div:
        {
            if(inst->GetType()==IntType::NewIntTypeGet())
                result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_div,inst);
            else if(inst->GetType()==FloatType::NewFloatTypeGet())
                result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_fdiv_s,inst);
            else assert("Illegal!");
            break;
        }
        case BinaryInst::Op_Mod:
        {
            if(inst->GetType()==IntType::NewIntTypeGet())result=RISCVMIR::replace_with_mir_opcode(RISCVMIR::_rem,inst);
            else assert("Illegal!");
            break;
        }
        default:
            break;
        }
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
            auto mul=new RISCVMIR(RISCVPTR::NewRISCVPTRGet(),RISCVMIR::RISCVISA::_mulw,index,ConstSize_t::GetNewConstant(size));
            baseptr=new RISCVMIR(RISCVPTR::NewRISCVPTRGet(),RISCVMIR::RISCVISA::_addw,baseptr,mul);
        }
        hasSubtype=dynamic_cast<HasSubType*>(hasSubtype->GetSubType());
    }
    if(offset!=0)
        auto add=new RISCVMIR(RISCVPTR::NewRISCVPTRGet(),RISCVMIR::RISCVISA::_addw,baseptr,ConstSize_t::GetNewConstant(offset));
}

void InstLowering(User* inst){
    if(auto store=dynamic_cast<StoreInst*>(inst))InstLowering(store);
    else if(auto load=dynamic_cast<LoadInst*>(inst))InstLowering(load);
}
}