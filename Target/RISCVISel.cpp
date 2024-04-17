#include "RISCVISel.hpp"
#include "RISCVMIR.hpp"

bool RISCVISel::run(Function* m){
    for(auto i:*m)
        for(auto inst:*i)
            InstLowering(inst);
    return true;
}

/// @note gathering all allocainsts, will transfer it to context
void RISCVISel::InstLowering(AllocaInst* inst){
    // ctx.add_localvar(inst);
}

void RISCVISel::InstLowering(StoreInst* inst){
    if(inst->GetOperand(0)->GetType()==IntType::NewIntTypeGet())
        ctx(new RISCVMIR(RISCVMIR::_sw,inst));
    else if(inst->GetOperand(0)->GetType()==FloatType::NewFloatTypeGet())
        ctx(new RISCVMIR(RISCVMIR::_fsw,inst));
    else assert("invalid store type");
}

void RISCVISel::InstLowering(LoadInst* inst){
    if(inst->GetOperand(0)->GetType()==IntType::NewIntTypeGet())
        ctx(new RISCVMIR(RISCVMIR::_lw,inst));
    else if(inst->GetOperand(0)->GetType()==FloatType::NewFloatTypeGet())
        ctx(new RISCVMIR(RISCVMIR::_flw,inst));
    else assert("invalid load type");
}

void RISCVISel::InstLowering(FPTSI* inst){
    ctx(new RISCVMIR(RISCVMIR::_fcvt_w_s,inst));
}

void RISCVISel::InstLowering(SITFP* inst){
    ctx(new RISCVMIR(RISCVMIR::_fcvt_s_w,inst));
}

void RISCVISel::InstLowering(UnCondInst* inst){
    ctx(new RISCVMIR(RISCVMIR::_j,inst));
}

