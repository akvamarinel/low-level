
%define last_elem 0

%macro colon 2
%2: 
dq last_elem 
db %1, 0
%define last_elem %2
%endmacro 