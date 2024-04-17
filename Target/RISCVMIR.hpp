#pragma once
#include "CFG.hpp"
#include "RISCVRegister.hpp"

class RISCVFunction;
class RISCVBasicBlock;
class RISCVMIR;

/// @note RISCVMIR no longer is an MOperand for SSA is destructed
class RISCVMIR:public list_node<RISCVBasicBlock,RISCVMIR>
{
    RISCVType tp_enum;
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
        _addi,//-2048~2047
        _addw,
        _addiw,
        _sub,
        _subw,
        _lui,
        _auipc,//?

        _mul,
        _mulh,
        _mulhsu,
        _mulhu,
        _mulw,

        _div,
        _divu,
        _divw,
        _rem,
        _remu,
        _remw,
        _remuw,
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
        _j,//equals jal x0 ...
        _beq,
        _bne,
        _blt,
        _bge,
        _bltu,
        _bgeu,
        _call,
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
    /// @note def in the front while use in the back
    std::vector<RISCVMOperand> operands;
    inline RISCVISA& GetOpcode(){return opcode;};
    bool isArithmetic(){
        return (EndArithmetic>opcode&&opcode>BeginArithmetic)|(EndFloatArithmetic>opcode&&opcode>BeginFloatArithmetic);
    }
};

class RISCVBasicBlock:public RISCVMOperand,mylist<RISCVBasicBlock,RISCVMIR>,list_node<RISCVFunction,RISCVBasicBlock>
{    
    //std::vector<RISCVBasicBlock*> preds;
    //std::vector<RISCVBasicBlock*> succs;
    public:
};

/// should we save return type here? I suppose not.
class RISCVFunction:public RISCVMOperand,mylist<RISCVFunction,RISCVBasicBlock>{
    /// originally return type
    Type* ret_type;
    /// @todo FrameContext here
    RISCVBasicBlock* entry;
    public:
};