void RISCVISel::InstLowering(CondInst* inst){
    #define M(x) ctx.mapping(x)
    auto cond=inst->GetOperand(0)->as<BinaryInst>();
    assert(cond!=nullptr&&"Invalid Condition");
    assert((cond->GetOperand(0)->GetType()==IntType::NewIntTypeGet()||cond->GetOperand(0)->GetType()==FloatType::NewFloatTypeGet())&&"Invalid Condition Type");
    if(cond->GetOperand(0)->GetType()==IntType::NewIntTypeGet()){
        switch (cond->getopration())
        {
            case BinaryInst::Op_L:
            {
                auto fi=new RISCVMIR(RISCVMIR::_blt,M(cond->GetOperand(0)),M(cond->GetOperand(1)),M(inst->GetOperand(1)));
                auto se=new RISCVMIR(RISCVMIR::_j,M(inst->GetOperand(2)));
                ctx(fi);
                ctx(se);
                break;
            }
            case BinaryInst::Op_LE:
            {
                auto fi=new RISCVMIR(RISCVMIR::_bge,M(cond->GetOperand(1)),M(cond->GetOperand(0)),M(inst->GetOperand(1)));
                auto se=new RISCVMIR(RISCVMIR::_j,M(inst->GetOperand(2)));
                break;
            }
            case BinaryInst::Op_G:
            {
                auto fi=new RISCVMIR(RISCVMIR::_blt,M(cond->GetOperand(1)),M(cond->GetOperand(0)),M(inst->GetOperand(1)));
                auto se=new RISCVMIR(RISCVMIR::_j,M(inst->GetOperand(2)));
                ctx(fi);
                ctx(se);
                break;
            }
            case BinaryInst::Op_GE:
            {
                auto fi=new RISCVMIR(RISCVMIR::_bge,M(cond->GetOperand(0)),M(cond->GetOperand(1)),M(inst->GetOperand(1)));
                auto se=new RISCVMIR(RISCVMIR::_j,M(inst->GetOperand(2)));
                ctx(fi);
                ctx(se);
                break;
            }
            case BinaryInst::Op_E:
            {    
                auto fi=new RISCVMIR(RISCVMIR::_beq,M(cond->GetOperand(0)),M(cond->GetOperand(1)),M(inst->GetOperand(1)));
                auto se=new RISCVMIR(RISCVMIR::_j,M(inst->GetOperand(2)));
                ctx(fi);
                ctx(se);
                break;
            }
            case BinaryInst::Op_NE:
            {
                auto fi=new RISCVMIR(RISCVMIR::_bne,M(cond->GetOperand(0)),M(cond->GetOperand(1)),M(inst->GetOperand(1)));
                auto se=new RISCVMIR(RISCVMIR::_j,M(inst->GetOperand(2)));
                ctx(fi);
                ctx(se);
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
        assert("Not IMPL");
    }
    #undef M
}

void RISCVISel::InstLowering(BinaryInst* inst){
    if(inst->getopration()<BinaryInst::Op_And){
        // if(inst->ConstCalc())return;
        RISCVMIR* result;
        switch (inst->getopration())
        {
        case BinaryInst::Op_Add:
        {
            if(inst->GetType()==IntType::NewIntTypeGet())
                ctx(new RISCVMIR(RISCVMIR::_add,inst));
            else if(inst->GetType()==FloatType::NewFloatTypeGet())
                ctx(new RISCVMIR(RISCVMIR::_fadd_s,inst));
            else assert("Illegal!");
            break;
        }
        case BinaryInst::Op_Sub:
        {
            if(inst->GetType()==IntType::NewIntTypeGet())
                ctx(new RISCVMIR(RISCVMIR::_sub,inst));
            else if(inst->GetType()==FloatType::NewFloatTypeGet())
                ctx(new RISCVMIR(RISCVMIR::_fsub_s,inst));
            else assert("Illegal!");
            break;
        }
        case BinaryInst::Op_Mul:
        {
            if(inst->GetType()==IntType::NewIntTypeGet())
                ctx(new RISCVMIR(RISCVMIR::_mul,inst));
            else if(inst->GetType()==FloatType::NewFloatTypeGet())
                ctx(new RISCVMIR(RISCVMIR::_fmul_s,inst));
            else assert("Illegal!");
            break;
        }
        case BinaryInst::Op_Div:
        {
            if(inst->GetType()==IntType::NewIntTypeGet())
                ctx(new RISCVMIR(RISCVMIR::_div,inst));
            else if(inst->GetType()==FloatType::NewFloatTypeGet())
                ctx(new RISCVMIR(RISCVMIR::_fdiv_s,inst));
            else assert("Illegal!");
            break;
        }
        case BinaryInst::Op_Mod:
        {
            if(inst->GetType()==IntType::NewIntTypeGet())ctx(new RISCVMIR(RISCVMIR::_rem,inst));
            else assert("Illegal!");
            break;
        }
        default:
            break;
        }
    }
}

void RISCVISel::InstLowering(GetElementPtrInst* inst){
    #define M(x) ctx.mapping(x)
    // cast it to multiple add and mul first 
    /// @todo 循环不变量外提很重要了这里，之后会做一个循环不变量外提的优化
    int limi=inst->Getuselist().size();
    auto baseptr=M(inst->GetOperand(0));
    auto hasSubtype=dynamic_cast<HasSubType*>(inst->GetOperand(0)->GetType());
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
            auto mul=new RISCVMIR(RISCVMIR::_mulw,ctx.createVReg(RISCVType::riscv_ptr),M(index),M(ConstSize_t::GetNewConstant(size)));
            ctx(mul);
            auto temp=ctx.createVReg(riscv_ptr);
            ctx(new RISCVMIR(RISCVMIR::_addw,temp,baseptr,mul->GetOperand(0)));
            baseptr=temp;
        }
        hasSubtype=dynamic_cast<HasSubType*>(hasSubtype->GetSubType());
    }
    if(offset!=0)
        ctx(new RISCVMIR(RISCVMIR::_addw,baseptr,M(ConstSize_t::GetNewConstant(offset))));
    #undef M
}

void RISCVISel::InstLowering(User* inst){
    if(auto store=dynamic_cast<StoreInst*>(inst))InstLowering(store);
    else if(auto load=dynamic_cast<LoadInst*>(inst))InstLowering(load);
    else if(auto alloca=dynamic_cast<AllocaInst*>(inst))InstLowering(alloca);
    else if(auto fptsi=dynamic_cast<FPTSI*>(inst))InstLowering(fptsi);
    else if(auto sitfp=dynamic_cast<SITFP*>(inst))InstLowering(sitfp);
    else if(auto uncond=dynamic_cast<UnCondInst*>(inst))InstLowering(uncond);
    else if(auto cond=dynamic_cast<CondInst*>(inst))InstLowering(cond);
    else if(auto binary=dynamic_cast<BinaryInst*>(inst))InstLowering(binary);
    else if(auto gep=dynamic_cast<GetElementPtrInst*>(inst))InstLowering(gep);
    else if(auto phi=dynamic_cast<PhiInst*>(inst));
    else assert("Invalid Inst Type");
}

RISCVISel::RISCVISel(RISCVLoweringContext& _ctx):ctx(_ctx){}