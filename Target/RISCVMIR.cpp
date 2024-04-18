#include "RISCVMIR.hpp"

RISCVMOperand*& RISCVMIR::GetOperand(int ind){
    assert(0<=ind&&ind<operands.size()&&"Range Assertion");
    return operands[ind];
}

void RISCVMIR::AddOperand(RISCVMOperand* op){
    operands.push_back(op);
}

std::vector<std::unique_ptr<RISCVFrameObject>>& RISCVFunction::GetFrameObjects(){
    return frame;
}

RISCVBasicBlock::RISCVBasicBlock(std::string _name):NamedMOperand(riscv_none,_name){}

RISCVFunction::RISCVFunction(Function* _func):RISCVGlobalObject(_func->GetType(),_func->GetName()),func(_func){}