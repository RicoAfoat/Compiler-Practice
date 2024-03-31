#include "CFG.hpp"
class RISCVMIR:public User
{
    public:
    enum RISCVISA{
        BeginShift,
        /// @todo need generation
        // shift left logical
        _sll,
        _slli,
        _srl,
        _srli,
        // shift right arithmetic
        _sra,
        _srai,
        EndShift,
        
        
        BeginArithmetic,
        _add,
        _addi,
        _sub,
        _lui,
        _auipc,//?

        _mul,
        _mulh,
        _mulhsu,
        _mulhu,

        _div,
        _divu,
        _rem,
        _remu,
        EndArithmetic,

        BeginLogic,
        _xor,
        _xori,
        _or,
        _ori,
        _and,
        _andi,
        EndLogic,

        BeginComp,
        _slt,
        _slti,
        _sltu,
        _sltiu,
        EndComp,

        BeginBranch,
        _beq,
        _bne,
        _blt,
        _bge,
        _bltu,
        _bgeu,
        EndBranch,

        BeginJumpAndLink,
        _jalr,
        _jal,
        EndJumpAndLink,

        BeginMem,
        _lb,
        _lbu,
        _lh,
        _lhu,
        _lw,

        _sb,
        _sh,
        _sw,
        EndMem,

        BeginFloat,

        BeginFloatMV,
        _fmv_w_x,
        _fmv_x_w,
        EndFloatMV,

        BeginFloatConvert,
        _fcvt_s_w,
        _fcvt_s_wu,
        _fcvt_w_s,
        _fcvt_wu_s,
        EndFloatConvert,
        
        BeginFloatMem,
        _flw,
        _fsw,
        EndFloatMem,

        BeginFloatArithmetic,
        _fadd_s,
        _fsub_s,
        _fmul_s,
        _fdiv_s,
        _fsqrt_s,

        _fmadd_s,
        _fmsub_s,
        _fnmadd_s,
        _fnmsub_s,

        _fsgnj_s,
        _fsgnjn_s,
        _fsgnjx_s,

        _fmin_s,
        _fmax_s,

        _feq_s,
        _flt_s,
        _fle_s,

        EndFloatArithmetic,
        EndFloat,
    }opcode;

    RISCVMIR(RISCVISA _opcode):User(){};
    inline RISCVISA& GetOpcode(){return opcode;};
    virtual void print(){
        /// @todo 
        assert(0);
    }
};