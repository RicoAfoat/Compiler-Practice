#pragma once
#include "BackendPass.hpp"

class RegisterAllocation:public BackEndPass<Function>{
    public:
    bool run(Function*)=0;
};