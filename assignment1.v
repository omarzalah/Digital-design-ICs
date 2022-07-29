/*
Assigment 1
-----------
Name:Assigment1 by omar
Date:27/7/2022
Description:Ans for assigment one that takes 
first flip flop:(IN1 nor IN2)And(IN3)
second flip flop:(IN2 NAND IN3)
Third flip flop:(IN4'OR IN3)OR(IN5) 
*/
module assigment(IN1,IN2,IN3,IN4,IN5,CLK,OUT1,OUT2,OUT3);
  /*input declearation*/
input IN1;
input IN2;
input IN3;
input IN4;
input IN5;
input CLK;
/*output decleartion*/
output OUT1;
output OUT2;
output OUT3;
/*signal delecration*/
/*
D1 FOR  (IN3 NAND D4)
D2 FOR (IN2 NAND IN3)
D3 FOR (IN5 OR D6)
D4 FOR (IN1 NOR IN2)
D5 FOR (IN4 ')
D6 FOR (IN3 OR IN4')
*/
reg OUT1;
reg OUT2;
reg OUT3;
reg D1;
reg D2;
reg D3;
reg D4;
reg D5;
reg D6;
/*
Code script (Always block for logic gate and flip flops
-----------
Always block for logic gates (6)
1-always block for (IN1 NOR IN2).....RESULT D4
2-always block for (IN4).............RESULT D5
3-always block for (D5 OR IN3).......RESULT D6
4-always block for (D4 NAND IN3).....RESULT D1
5-always block for (IN2 NAND IN3)....RESULT D2
6-always block for (IN5 OR D6).......RESULT D3
*/
always@(IN1,IN2)
begin
  D4=~(IN1|IN2);
end

always@(IN4)
begin
  D5=~(IN4);//IN4'
end 

always@(D5,IN3)
begin
  D6=(D5|IN3);
end

always@(D4,IN3)
begin
  D1=~(D4&IN3);
end

always@(IN2,IN3)
begin
  D2=~(IN2&IN3);
end

always@(IN5,D6)
begin
  D3=IN5|D6 ;
end

/*Always block for flip flop (3):
--------------------------------
1-always block for (FIRST FLIP FLOP)
2-always block for (second flip flop)
3-always block for (third flip flop)
*/

always@(posedge CLK)
begin
  OUT1<=D1;
end

always@(posedge CLK)
begin
  OUT2<=D2;
end

always@(posedge CLK)
begin
  OUT3<=D3;
end

endmodule
