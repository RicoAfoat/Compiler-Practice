#pragma once
#include "CFG.hpp"
class RISCVLoweringContext{
    // argument management needed
    // LocalVar localvar;
    public:
    void add_localvar(AllocaInst*);
};