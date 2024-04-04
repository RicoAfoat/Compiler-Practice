#include "CFG.hpp"


class LocalVar: public User{
    public:
    void print()override;
};

class RISCVLoweringContext{
    // argument management needed
    LocalVar localvar;
    public:
    void add_localvar(Operand);
};