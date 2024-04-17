#pragma once
#include "BackendPass.hpp"
#include "RISCVContext.hpp"

class RISCVModuleLowering:BackEndPass<Module>{
    // bool LoweringGlobalValue(Module*);
    RISCVLoweringContext ctx;
    public:
    bool run(Module*);
};

class RISCVFunctionLowering:BackEndPass<Function>{
    RISCVLoweringContext& ctx;
    public:
    bool run(Function*);
    RISCVFunctionLowering(RISCVLoweringContext& ctx):ctx(ctx){};
};