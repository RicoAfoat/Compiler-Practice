#include "CFG.hpp"
#include "BackendPass.hpp"
class RISCVModuleLowering:BackEndPass<Module>{
    bool LoweringGlobalValue(Module*);
    public:
    bool run(Module*);
};

class RISCVFunctionLowering:BackEndPass<Function>{
    public:
    bool run(Function*);
};