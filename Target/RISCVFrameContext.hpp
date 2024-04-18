#pragma once
#include "RISCVMOperand.hpp"

/// @brief A ptr type to some mem address
class RISCVObject:public RISCVMOperand{
    Type* tp;
    bool local;
    RISCVObject();
};

/// @brief A local variable's pointer
class RISCVFrameObject:public RISCVObject{
    size_t begin_addr_offsets;
    public:
    RISCVFrameObject();
};

/// @brief pointer to machine function or a machine global value 
class RISCVGlobalObject:public RISCVObject{
    Type* tp;
    public:
    RISCVGlobalObject();
};