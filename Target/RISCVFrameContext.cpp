#include "RISCVFrameContext.hpp"

NamedMOperand::NamedMOperand(RISCVType _tp,std::string _name):RISCVMOperand(_tp),name(_name){}

RISCVObject::RISCVObject(Type* _tp,std::string _name):NamedMOperand(RISCVTyper(_tp),_name),tp(_tp){
}

RISCVFrameObject::RISCVFrameObject(Type* _tp,std::string _name):RISCVObject(_tp,_name){}

RISCVGlobalObject::RISCVGlobalObject(Type* _tp,std::string _name):RISCVObject(_tp,_name){}
