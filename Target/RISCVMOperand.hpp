#pragma once
#include "RISCVType.hpp"
/// @brief  Just need a type currently
class RISCVMOperand{
    RISCVType tp;
    public:
    RISCVType GetType();
    virtual bool isReg();
    template<typename T>
    T* as(){
        return dynamic_cast<T*>(this);
    }
};