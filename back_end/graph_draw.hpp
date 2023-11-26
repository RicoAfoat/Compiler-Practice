// #include "livenessalysis.hpp"
#include <list>
#include <map>
#include <stack>
#include <string>
#include <unordered_set>
#include <vector>
#include<unordered_map>
#include<algorithm>
#include<memory>

enum {
  mov,
  add,
  sub,
  assign,
};



/// @brief 节点类
class _Node {
public:
  enum NodeType {
    spillednode,
    coalescednode,
    colorednode,
  };
  _Node():varName{},degree{0},alias{nullptr},AdjList{}
  {};
  // //移动构造
  // _Node(_Node&& other):AdjList(std::move(other.AdjList)),varName(std::move(other.varName)),alias(std::move(other.alias)),degree(other.degree)
  // {
  //   other.degree=0;
  // }
  // //移动赋值
  // _Node& operator=(_Node&& other){
  //   if(*this!=other){
  //     AdjList=std::move(other.AdjList);
  //     varName=std::move(other.varName);
  //     alias=std::move(other.alias);
  //     degree=other.degree;

  //     other.degree=0;
  //   }
  //   return *this;
  // }

  bool operator==(const _Node &other)const {
    return other.varName==varName;
  }

  bool operator!=(const _Node &other)const{
    return other.varName!=varName;
  }

  bool operator<(const _Node& other)const {
    return varName<other.varName; 
  }
  void Insert(_Node& node){
    AdjList.emplace_back(node);
  }
  // void AddDegree(){
  //   degree++;
  // }
  // int GetDegree() const{
  //   return degree;
  // }
  // void storeDegree(int x){
  //   degree=x;
  // }
  std::list<_Node>& GetList(){
    return AdjList;
  }
private:
  //std::unordered_set<_Node> AdjSet;//图中冲突边的结合
  std::list<_Node>AdjList;//图的邻接表表示，存储与当前节点有冲突的结点集合
public:  
  int degree{0};//当前结点度数
  _Node* alias;
  std::string varName;
};

namespace std {
    template <>
    struct hash<_Node> {
        std::size_t operator()(const _Node& node) const noexcept {
            // 直接使用 std::string 的哈希函数
            return std::hash<std::string>{}(node.varName);
        }
    };
}
struct Instruction {
  int type; // 操作数的类型，是否为move？
  _Node def;
  std::vector<_Node> use;
  bool operator==(const Instruction& other){
    if(type==other.type){
      if(def==other.def){
        /// @note 有点累赘，有没有更好判断两个instruction相等的东西？
        return use==other.use;
      }
    }
    return false;
  }
};

/// @brief 对于x<--y,y是src，x是dst
struct MoveInstruction{
   std::unique_ptr<_Node> src;
   std::unique_ptr<_Node> dst;

   MoveInstruction():src{nullptr},dst{nullptr}
   {}

   bool operator==(const MoveInstruction& other){
    if(src==other.src)
      return dst==other.dst;
    return false;
   }
};


struct BasicBlock {

  std::unordered_set<_Node> liveout; // 记录每一个块的liveout
  std::list<Instruction> Inst;
};

struct Function {
  std::vector<BasicBlock> bbs;
};



// TODO 首先构造冲突图，把每个节点分为传送有关和传送无关
void Build(Function &function);
void Simplify();
void coalesce();
void Freeze();
void SelectSpill();
void start();
void MakeWorkList();
void AssignColor();
void ReWriteProgram(std::unordered_set<_Node> &myset);
bool IsMoveInstruction(Instruction &Inst);
void simplifyInstr();
void AddEdge(_Node& u,_Node& v);
std::vector<_Node> GetInst_Use(Instruction &Inst);
_Node& GetInst_Def(Instruction &Inst);
bool IsMoveRelated(const _Node& node);
void DecrementDegree(_Node& node);
std::list<_Node> Adjacent(_Node& node);
std::list<Instruction> NodeMoves(const _Node& node);
void GetAlias(_Node* node);
void AddWorkList(_Node& node);
bool IsAdjset(std::pair<_Node,_Node>& key);
bool OK(_Node& node_1,_Node& node_2);
bool AdjOk(_Node& node_1,_Node& node_2);