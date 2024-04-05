#include "RISCVRegisterAllocation.hpp"
#include "LivenessAnalysis.hpp"

class GraphColoring:public RegisterAllocation{
    void RIGConstruction(std::set<Value*>& LiveAtMoment){

    }
    void RIGConstruction(Function* func){
        /// @todo create a method of getting succ blocks for basicblock
        LivenessAnalysis liveness(func);
        auto &LiveOutMap=liveness.BlockLiveout;
        /// @note 倒序求出每个语句的活跃信息，由此构建RIG
        for(auto bb:*func){
            auto& LiveOut=LiveOutMap[bb];
            RIGConstruction(LiveOut);
            for(auto it=bb->rbegin();it!=bb->rend();++it){
                liveness.RunOnInst(*it,LiveOut);
                RIGConstruction(LiveOut);
            }
        }
    }

    bool AllocaRegister(Function* func){
        /// try k-coloring
        
        return true;
    }

    void Spill(Function* func){

    }

    public:
    bool run(Function* func)override{
        while(true){
            RIGConstruction(func);
            if(AllocaRegister(func))
                return true;
            Spill(func);
        }
    }
};