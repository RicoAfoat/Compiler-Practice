#include "RISCVMIR.hpp"

RISCVMIR::RISCVMIR(Type* tp,RISCVISA _opcode):User(tp),opcode(_opcode){
    tp_enum=RISCVTyper(tp);
    return;
}

RISCVMIR* RISCVMIR::replace_with_mir_opcode(RISCVISA _opcode,User* inst){
    auto newir=new RISCVMIR(inst->GetType(),_opcode);
    newir->Getuselist()=std::move(inst->Getuselist());
    for(int i=0;i<newir->Getuselist().size();++i)
        newir->Getuselist()[i]->SetUser()=newir;
    BasicBlock::iterator(inst).insert_after(newir);
    inst->RAUW(newir);
    delete inst;
    return newir;
}