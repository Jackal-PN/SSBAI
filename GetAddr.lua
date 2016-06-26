--[[
TODO

カメラ情報（Hrizontal:2byte,vertical:2byte,other4camera:float?）
技のダメージとかヒットボックスの座標とかあのへん
飛び道具の座標,速度
投擲ダメージ倍率、投擲速度


]]


--ポインタのアドレスを取得
mainpointAddr =0xA10F0
mainpoint = memory.readdword(mainpointAddr)
subpointAddr = "0x"..string.sub( string.format( "%x", mainpoint+68 ), 3 , 8  )
subpoint = memory.readdword(subpointAddr)
pointAddr = "0x"..string.sub( string.format( "%x", subpoint+128 ), 3 , 8  )
if pointAddr == "0x" then print("対戦画面になってから読み込んでください") end
-- アドレス宣言
ShieldAddr,HitLagAddr,ShieldStunAddr ={},{},{}
ComboCounterAddr, ComboDamageAddr,StunAddr ={},{},{}
ShieldAddr[2],HitLagAddr[2],ShieldStunAddr[2] = 0x266267,0x266273,0x266d64
ComboCounterAddr[2], ComboDamageAddr[2],StunAddr[2] = 0xa2db3,0xa2daf,0x266d4b
PositionXAddr,PositionYAddr,PositionZAddr = {},{},{}--float
DirectionAddr={}--dword
VelocityXAddr,VelocityYAddr,VelocityZAddr = {},{},{}--float
ShadowYAddr = {}--byte
JumpAddr = {}--byte
HealthAddr = {} --byte
ShieldHealthAddr = {} --byte
--StunAddr = {} --byte
--HitLagAddr = {} --byte
ActionFrameCounterAddr = {} --dword?
ActionAddr = {}--byte
CharaIDAddr = {}--byte

--プレイヤーごとに読み込むアドレスを定義

for i=1,4 do
p,d = pointAddr,0xB50
PositionXAddr[i] = p +d*(i-1)
PositionYAddr[i] = p+0x4 +d*(i-1)
PositionZAddr[i] = p+0x8 +d*(i-1)
DirectionAddr[i] = p-0x3C +d*(i-1)
--VelocityXAddr[i] = p-0x38 +d*(i-1)
--VelocityYAddr[i] = p-0x34 +d*(i-1)
--VelocityZAddr[i] = p-0x30 +d*(i-1)
VelocityXAddr[i] = p+0xc +d*(i-1)
VelocityYAddr[i] = p+0x10 +d*(i-1)
VelocityZAddr[i] = p+0x14 +d*(i-1)
ShadowYAddr[i] = p+0x6C +d*(i-1)
JumpAddr[i] = p+0xC8 +d*(i-1)
HealthAddr[i] = p-0x54 +d*(i-1)
ShieldHealthAddr[i] = p-0x4C +d*(i-1)
--StunAddr[i] = p +0xA98 +d*(i-1)間違ってるっぽい
--HitLagAddr[i] = p-0x40 +d*(i-1)こっちも
ActionFrameCounterAddr[i]= p-0x64 +d*(i-1)
ActionAddr[i]= p-0x5C +d*(i-1)
CharaIDAddr[i] = p-0x75 +d*(i-1)
end
StageIDAddr=0x0A2CC9--byte


--第一引数＝データの大きさ、第二引数＝読み取った値を代入する場所、第三引数＝読み取るアドレス
--読み取った値に変化があった場合「値（16進法）とその説明（作ってない場合nil）」が出力される
function MonitData(read,targetData,targetAddr)
  last = current or memory[read](targetAddr)
  current = memory[read](targetAddr)
 if last ~= current then
  local DATA = string.format("%x",current)
  print(DATA,targetData[current])
 end
end