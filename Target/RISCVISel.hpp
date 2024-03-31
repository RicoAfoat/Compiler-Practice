#include "BackendPass.hpp"
#include "CFG.hpp"
class RISCVISel:public BackEndPass<Function>{
    void InstLowering(User*);
    public:
    bool run(Function*);
};