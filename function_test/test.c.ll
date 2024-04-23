define i32 @main(){
.1:
  br label %.8 
.8:
  br label %.14 
.14:
  br label %.19 
.19:
  br label %.22 
.22:
  br label %.24 
.24:
  br label %.29 
.28:
  br label %.33 
.29:
  br label %.28 
.33:
  br label %.36 
.36:
  br label %.43 
.43:
  ret i32 10 
}
main:
.1:
		_j .8

.8:
		_j .14

.14:
		_j .19

.19:
		_j .22

.22:
		_j .24

.24:
		_j .29

.28:
		_j .33

.29:
		_j .28

.33:
		_j .36

.36:
		_j .43

.43:
	