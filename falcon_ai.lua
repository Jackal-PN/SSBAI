
function SHATK(num1,num2,sX,sY)
local dist=DistanceX[num1][num2]/math.abs(DistanceX[num1][num2])
if PositionY["P"..num1]==0 
and framecount~=0 
and Act[num1]~=Action[num1][0x14]
and Act[num1]~=Action[num1][0xd1]
and Act[num1]~=Action[num1][0xd2]
and Act[num1]~=Action[num1][0xd3]
and Act[num1]~=Action[num1][0xd4]
and Act[num1]~=Action[num1][0xd5]
then framecount=0 end
ContInput(0,30,{X=dist*127})
 Inputs[1]={Cdown=true}
 Inputs[2]={Cdown=false}
 Inputs[5]={A=true,X=dist*sX,Y=sY}
 Inputs[6]={A=false}
 Inputs[18]={Z=true}
 Inputs[19]={Z=false}
end

function DashRisingElbowMan(num1,num2)
local dist=DistanceX[num1][num2]/math.abs(DistanceX[num1][num2])
 if DistanceX[num1][num2] < 620 and DistanceX[num1][num2] > -620 then--近い
  if framecount >2 then framecount=0 end
  refleshinput(30)
  Inputs[1]={X=dist*127,Y=127}
  Inputs[2]={A=true,X=0,Y=127}
  Inputs[3]={A=false,Y=0}
  if Occasion[num2]=="CPlat" then
   Inputs[1]={Y=127}
   Inputs[2]={Y=127}
   Inputs[3]={Y=0}
   Inputs[12]={A=true,X=0,Y=127}
   Inputs[13]={A=false,Y=0}
  end
  if Occasion[num2]=="RPlat" and checkWithin(PositionX["P"..num1],PositionX["RPlatLEdge"],PositionX["RPlatREdge"])
   or Occasion[num2]=="LPlat" and checkWithin(PositionX["P"..num1],PositionX["LPlatLEdge"],PositionX["LPlatREdge"]) then
   Inputs[1]={Y=56}
   Inputs[2]={Y=56}
   Inputs[3]={Y=0}
   Inputs[12]={A=true,X=0,Y=127}
   Inputs[13]={A=false,Y=0}
   Inputs[18]={Z=true}
   Inputs[19]={Z=false}
  end
 elseif math.abs(DistanceX[num1][num2])>DistanceX[num1]["InitialGrab"]then--離れている
  refleshinput(30)
  ContInput(0,30,{X=dist*127})
 end
  if Act[num1]==Action[num1][0x1f] and ActFC[num1]==2 then--着地モーションの3F目
   framecount=0
   refleshinput(2)
  end
  if Act[num1]==Action[num1][0x20] and ActFC[num1]==6 then--急降下着地の7F目
   framecount=0
   refleshinput(2)
  end
  if Act[num1]==Action[num1][0xb] or
     Act[num1]==Action[num1][0xc] or Act[num1]==Action[num1][0xd] then--歩き
   framecount=0
   refleshinput(1)
  end
 if framecount >29 then framecount=0 end
end

function DropPlat(num)
 if Act[num]=="Standing" then framecount=0  end
  if framecount==0 then
   refleshinput(30)
   Inputs[1]={Z=true,Y=-127}
   Inputs[2]={Z=true,Y=-127}
   Inputs[3]={Z=true,Y=-127}
   Inputs[4]={Z=false,Y=0}
   Inputs[5]={Z=false,Y=-127}
   if DistanceX[num][OPN] < 700 and DistanceX[num][OPN] > -700 then
    Inputs[6]={A=true,X=0,Y=127}
    Inputs[7]={A=false,Z=true,Y=0}
    Inputs[8]={Z=false,Y=0}
   end
  end
end

function GetOccasion(num)
local PX,PY = PositionX["P"..tostring(num)],PositionY["P"..tostring(num)]
 if PX <= PositionX["GREdge"] and PX >= PositionX["GLEdge"]  then--場内にいる
  if PY==PositionY["Ground"] then
   Occasion[num]="Ground"
  elseif PY==PositionY["LPlat"] then
   Occasion[num]="LPlat"
  elseif PY==PositionY["RPlat"] then
   Occasion[num]="RPlat"
  elseif PY==PositionY["CPlat"] then
   Occasion[num]="CPlat"
  elseif PY<PositionY["Ground"] then
   Occasion[num]="Down-Side"
  else
   Occasion[num]="Air"
 end
 else--場外にいる
  if PX > PositionX["GREdge"] then
   Occasion[num]="Right-Side"
  elseif PX < PositionX["GLEdge"] then
   Occasion[num]="Left-Side"
  else
   Occasion[num]="Down-Side"
  end
 end
 --[[if Occasion[num]=="Air" or Occasion[num]=="Right-Side" or Occasion[num]=="Left-Side" then
 local Airea={}
   if PX < PositionX["GLEdge"] then
    if PY>PositionY["Ground"] and PY<PositionY["LPlat"] then
     Airea[num]=0
    elseif PY>PositionY["LPlat"] and PY<PositionY["CPlat"] then
     Airea[num]=0
    elseif PY>PositionY["CPlat"] then
     Airea[num]=0
    end
   elseif PX>=PositionX["GLEdge"] and PX<PositionX["LPlatLEdge"] then
    if PY>PositionY["Ground"] and PY<PositionY["LPlat"] then
     Airea[num]=0
    elseif PY>PositionY["LPlat"] and PY<PositionY["CPlat"] then
     Airea[num]=0
    elseif PY>PositionY["CPlat"] then
     Airea[num]=0
    end
   end
 end]]
end

function Recovery(num)
local dist = -PositionX["P"..num]/math.abs(PositionX["P"..num])
if Occasion[num]=="Down-Side" then dist=-dist end
 ContInput(0,30,{X=dist*127})
  if VelocityY["P"..num]<= YMaximumSpeedFall[CharaID[num] ] and GetJumpLeft(num) >= 1 then
   Inputs[1]={Cdown=true,X=dist*127}
   Inputs[2]={Cdown=false,X=dist*127}
  elseif VelocityY["P"..num]<= YMaximumSpeedFall[CharaID[num] ] and GetJumpLeft(num)==0 and math.abs(PositionX["P"..num])<4500 then
   Inputs[1]={B=true,X=dist*127,Y=127}
   Inputs[2]={B=false,X=dist*127,Y=0}
  end
  if Act[num]=="Grabbing Edge" then
   if framecount >3 then framecount=0 end
   local i=math.random(4)
   if i==1 then
    Inputs[1]={Z=true}
    Inputs[2]={Z=false}
   elseif i==2 then
    Inputs[1]={A=true}
    Inputs[2]={A=false}
   elseif i==3 then
    Inputs[1]={X=127}
    Inputs[2]={X=0}
   elseif i==4 then
    Inputs[1]={X=-127}
    Inputs[2]={X=0}
   end
  end
 if framecount >30 then framecount=0 end
end

function GeneralCombo(num1,num2)
local PX,PY = PositionX["P"..tostring(num1)],PositionY["P"..tostring(num1)]
local OPX,OPY = PositionX["P"..tostring(num2)],PositionY["P"..tostring(num2)]
local A,D = Act[num],Direction[num]
local dX,dY = DistanceX[num1][num2],DistanceY[num1][num2]
if CheckHitLag(num1)==1 then framecount=0 end

Inputs[1]={L=true}
Inputs[2]={L=false}
if framecount >3 then framecount=0 end

end
