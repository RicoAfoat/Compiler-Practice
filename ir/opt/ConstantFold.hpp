#include "CFG.hpp"
#include "dominant.hpp"
using DNode=dominance::Node*;
class ConstantFolding
{
public:
Value* ConstantFoldInst(User* inst);
// Handle PhiInst
Value* ConstantFoldPhiInst(PhiInst* inst);
// Handle BinaryInst
Value* ConstantFoldBinaryInst(BinaryInst* inst);

private:
// For ConsantFoldBinaryInst
Value* ConstantFoldBinaryInt(BinaryInst* inst, Value* LHS, Value* RHS);
// For ConsantFoldBinaryInst
Value* ConstantFoldBinaryFloat(BinaryInst* inst, Value* LHS, Value* RHS);
// Handle LoadInst
Value* ConstantFoldLoadInst(LoadInst* inst);
// Handle StoreInst
Value* ConstantFoldStoreInst(StoreInst* inst);
// Handle SITFP
Value* ConstantFoldSITFPInst(SITFP* inst);
// Handle FPTSI
Value* ConstantFoldFPTSIInst(FPTSI* inst);
// Handle GetElementPtrInst
Value* ConstantFoldGetElementPtrInst(GetElementPtrInst* inst);
// Handle CallInst
Value* ConstantFoldCallInst(CallInst* inst);

};
