#pragma once
#include "RISCVType.hpp"
#include "BaseCFG.hpp"
/// @brief  Just need a type currently
class RISCVMOperand{
    RISCVType tp;
    public:
    RISCVMOperand(RISCVType);
    RISCVType GetType();
    virtual bool isReg();
    template<typename T>
    T* as(){
        return dynamic_cast<T*>(this);
    }
};

/// @note A wrapper for the constant data
/// @note should be legalize later 
class Imm:public RISCVMOperand{
    ConstantData* data;    
    Imm(RISCVType,ConstantData*);
    public:
    static Imm* GetImm(ConstantData*);
};