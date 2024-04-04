#include "BackendPass.hpp"
#include "CFG.hpp"
#include "RISCVFrameContext.hpp"

class RISCVISel:public BackEndPass<Function>{
    RISCVLoweringContext& ctx;
    void InstLowering(User*);
    void InstLowering(AllocaInst*);
    void InstLowering(StoreInst*);
    void InstLowering(LoadInst*);
    void InstLowering(FPTSI*);
    void InstLowering(SITFP*);
    void InstLowering(UnCondInst*);
    void InstLowering(CondInst*);
    void InstLowering(BinaryInst*);
    void InstLowering(GetElementPtrInst*);
    public:
    RISCVISel(RISCVLoweringContext&);
    bool run(Function*);
};