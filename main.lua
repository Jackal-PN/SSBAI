--[[MupenLua
インクルードするファイルは同じ階層に入れてね。
プププランドで対戦始めてから起動してね。


できること
・2Pの操作制御
・マウスで移動だったり、ヒットするまで固定させたり座標制御
・コンボ、シールド関連のテキストデータ出力


できないこと
・判定可視化チート等は起動タイミングに制約があるため、必要に応じで個別または多重起動してください
・ヒットストップ中だったり、受け身中のstateをloadしてしまうとエラー吐くかもしれません

]]
--ショートカットキーの設定----------------------------------

--制御OFF(このキーと「2」を同時押し)
StopKEY="S"
--制御ON(このキーと「2」を同時押し)
RemoteKEY="R"
--ヒットするまで座標を固定(2P限定)
FreezeUntillHitKEY="H"
--座標を固定(このキーと「2」を同時押し)
FreezeKEY="F"
--座標固定の解除(このキーと「2」を同時押し)
ChingKEY="C"
--描画ON/OFF(このキーと「1or2」を同時押し、OFFしたいときはこのキーと「0」を同時押し)
DrawKEY="D"
--シールドモードON/OFF(このキーと「2」を同時押し、OFFしたいときはこのキーと「0」を同時押し)
ShieldKEY="G"

--include--------------------------------------------
require("define")
require("defineStatus")
require("defineDrawfunction")
require("GetAddr")
require("falcon_ai")
require("standard_ai")
require("map_v3")
require("cheat")

--initialize（初期化）-----------------------------------
--操作系
latency=2--1Pの操作遅延フレーム
setLatency()
refleshinput(300)
ControlFlag = {[1]=false,[2]=false,[3]=false,[4]=false}--2PのON/OFF切り替えはR+2/S+2、他同様
PN = 2 --AIが操作するポート番号
OPN = 1 --AIが対峙するプレイヤーのポート番号
AGFlag[PN]=false--オートガードの設定、ON/OFFはG+num/G+0(ゼロ)キーで切り替え
TechD = nil--受け身方向。nilでランダム、"R"で右、"L"で左、"S"でその場、"D"でダウン、ただしアルファベットは必ず”（ダブルクォート）で囲むこと
--描画関係
StageID=memory.readbyte(StageIDAddr)
drawFlag = false--マップ描画の設定、ON/OFFはD+num/D+0(ゼロ)キーで切り替え
if drawFlag then
wgui.resize(wnd.width+width, wnd.height+height)
--mapmode = 1
end

--ゲームの基本情報を取得したりするあれ
defineStats(PN)--ゲーム側で使われるアニメーションIDの情報テーブルを定義
defineStats(OPN)
AddCharactersAction(PN)--Actionテーブル（Action[]={}）にキャラ固有の状態テーブルを追加
AddCharactersAction(OPN)

GetInitialDashSpeeds(CharaID[PN])--50F目までのステップの速さを計算しておく
GetInitialDashSpeeds(CharaID[OPN])
GetInitialJumpVelocity(PN)--全種類の地上ジャンプ及び2段ジャンプのY初速度を計算しておく
GetInitialJumpVelocity(OPN)
GetInitialGrabDistance(PN)--ステップ初速度が減衰し始める前にブレーキ行動を起こした時の移動距離を計算しておく
GetInitialGrabDistance(OPN)

