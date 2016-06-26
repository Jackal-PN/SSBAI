

--�R���g���[���[�֌W----------------------------------------------------------
Inputs={}--joypad.set�ɑ��������͌Q
Inputslength = 1
framecount = 0
lateInputs={}
countFlag = false
ColdFlag = {[1]=false,[2]=false,[3]=false,[4]=false}
FreezeFlag = {[1]=false,[2]=false,[3]=false,[4]=false}
ColdX,ColdY = {[1]=0,[2]=0,[3]=0,[4]=0},{[1]=0,[2]=0,[3]=0,[4]=0}
FreezeX,FreezeY = {[1]=0,[2]=0,[3]=0,[4]=0},{[1]=0,[2]=0,[3]=0,[4]=0}
AGFlag = {[1]=false,[2]=false,[3]=false,[4]=false}

AllFalse = {X=0, Y=0, L=false, R=false, Cup=false,
  Cdown=false, Cleft=false, Cright=false,
  A=false, B=false, Z=false, start=false,
  up=false, down=false, left=false, right=false}

function refleshinput(frames)
 for i=0,frames do
  Inputs[i] = AllFalse
 end
end

function FCF(startingF)
if countFlag == false then
framecount = 0 + startingF
countFlag = true
end
end

function ContInput(startframe,endframe,inp)
 for i = startframe,endframe do
 Inputs[i] = inp
 end
end

function setLatency()
for i=0,latency*2+1 do lateInputs[i]=AllFalse end
end

function InputDelay()
 for i=1,latency*2+1 do
  lateInputs[i-1]=lateInputs[i]
 end
end

function TurnFlag(num)--(���蓮��)���䓙�Ɏg���I��/�I�t�@�\�Q
KEY = input.get()
--print(KEY)
 if KEY[StopKEY] and KEY[tostring(num)] and ControlFlag[num] then
  ControlFlag[num] = false
  print("stop")
 end
 if KEY[RemoteKEY] and KEY[tostring(num)] and ControlFlag[num]==false then
  ControlFlag[num] = true
  print("Remoted")
 end
 if KEY[FreezeUntillHitKEY]  and ColdFlag[num]==false then
  ColdX[num] = memory.readfloat(PositionXAddr[num])
  ColdY[num] = memory.readfloat(PositionYAddr[num])
  ColdFlag[num] = true
  print(num.."P Freeze untill Hit")
 end
 if KEY[FreezeKEY] and KEY[tostring(num)] and FreezeFlag[num]==false then
  FreezeX[num] = memory.readfloat(PositionXAddr[num])
  FreezeY[num] = memory.readfloat(PositionYAddr[num])
  FreezeFlag[num] = true
  print(num.."P Frozen")
 end
 if KEY[ChingKEY] and KEY[tostring(num)] and ColdFlag[num] then
  ColdFlag[num] = false
  print("Ching!")
 end
 if KEY[ChingKEY] and KEY[tostring(num)] and FreezeFlag[num] then
  FreezeFlag[num] = false
  print("Ching!")
 end
 if KEY[DrawKEY] and KEY["0"] and drawFlag then
  drawFlag = false
  wgui.resize(wnd.width, wnd.height)
  print("Undrawed")
 end
 if KEY[DrawKEY] and KEY["1"] and drawFlag==false then
  drawFlag = true
  wgui.resize(wnd.width+width, wnd.height+height)
  mapmode=0
  print("Drawed map1")
 elseif KEY[DrawKEY] and KEY["2"] and drawFlag==false then
  drawFlag = true
  wgui.resize(wnd.width+width, wnd.height+height)
  mapmode=1
  print("Drawed map2")
 end
 if KEY[DrawKEY] and KEY["1"] and drawFlag and mapmode~=0 then
  mapmode=0
  print("Drawed map1")
 elseif KEY[DrawKEY] and KEY["2"] and drawFlag and mapmode~=1 then
  mapmode=1
  print("Drawed map2")
 end
 if KEY[ShieldKEY] and KEY["0"] and AGFlag[num] then
  AGFlag[num] = false
  print(num.."P ShieldMODE : OFF")
 end
 if KEY[ShieldKEY] and KEY[tostring(num)] and AGFlag[num]==false then
  AGFlag[num] = true
  print(num.."P ShieldMODE : ON")
 end
end

--�F���ɕK�v�ȃA����R��------------------------------------------------------------
PositionX ={["Pred"]={},["Air-Pred"]={}}
PositionX.GLEdge, PositionX.GREdge = -2318, 2318
PositionX.LPlatLEdge, PositionX.LPlatREdge = -1841, -951
PositionX.RPlatLEdge, PositionX.RPlatREdge = 951, 1892
PositionX.CPlatLEdge, PositionX.CPlatREdge = -570, 570
PositionY={["Ground"]=0, ["LPlat"]=904, ["RPlat"]=907, ["CPlat"]=1542,["1stJump"]={},["2ndJump"]={},["Fall-Pred"]={},["FastFall-Pred"]={}}
PositionZ={}
PositionX.LEdge,PositionX.REdge=-2400,2400--��R
PositionY.LEdge,PositionY.REdge=0,0--���̒l
VelocityX={["Pred"]={},["Air-Pred"]={}}
VelocityY={["1stJump"]={},["2ndJump"]={},["Fall-Pred"]={},["FastFall-Pred"]={}}
VelocityZ={}
SpeedX={["InitialDash"]={},["BrakeForce"]={},["Pred"]={}}
DistanceX,DistanceY,DistanceZ={},{},{}
DistanceX["InitialDash"]={[1]=0,[2]=0,[3]=0,[4]=0}
DistanceX[1],DistanceX[2],DistanceX[3],DistanceX[4]={},{},{},{}
DistanceY[1],DistanceY[2],DistanceY[3],DistanceY[4]={},{},{},{}
DistanceZ[1],DistanceZ[2],DistanceZ[3],DistanceZ[4]={},{},{},{}
landingframe={["CPlat"]={},["RPlat"]={},["LPlat"]={},["Ground"]={}}
Direction={}
Act,ActN,ActFC={},{},{}
Occasion={}

AirFlag={}
function CheckAir(num)
 if PositionY["P"..tostring(num)] == PositionY["Ground"]     or
    PositionY["P"..tostring(num)] == PositionY["RPlat"] or
    PositionY["P"..tostring(num)] == PositionY["LPlat"]  or
    PositionY["P"..tostring(num)] == PositionY["CPlat"] then
    AirFlag[num] = false
 else
    AirFlag[num] = true
 end
end

function GetPosition(num)
PositionX["P"..tostring(num)] = memory.readfloat(PositionXAddr[num])
PositionY["P"..tostring(num)] = memory.readfloat(PositionYAddr[num])
PositionZ["P"..tostring(num)] = memory.readfloat(PositionZAddr[num])
end
function GetVelocity(num)
VelocityX["P"..tostring(num)] = memory.readfloat(VelocityXAddr[num])
VelocityY["P"..tostring(num)] = memory.readfloat(VelocityYAddr[num])
VelocityZ["P"..tostring(num)] = memory.readfloat(VelocityZAddr[num])
end

function GetDirection(num)--�E������1�A��������-1
local D = memory.readdword(DirectionAddr[num])
 if D==1 
then Direction[num]=1 end
 if D==0xFFFFFFFF
then Direction[num]=-1 end
end

function GetJumpLeft(num)
return HighestNumberOfJumps[CharaID[num]]-memory.readbyte(JumpAddr[num])
end

function GetAction(num)
ActN[num]= memory.readdword(ActionAddr[num])
Act[num] = Action[num][ActN[num]]
ActFC[num]= memory.readdword(ActionFrameCounterAddr[num])
end

function GetP2PDistance(num1,num2)
DistanceX[num1][num2]= memory.readfloat(PositionXAddr[num2]) - memory.readfloat(PositionXAddr[num1])
DistanceY[num1][num2]= memory.readfloat(PositionYAddr[num2]) - memory.readfloat(PositionYAddr[num1])
DistanceZ[num1][num2]= memory.readfloat(PositionZAddr[num2]) - memory.readfloat(PositionZAddr[num1])
end

function GetInitialDashSpeeds(ID)
 local IDS,DD = InitialDashSpeed[ID],DashingDeceleration[ID]
 SpeedX["InitialDash"][ID]={}
  for i=1,50 do
   if i <= 6 then
    SpeedX["InitialDash"][ID][i]=IDS
   else
    SpeedX["InitialDash"][ID][i]=IDS - DD*(i-6)
   end
   if IDS - DD*(i-6) < 0 then SpeedX["InitialDash"][ID][i] = 0 end
  end
end

function GetInitialJumpVelocity(num)
 local JHM,BJH,M2J = JumpingHeightMultiplier[CharaID[num]],BaseJumpHeight[CharaID[num]],Multiplierfor2ndJump[CharaID[num]]
 VelocityY["1stJump"][CharaID[num]]={}
 VelocityY["1stJump"][CharaID[num]][JumpingValueforY["Still Short Hop"]] = JumpingValueforY["Still Short Hop"]*JHM+BJH
 VelocityY["1stJump"][CharaID[num]][JumpingValueforY["Moving Short Hop"]] = JumpingValueforY["Moving Short Hop"]*JHM+BJH
 for i=53,80 do VelocityY["1stJump"][CharaID[num]][i] = i*JHM+BJH end
 VelocityY["2ndJump"][CharaID[num]] = (80*JHM+BJH) * M2J
end

function BrakeForcePred(num,Vp)
SpeedX["Pred"][num],VelocityX["Pred"][num]={},{}
 local BF,D = BrakeForce[CharaID[num]],1
 if Vp<0 then D=-1 end
 SpeedX["BrakeForce"][num]=4*BF
 for i=1,30 do
  SpeedX["Pred"][num][i]=math.abs(Vp)-4*BF*i
  if SpeedX["Pred"][num][i] < 0 then SpeedX["Pred"][num][i]=0 end
  VelocityX["Pred"][num][i]=SpeedX["Pred"][num][i]*D
 end
end

function AirForcePred(num,Vp,Pp)--�󒆂�X���x�J�ځA�����̐����̓e�[�u����value�̐����ɂȂ��Ă���B
VelocityX["Air-Pred"][num]={}
PositionX["Air-Pred"][num]={}
 local AR,AA,MAS = XAirResistance[CharaID[num]],XAirAcceleration[CharaID[num]],XMaximumAirSpeed[CharaID[num]]
 for i=-300,300 do
  if Vp+AA*80*i > 0 then VelocityX["Air-Pred"][num][i]=math.range(Vp+AA*80*i,-MAS,MAS)-AR
  elseif Vp+AA*80*i < 0 then VelocityX["Air-Pred"][num][i]=math.range(Vp+AA*80*i,-MAS,MAS)+AR
  else VelocityX["Air-Pred"][num][i]=0 end
 end
 for i=1,300 do
  if i==1 then
   PositionX["Air-Pred"][num][1]=Pp+VelocityX["Air-Pred"][num][1]
  else
   PositionX["Air-Pred"][num][i]=PositionX["Air-Pred"][num][i-1]+VelocityX["Air-Pred"][num][i]
  end
 end
 for i=-1,-300,-1 do
  if i==-1 then
   PositionX["Air-Pred"][num][-1]=Pp+VelocityX["Air-Pred"][num][-1]
  else
   PositionX["Air-Pred"][num][i]=PositionX["Air-Pred"][num][i+1]+VelocityX["Air-Pred"][num][i]
  end
 end
end

function AirFallPred(num,Vp,Pp)--�󒆂�Y���x�J�ڑJ��
VelocityY["Fall-Pred"][num]={}
VelocityY["FastFall-Pred"][num]={}
PositionY["Fall-Pred"][num],PositionY["FastFall-Pred"][num]={},{}
 local FA,MFS,MFFS = YFallAcceleration[CharaID[num]],YMaximumSpeedFall[CharaID[num]],YMaximalFastfallSpeed[CharaID[num]]
 for i=1,300 do
  VelocityY["Fall-Pred"][num][i]=math.minimumize(Vp-FA*i,-MFS)
  VelocityY["FastFall-Pred"][num][i]=Vp-FA*i
  if VelocityY["FastFall-Pred"][num][i]<0 then
   VelocityY["FastFall-Pred"][num][i]=-MFFS
  end
  if Vp-FA*i > 0 then local TopFrame = i end
  if i==1 then
   PositionY["Fall-Pred"][num][1]=Pp+VelocityY["Fall-Pred"][num][1]
  else
   PositionY["Fall-Pred"][num][i]=PositionY["Fall-Pred"][num][i-1]+VelocityY["Fall-Pred"][num][i]
  end
  if i==1 then
   PositionY["FastFall-Pred"][num][1]=Pp+VelocityY["FastFall-Pred"][num][1]
  else
   PositionY["FastFall-Pred"][num][i]=PositionY["FastFall-Pred"][num][i-1]+VelocityY["FastFall-Pred"][num][i]
  end
 end
end

function LandingPred(num,PosY,VelY,landPosY)
local PX,PY=PositionX,PositionY
 AirFallPred(num,VelY,PosY)
  for i=1,300 do
   if i>1 and PY["Fall-Pred"][num][i-1]>PY["CPlat"] and PY["Fall-Pred"][num][i]<PY["CPlat"] then
    landingframe["CPlat"][num]=i
   elseif i>1 and PY["Fall-Pred"][num][i-1]>PY["RPlat"] and PY["Fall-Pred"][num][i]<PY["RPlat"] then
    landingframe["RPlat"][num]=i
   elseif i>1 and PY["Fall-Pred"][num][i-1]>PY["LPlat"] and PY["Fall-Pred"][num][i]<PY["LPlat"] then
    landingframe["LPlat"][num]=i
   elseif i>1 and PY["Fall-Pred"][num][i-1]>PY["Ground"] and PY["Fall-Pred"][num][i]<PY["Ground"] then
    landingframe["Ground"][num]=i end
  end
 if landPosY==nil then
   return landingframe["Ground"][num]
 else
   return landingframe[landPosY][num]
 end
end

--[[function LandingPred(num)
local PX,PY=PositionX,PositionY
landingframe={["CPlat"]={},["RPlat"]={},["LPlat"]={},["Ground"]={}}
 if CharaID[num]==0x08 and GetJumpLeft(num)<6 or CharaID[num]==0x08 and GetJumpLeft(num)<6 then--���D���󒆂ɂ���
  AirFallPred(num,VelocityY["P"..num],PositionY["P"..num])
  AirForcePred(num,VelocityX["P"..num],PositionX["P"..num])  
 elseif GetJumpLeft(num)<2 then--���D����Ȃ�����󒆂ɂ���
  AirFallPred(num,VelocityY["P"..num],PY["P"..num])
  AirForcePred(num,VelocityX["P"..num],PX["P"..num])
  for i=1,300 do
   if i>1 and PY["Fall-Pred"][num][i-1]>PY["CPlat"] and PY["Fall-Pred"][num][i]<PY["CPlat"] then
    landingframe["CPlat"][num]=i
   elseif i>1 and PY["Fall-Pred"][num][i-1]>PY["RPlat"] and PY["Fall-Pred"][num][i]<PY["RPlat"] then
    landingframe["RPlat"][num]=i
   elseif i>1 and PY["Fall-Pred"][num][i-1]>PY["LPlat"] and PY["Fall-Pred"][num][i]<PY["LPlat"] then
    landingframe["LPlat"][num]=i
   elseif i>1 and PY["Fall-Pred"][num][i-1]>PY["Ground"] and PY["Fall-Pred"][num][i]<PY["Ground"] then
    landingframe["Ground"][num]=i end
   --drawCalcEllipse(PX["Air-Pred"][num][i],PY["FastFall-Pred"][num][i])
   --drawCalcEllipse(PX["Air-Pred"][num][-i],PY["FastFall-Pred"][num][i])
   --if PY["Fall-Pred"][num][i]<0 then return end
  end
  if landingframe["CPlat"][num]~=nil then
  drawCalcEllipse(PX["Air-Pred"][num][landingframe["CPlat"][num] ],PY["Fall-Pred"][num][landingframe["CPlat"][num] ])
  drawCalcEllipse(PX["Air-Pred"][num][-landingframe["CPlat"][num] ],PY["Fall-Pred"][num][landingframe["CPlat"][num] ])
  end
 end
end]]

function GetInitialGrabDistance(num)
P = 0
 for i=1,5 do
  P=P+SpeedX["InitialDash"][CharaID[num]][i]
 end
 for i=6,12 do
 BrakeForcePred(num,SpeedX["InitialDash"][CharaID[num]][i])
  P=P-SpeedX["Pred"][num][i]
 end
DistanceX[num]["InitialGrab"]=P
end

function checkLand(num,targetX,targetY)
 
end


--�I�����܂̓R���{����-----------------------------------------------------------
currentcount = 0
currentstun = 0
timelimit = 300
shortage = timelimit
lastAct={[1]="Nothing",[2]="Nothing",[3]="Nothing",[4]="Nothing"}
scounter=0
ss,lastss=0,0
sh,lastsh=0,0
hsFlag, ssFlag, cfFlag = false, false, false

function Combokun()
lastcount = currentcount
laststun = currentstun
currentcount = memory.readbyte(ComboCounterAddr[2])
currentstun = memory.readbyte(StunAddr[2])
 if lastcount ~= currentcount and currentcount ~= 0 then 
  if laststun > 1 then
   print("COMBO:"..currentcount.."      �d�����{"..(laststun-1).."F   �q�b�g�d��"..currentstun-1 .."F".."  "..Act[1]) end
  if laststun <= 1 then
   print("(NEW!!)COMBO:"..currentcount.."      �d�����|"..math.abs(laststun-1-shortage).."F   �q�b�g�d��"..currentstun-1 .."F".."  "..Act[1]) end
 end
Shortager()
end

function Shortager()--�R���{���q����Ȃ��������̏���
 if shortage < timelimit then
  shortage = shortage + 1
  if shortage == timelimit then print("-----------------------------------") end
 end
 if Act[2]==Action[2][0xab] and lastAct[2]~=Action[2][0xab] and lastcount>0 and shortage<=0 then
  print("�R���{���ɒ͂ݐ���     �d�����{"..(laststun-1).."F")
 elseif Act[2]==Action[2][0xb3] and lastAct[2]~=Action[2][0xb3] and lastcount>0 and shortage<=0 then
  print("�R���{���Ƀ_�C�u����     �d�����{"..(laststun-1).."F")
 elseif Act[2]==Action[2][0xab] and lastAct[2]==Action[2][0x9b] then
  print("�K�[�h�d�����ɒ͂ݐ���     �d�����{"..math.ceil(memory.readfloat(ShieldStunAddr[2])-2).."F")
 end
 if shortage>0 and currentcount == 1 and shortage ~= timelimit then
  if lastAct[2]==Action[2][0x49] or lastAct[2]==Action[2][0x4a] or lastAct[2]==Action[2][0x51] then
   print("�󂯐g��萬��")
  elseif  lastAct[2]==Action[2][0x1f] or lastAct[2]==Action[2][0x20]
  or lastAct[2]==Action[2][0x3b] or lastAct[2]==Action[2][0xd7] or lastAct[2]==Action[2][0xd8] 
  or lastAct[2]==Action[2][0xd9] or lastAct[2]==Action[2][0xda] or lastAct[2]==Action[2][0xdb] then
   print("���n��萬��")
  else
   --print("����"..shortage.."F������Όq�����Ă�")
  end
 end
 --if lastcount ~= currentcount and currentcount ~= 0 then
 if CheckHitLag(2)==1 then
  shortage = -currentstun +1
 end
lastAct[2] = Act[2]
end

function CheckHitLag(num) --�q�b�g�X�g�b�v����1��Ԃ�
local lastlag
lastlag=currentlag
local currentlag = memory.readbyte(HitLagAddr[num])
 if currentlag > 0 then
 return 1
 end
return 0
end

--�͂��I�K�[�h�}���ł��I-----------------------------------------------------------
function ShieldCounter(num)--��ѓ���̃q�b�g�X�g�b�v�ɂ��d�����Z�͂Ȃ�
  lastss=ss
  lastsh=sh
  local hs = memory.readbyte(HitLagAddr[num])
  ss = memory.readfloat(ShieldStunAddr[num])
  sh = memory.readbyte(ShieldAddr[num])
  lastscounter = scounter
  if ssFlag == false and ss >= 0 then
   ssFlag = true
  end 
  if ssFlag == true and hsFlag == false and hs ~=0 and Act[num]==Action[num][0x9b] then
   scounter = scounter+1
   hsFlag = true
  end
  if hsFlag and hs == 0 then
   hsFlag = false
  end
   if lastscounter < scounter then
    print("COMBO(SB):"..scounter.."  "..Act[1])
    print("   �d����"..math.minimumize(math.ceil(lastss-1),0).."F   �K�[�h�d��"..math.ceil(ss).."F   �����"..math.ceil(lastsh).."-"..math.ceil(lastsh-sh).."="..math.ceil(sh))
   end
   if Act[num] == Action[num][0x9e] and scounter > 0 then
    print("ShieldBreak!   "..Act[1])
    print("   �d����"..math.minimumize(math.ceil(lastss-1),0).."F")
   end
  if Act[num]~=Action[num][0x9b] or ss == 0 then
   ssFlag = false
   scounter = 0
  end
end

function AutoGuard(num)
 Inputs[1]={Z=true}
   if Act[num] ~= Action[num][0x9b] and sh~=55 then
    memory.writebyte(ShieldAddr[num],55)
   end
 if framecount > 0 then framecount=0 end
end

function ShieldMODE(num)
 if AGFlag[num] then
  ShieldCounter(num)
  AutoGuard(num)
 end
end

--�����Ŏ󂯐g������----------------------------------------------------

function Teching(num,destination)
if Act[num]=="Damaged" and CheckHitLag(num)==1 then TFlag=false end
 if Act[num]=="Damaged" and CheckHitLag(num)==0 then
  if TFlag==false then 
   if destination==nil then
    i=math.random(10)
   elseif destination=="R" then
    i=2
   elseif destination=="L" then
    i=5
   elseif destination=="S" then
    i=8
   elseif destination=="D" then
    i=11
   end
   TFlag=true
  end
   if i==nil then
    refleshinput(2)
    --print("�_�E��")
   elseif i<=3 then 
    Inputs[1]={Z=false,X=127}
    Inputs[2]={Z=true,X=127}
    --print("�E")
   elseif i>=4 and i<=6 then
    Inputs[1]={Z=false,X=-128}
    Inputs[2]={Z=true,X=-128}
    --print("��")
   elseif i>=7 and i<=9 then
    Inputs[1]={Z=false}
    Inputs[2]={Z=true}
    --print("���̏�")
   else 
    --print("�_�E��")
   end
  if framecount > 1 then framecount = 0 end
 end
 if Act[num]==Action[num][0x45] or Act[num]==Action[num][0x46] then
  if framecount > 5 then
   framecount = 0
   i = math.random(10)
   if i<=3 then ContInput(0,2,{A=true}) ContInput(3,5,{A=false})
   elseif i>=4 and i<=6 then ContInput(0,5,{X=-128})
   elseif i>=7 and i<=9 then ContInput(0,5,{X=127})
   else ContInput(0,2,{Z=true}) ContInput(3,5,{Z=false}) end
  end
 end
end

--�Y���X���[--------------------------------------------------------------
--TODO ���炵�����������I��������
DIflag=false

function DI(num,Onum,direction,amount)
 if Act[num]=="Damaged" and ActFC[num]==0 or Act[num]=="No Down Damaged" and ActFC[num]==0 then
  refleshinput(2)
  framecountBeforeDI = framecount
  DIflag = true
  if amount==nil then amount=math.random(80) end
 end
if CheckHitLag(num)==1 then
  local p = PositionX["P"..num]/math.abs(PositionX["P"..num])
  local d = DistanceX[num][Onum]/math.abs(DistanceX[num][Onum])
  if direction==nil then
   Inputs[0]={X=amount*math.random(3)-2,Y=amount*math.random(3)-2}
   Inputs[1]={X=amount*math.random(3)-2,Y=amount*math.random(3)-2}
  elseif direction=="U" then
   Inputs[0]={X=80,Y=amount}
   Inputs[1]={X=-80,Y=amount}
  elseif direction=="D" then
   Inputs[0]={X=80,Y=-amount}
   Inputs[1]={X=-80,Y=-amount}
  elseif direction=="R" then
   Inputs[0]={X=amount,Y=80}
   Inputs[1]={X=amount,Y=-80}
  elseif direction=="L" then
   Inputs[0]={X=-amount,Y=80}
   Inputs[1]={X=-amount,Y=-80}
  elseif direction=="Inside" then
   Inputs[0]={X=-p*amount,Y=80}
   Inputs[1]={X=-p*amount,Y=-80}
  elseif direction=="Outside" then
   Inputs[0]={X=p*amount,Y=80}
   Inputs[1]={X=p*amount,Y=-80}
  elseif direction=="Close" then
   Inputs[0]={X=d*amount,Y=80}
   Inputs[1]={X=d*amount,Y=-80}
  elseif direction=="Away" then
   Inputs[0]={X=-d*amount,Y=80}
   Inputs[1]={X=-d*amount,Y=-80}
  else 
   Inputs[0]={X=amount*math.random(3)-2,Y=amount*math.random(3)-2}
   Inputs[1]={X=amount*math.random(3)-2,Y=amount*math.random(3)-2}
  end
  if Act[num]=="Damaged" or Act[num]=="No Down Damaged"  then
   framecount=framecount+1
   if framecount > 1 then framecount = 0 end
   --print("DIingX : "..Inputs[framecount]["X"].."   DIingY : "..Inputs[framecount]["Y"])
  end
 elseif DIflag then 
  framecount = framecountBeforeDI
  DIflag=false
 end
end

--�|�[�^��--------------------------------------------------------------
function Portal(num)
local targetX,targetY=PositionX["P"..num],PositionY["P"..num]
 if targetX>8500 then
  --memory.writefloat(WritePosXAddr[1],-8500)
  memory.writefloat(WritePosXAddr[num],0)
  memory.writefloat(WritePosYAddr[num],0)
 elseif targetX<-8500 then
  --memory.writefloat(WritePosXAddr[1],8500)
  memory.writefloat(WritePosXAddr[num],0)
  memory.writefloat(WritePosYAddr[num],0)
 end
 if targetY>8000 then
  --memory.writefloat(WritePosYAddr[1],-3000)
  memory.writefloat(WritePosXAddr[num],0)
  memory.writefloat(WritePosYAddr[num],0)
 elseif targetY<-3000 then
  --memory.writefloat(WritePosYAddr[1],8000)
  memory.writefloat(WritePosXAddr[num],0)
  memory.writefloat(WritePosYAddr[num],0)
 end
end

--���W�Œ�----------------------------------------------------------

function Echoes(num)
if ColdFlag[num] then
 if CheckHitLag(num) == 1 or Act[num] == Action[num][0xab] or Act[num] == Action[num][0xb5] then ColdFlag[num]=false end
 memory.writefloat(WritePosXAddr[num],ColdX[num])
 memory.writefloat(WritePosYAddr[num],ColdY[num]) end
if FreezeFlag[num] then
 memory.writefloat(WritePosXAddr[num],FreezeX[num])
 memory.writefloat(WritePosYAddr[num],FreezeY[num]) end 
end

--�v�Z�p---------------------------------------------------------------
function OffsettingFrame(percent)
return math.ceil(percent*1.75+4)
end

function GuardStunFrame(percent)
return math.ceil(percent*1.75+3)
end

function HitlagFrame(percent)
return math.floor(percent/3+3)
end

function ElectroHitlagFrame(percent)
return math.floor(2*percent/9+5)
end

function knockbackVelocity(percent,RE,RA,RF,health,weight)
local h,p,ratio=health,percent,1
 if RF==0 then
  return ((((((h*0.1)+(h*percent*0.05))*weight*1.4)+18)*RE)+RA)*ratio
 else
  return (((((1+(10*RF*0.05))*weight*1.4)+18)*RE)+RA)*ratio
 end
end

function HitStunFrame(knockback)
return  math.floor(knockback/1.875)
end

function synthVect(Vx,Vy)
return (Vx^2 + Vy^2)^(1/2)
end

function math.round(num, idp)-- �l�̌ܓ��B����num���A����idp���Ŋۂ߂�B
 if idp and idp>0 then
  local mult = 10^idp
  return math.floor(num * mult + 0.5) / mult
 end
 return math.floor(num + 0.5)
end

function math.maximize(num,max)--����num���ő�lmax�Ŋۂ߂�B
 if num > max then
  return max
 end
 return num
end

function math.minimumize(num,min)--����num���ŏ��lmin�Ŋۂ߂�B
 if num < min then
  return min
 end
 return num
end

function math.range(num,min,max)--min<=num<=max
  return math.minimumize(math.maximize(num,max),min)
end

function checkWithin(num,min,max)
 if num>=min and num<=max then
  return true
 else
  return false
 end
end

function changeprint(num)
local lastnum = currentnum
 currentnum = num
if lastnum~=nil and lastnum ~= currentnum then print(math.round(num, 5)) end
end