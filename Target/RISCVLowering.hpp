#include "CFG.hpp"
#include "BackendPass.hpp"
#include "RISCVFrameContext.hpp"

class RISCVModuleLowering:BackEndPass<Module>{
    // bool LoweringGlobalValue(Module*);
    public:
    bool run(Module*);
};

class RISCVFunctionLowering:BackEndPass<Function>{
    RISCVLoweringContext ctx;
    public:
    bool run(Function*);
};