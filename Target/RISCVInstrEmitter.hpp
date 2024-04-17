#pragma once
#include "BackendPass.hpp"
#include "RISCVContext.hpp"

class InstrEmitter:BackEndPass<Function>{
    RISCVLoweringContext& ctx;
    public:
    InstrEmitter(RISCVLoweringContext& ctx):ctx(ctx){};
    bool run(Function*) override;
};