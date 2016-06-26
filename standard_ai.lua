
function Jumping(num,adjuster)
if adjuster==nil then
local Jvalue=math.random(27)+53
 Inputs[1]={Y=Jvalue}
 Inputs[2]={Y=Jvalue}
 Inputs[3]={Y=0}
elseif adjuster=="ShortHop" then
 Inputs[1]={Cdown=true}
 Inputs[2]={Cdown=false}
elseif adjuster=="CJump" then
 for i=1,JumpingAnimationF[CharaID[num]] do
 Inputs[i]={Cdown=true} end
 Inputs[JumpingAnimationF[CharaID[num]]+1]={Cdown=false}
elseif adjuster=="TapJump" then
 Inputs[1]={Y=127}
 Inputs[2]={Y=127}
 Inputs[3]={Y=0}
else
 Inputs[1]={Y=adjuster}
 Inputs[2]={Y=adjuster}
 Inputs[3]={Y=0}
end
  if Act[num]==Action[num][0x1f] and ActFC[num]==3 then--着地モーションの3F目
   framecount=0
  elseif Act[num]==Action[num][0x20] and ActFC[num]==7 then--急降下着地
   framecount=0
  elseif Act[num]==Action[num][0xa] and ActFC[num]>7 then--9F以上立ち状態を維持
   framecount=0
  elseif framecount>120 then
   framecount=0
  end
end

function Reversal(num)
local s=memory.readbyte(StunAddr[num])
 if s==1 and Act[num]=="Damaged" then
  framecount=0
  Inputs[1]={Cdown=true}
  Inputs[2]={Cdown=false,Cright=true}
  Inputs[3]={Cright=false}
 end
end

function AirialAttack(num,atk)
 if atk==nil then return AllFalse
 elseif atk=="NA" then return {A=true,X=0,Y=0}
 elseif atk=="UA" then return {A=true,Y=80}
 elseif atk=="DA" then return {A=true,Y=-80}
 elseif atk=="FA" then return {A=true,X=Direction[num]*80}
 elseif atk=="BA" then return {A=true,X=-Direction[num]*80}
 elseif atk=="B" then return {B=true,Y=0}
 elseif atk=="UB" then return {B=true,Y=80}
 elseif atk=="DB" then return {B=true,Y=-80} end
end

function JumpingCordination(num,height,direction,atk,atkframe,atk2,atkframe2)
 local D,ATK,AF,AF2,LP
 if direction=="forward" then D=Direction[num]
 elseif direction=="backward" then D=-Direction[num]
 else D=0 end
 if atkframe~=nil and atkframe=="ASA" then AF=JumpingAnimationF[CharaID[num]]+2
 else AF=atkframe end
 AF2=AF+39
--[[ if atkframe2~=nil and atkframe2=="ASA" and
 JumpingAnimationF[CharaID[num] ]+3>framecount and ActFC[num]==0 then
 AF2=framecount
 else AF=atkframe end]]
 Jumping(num,height)--ジャンプの高さ
 if LandingPred(num,PositionY["P"..num],VelocityY["P"..num],"Ground")~=nil then
  LP=LandingPred(num,PositionY["P"..num],VelocityY["P"..num],"Ground")--滞空するフレーム
  ContInput(JumpingAnimationF[CharaID[num]]+1,math.ceil(LP/2)-5,{X=80*D})
  ContInput(math.floor(LP/2)-5,LP,{X=-80*D})
  AF2=LP-3
 end
 Inputs[JumpingAnimationF[CharaID[num]]+1]={X=80*D}--ジャンプの方向
 Inputs[AF]=AirialAttack(num,atk)--一回目の攻撃
 Inputs[AF+1]=AllFalse
 Inputs[AF2]=AirialAttack(num,atk2)
 Inputs[AF2+1]={Z=true}
