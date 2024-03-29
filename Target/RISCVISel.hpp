#include "BackendPass.hpp"
#include "CFG.hpp"
class RISCVISel:public BackEndPass<Function>{
    public:
    bool run(Function*);
};