--mainloop-------------------------------------------------
emu.atvi(function()--60F/sで動作
TurnFlag(PN)--キーボードSキー＋PN(AIが操作するポート番号)で操作制御OFF、Rキー＋1～4で操作制御ON、Dキー＋0～1で描画ON、3でOFF
--TurnFlag(OPN)
GetPosition(PN)
GetPosition(OPN)
GetVelocity(PN)
GetVelocity(OPN)
GetAction(PN)
GetAction(OPN)
GetDirection(PN)
GetDirection(OPN)
GetOccasion(PN)
GetOccasion(OPN)
GetP2PDistance(PN,OPN)
Combokun()--コンボが繋がっただとか何F硬直だとか受け身狩れたとかの情報をコンソールウィンドウに出力
--print(ActFC[PN])
--print(memory.readbyte(StunAddr[2]))
--BrakeForcePred(OPN,VelocityX["P"..PN])
--changeprint(GetJumpLeft(PN))
--print("VX"..math.round(VelocityX["P"..OPN],3))
--AirForcePred(PN,VelocityX["P"..PN])
--print("Pred"..VelocityX["Air-Pred"][PN][-1])
--print("Vx"..VelocityX["P"..PN])
--print("Vy"..VelocityY["P"..PN])

--print("2P X座標　：　"..math.round(PositionX["P2"]))
--print("2P Y座標　：　"..math.round(PositionY["P2"]))
--動作生成---------------------------------------
--print(BlastLine[memory.readbyte(StageIDAddr)]["-X"])
--changeprint(VelocityY["P1"])
--print(memory.readbyte(StageIDAddr))
--Diet(2)
--MonitData("readdword",Action[PN],ActionAddr[PN])--現在どのモーションなのかを変更があり次第出力
--MonitData("readdword",Action[OPN],ActionAddr[OPN])--
if Act[OPN]=="Damaged" then--攻撃が当たった
--GeneralCombo(PN,OPN)
else
 if Act[PN]==Action[PN][0x09] then --復活台にいる
  refleshinput(300)
  framecount=0
  Inputs[1]={L=true,Y=0}
  Inputs[2]={Y=-127}
  Inputs[3]={Y=-127}
  Inputs[4]={A=true,Y=0}
  Inputs[5]={Z=true}
  Inputs[6]={Z=false}
 end
 if Occasion[PN]=="Right-Side" or Occasion[PN]=="Left-Side" or Occasion[PN]=="Down-Side" then--場外にいる
  Recovery(PN)
 else
  if Occasion[PN]=="Ground" then--地上にいる
   refleshinput(300)
   --DashRisingElbowMan(PN,OPN)
   --Jumping(PN,"StillShortHop")
  -- JumpingCordination(PN,"CJump","backward","FA","ASA","UA")
  elseif Occasion[PN]=="RPlat" or Occasion[PN]=="LPlat" or Occasion[PN]=="CPlat" then--台上にいる
  refleshinput(300)
  --DropPlat(PN)
  end
 end
end

ShieldMODE(PN)--オートガード、シールド自動回復、ガード関連の情報をコンソールウィンドウに出力
Teching(PN,TechD)--AIに受け身を取らせたりダウンさせたりする
DI(PN,OPN,"Away",math.random(5)+5)--ずらす。引数は順に、ずらす側のポート番号、攻撃側のポート番号、方向("U","D","R","L","Inside","Outside","Close","Away")、ずらし量(0~80)
Reversal(PN)
framecount=framecount+1-CheckHitLag(PN)
--print(framecount)
if framecount >299 then framecount=0 end


--描画----------------------------------
if drawFlag then
 drawMap()
 changePosition()--マップ内をクリック、右クリックすることでキャラを移動させる
 --drawCalcRect(PositionX["P"..PN]-DistanceX[PN][OPN],PositionY["P"..PN],DistanceX[PN][OPN]*2,30)
 --LandingPred(PN)
 end
--座標書き換え系
Echoes(PN)--固定する
Echoes(OPN)
--Portal(PN)--ワープさせる
--Portal(OPN)
end)

--効果器-----------------------------------------
emu.atinput(function()--120FrameperSec
  if ControlFlag[1] then
    joypad.set(1, Inputs[framecount])
  elseif ControlFlag[2] then
    joypad.set(2, Inputs[framecount])
  elseif ControlFlag[3] then
    joypad.set(3, Inputs[framecount])
  elseif ControlFlag[4] then
    joypad.set(4, Inputs[framecount])
  end
  InputDelay()
  lateInputs[latency*2] = joypad.get(1)
  --print(lateInputs[latency])
  --print(lateInputs[latency-1])
  joypad.set(1,lateInputs[0])
end)