end
--[[
local width, height = 160, 2
local PtAddr = 0x00045178
local BottunAddr, RLCAddr, XaxisAddr, YaxisAddr = PtAddr+0x0, PtAddr+0x1, PtAddr+0x2, PtAddr+0x3
wgui.resize(wnd.width+width, wnd.height)

emu.atstop(function()
  wgui.resize(wnd.width, wnd.height)
end)

function byteCheck(value)
  for i = 7, 0, -1 do
    if value>=0x80 then
      aFlag = true
      value = value - 2^i
    elseif value>=0x40 then
      bFlag = true
      value = value - 2^i
    elseif value>=0x20 then
      zFlag = true
      value = value - 2^i
    elseif value>=0x10 then
      sFlag = true
      value = value - 2^i
    elseif value>=0x08 then
      upFlag = true
      value = value - 2^i
    elseif value>=0x04 then
      dnFlag = true
      value = value - 2^i
    elseif value>=0x02 then
      ltFlag = true
      value = value - 2^i
    elseif value>=0x01 then
      rtFlag = true
      value = value - 2^i
    end
  end
end

function DrawInputBottun()
  local fontsize = 6
  wgui.setcolor("black")
    if aFlag == true then wgui.setbk("blue") drawText(fontsize*14, fontsize*8, "A") aFlag = false
    else wgui.setbk("white") drawText(fontsize*14, fontsize*8, "A") end
    if bFlag == true then wgui.setbk("green") drawText(fontsize*12, fontsize*6, "B") bFlag = false
    else wgui.setbk("white") drawText(fontsize*12, fontsize*6, "B") end
    if zFlag == true then wgui.setbk("#444") drawText(fontsize*9, fontsize*9, "Z") zFlag = false
    else wgui.setbk("white") drawText(fontsize*9, fontsize*9, "Z") end
    if sFlag == true then wgui.setbk("red") drawText(fontsize*9, fontsize*4, "S") sFlag = false
    else wgui.setbk("white") drawText(fontsize*9, fontsize*4, "S") end
    if upFlag == true then wgui.setbk("#444") drawText(fontsize*3, fontsize*2, "↑") upFlag = false
    else wgui.setbk("white") drawText(fontsize*3, fontsize*2, "↑") end
    if dnFlag == true then wgui.setbk("#444") drawText(fontsize*3, fontsize*8, "↓") dnFlag = false
    else wgui.setbk("white") drawText(fontsize*3, fontsize*8, "↓") end
    if ltFlag == true then wgui.setbk("#444") drawText(0, fontsize*5, "←") ltFlag = false
    else wgui.setbk("white") drawText(0, fontsize*5, "←") end
    if rtFlag == true then wgui.setbk("#444") drawText(fontsize*6, fontsize*5, "→") rtFlag = false
    else wgui.setbk("white") drawText(fontsize*6, fontsize*5, "→") end
end

function DrawInputRLC()
  local fontsize = 6
  wgui.setcolor("black")
    if zFlag == true then wgui.setbk("#444") drawText(0, 0, "L") zFlag = false
    else wgui.setbk("white") drawText(0, 0, "L") end
    if sFlag == true then wgui.setbk("#444") drawText(fontsize*18, 0, "R") sFlag = false
    else wgui.setbk("white") drawText(fontsize*18, 0, "R") end
    if upFlag == true then wgui.setbk("yellow") drawText(fontsize*16, fontsize*2, "C") upFlag = false
    else wgui.setbk("white") drawText(fontsize*16, fontsize*2, "C") end
    if dnFlag == true then wgui.setbk("yellow") drawText(fontsize*16, fontsize*6, "C") dnFlag = false
    else wgui.setbk("white") drawText(fontsize*16, fontsize*6, "C") end
    if ltFlag == true then wgui.setbk("yellow") drawText(fontsize*14, fontsize*4, "C") ltFlag = false
    else wgui.setbk("white") drawText(fontsize*14, fontsize*4, "C") end
    if rtFlag == true then wgui.setbk("yellow") drawText(fontsize*18, fontsize*4, "C") rtFlag = false
    else wgui.setbk("white") drawText(fontsize*18, fontsize*4, "C") end
end

emu.atvi(function()
--1P
  local BottunAddr, RLCAddr, XaxisAddr, YaxisAddr = PtAddr+0x0, PtAddr+0x1, PtAddr+0x2, PtAddr+0x3
  xorigin, yorigin = wnd.width, 28
  fontsize = 8
  wgui.setfont(fontsize, "メイリオ", "b")
  wgui.setpen("red")
  wgui.setbrush("#DDD")
  local bottun = memory.readbyte(BottunAddr)
  local rlc = memory.readbyte(RLCAddr)
  local xaxis = memory.readbytesigned(XaxisAddr)
  local yaxis = memory.readbytesigned(YaxisAddr)
  drawRect(0, 0, 120, 72)
  drawRect(0, 74, 128, 128)
  wgui.setpen("black")
  wgui.setbrush("#777")
  drawEllipse(0, 75, 127, 127)
  drawLine(64, 74, 0, 127)
  drawLine(0, 74+64, 127, 0)
  --ボタン
  byteCheck(bottun)
  DrawInputBottun()
  byteCheck(rlc)
  DrawInputRLC()
  --スティック
  wgui.setcolor("black")
  wgui.setbk("null")
  drawText(90, 74+64, xaxis)
  drawText(64, 74, yaxis)
    wgui.setpen("blue")
  drawLine(64, 64+74, 0, -yaxis/2)
  drawLine(64, 64+74, xaxis/2, 0)
  wgui.setpen("black")
  wgui.setbrush("red")
  local headsize = 4
  drawEllipse(64+xaxis/2-headsize/2, 64+74-yaxis/2-headsize/2, headsize, headsize)
--2P
  local BottunAddr, RLCAddr, XaxisAddr, YaxisAddr = PtAddr+0x40, PtAddr+0x41, PtAddr+0x4C+2, PtAddr+0x4C+3
  xorigin, yorigin = wnd.width, 0.5*wnd.height
  fontsize = 8
  wgui.setpen("blue")
  wgui.setbrush("#DDD")
  local bottun = memory.readbyte(BottunAddr)
  local rlc = memory.readbyte(RLCAddr)
  local xaxis = memory.readbytesigned(XaxisAddr)
  local yaxis = memory.readbytesigned(YaxisAddr)
  drawRect(0, 0, 120, 72)
  drawRect(0, 74, 128, 128)
  wgui.setpen("black")
  wgui.setbrush("#777")
  drawEllipse(0, 75, 127, 127)
  drawLine(64, 74, 0, 127)
  drawLine(0, 74+64, 127, 0)
  --ボタン
  byteCheck(bottun)
  DrawInputBottun()
  byteCheck(rlc)
  DrawInputRLC()
  --スティック
  wgui.setcolor("black")
  wgui.setbk("null")
  drawText(90, 74+64, xaxis)
  drawText(64, 74, yaxis)
    wgui.setpen("blue")
  drawLine(64, 64+74, 0, -yaxis/2)
  drawLine(64, 64+74, xaxis/2, 0)
  wgui.setpen("black")
  wgui.setbrush("red")
  local headsize = 4
  drawEllipse(64+xaxis/2-headsize/2, 64+74-yaxis/2-headsize/2, headsize, headsize)
end)  ]]