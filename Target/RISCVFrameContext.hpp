#pragma once
#include "RISCVMOperand.hpp"

class NamedMOperand:public RISCVMOperand{
    std::string name;
    public:
    std::string& GetName();
    NamedMOperand(RISCVType,std::string name);
};

/// @brief A ptr type to some mem address
class RISCVObject:public NamedMOperand{
    Type* tp;
    bool local;
    public:
    RISCVObject(Type*,std::string name);
};

/// @brief A local variable's pointer
class RISCVFrameObject:public RISCVObject{
    /// @brief set later after RA
    size_t begin_addr_offsets;
    public:
    RISCVFrameObject(Type*,std::string name);
};

/// @brief pointer to machine function or a machine global value 
class RISCVGlobalObject:public RISCVObject{
    Type* tp;
    public:
    RISCVGlobalObject(Type*,std::string name);
};