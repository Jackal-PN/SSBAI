--[[
TODO

�J�������iHrizontal:2byte,vertical:2byte,other4camera:float?�j
�Z�̃_���[�W�Ƃ��q�b�g�{�b�N�X�̍��W�Ƃ����̂ւ�
��ѓ���̍��W,���x
�����_���[�W�{���A�������x


]]


--�|�C���^�̃A�h���X���擾
mainpointAddr =0xA10F0
mainpoint = memory.readdword(mainpointAddr)
subpointAddr = "0x"..string.sub( string.format( "%x", mainpoint+68 ), 3 , 8  )
subpoint = memory.readdword(subpointAddr)
pointAddr = "0x"..string.sub( string.format( "%x", subpoint+128 ), 3 , 8  )
if pointAddr == "0x" then print("�ΐ��ʂɂȂ��Ă���ǂݍ���ł�������") end
-- �A�h���X�錾
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

--�v���C���[���Ƃɓǂݍ��ރA�h���X���`

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
--StunAddr[i] = p +0xA98 +d*(i-1)�Ԉ���Ă���ۂ�
--HitLagAddr[i] = p-0x40 +d*(i-1)��������
ActionFrameCounterAddr[i]= p-0x64 +d*(i-1)
ActionAddr[i]= p-0x5C +d*(i-1)
CharaIDAddr[i] = p-0x75 +d*(i-1)
end
StageIDAddr=0x0A2CC9--byte


--���������f�[�^�̑傫���A���������ǂݎ�����l��������ꏊ�A��O�������ǂݎ��A�h���X
--�ǂݎ�����l�ɕω����������ꍇ�u�l�i16�i�@�j�Ƃ��̐����i����ĂȂ��ꍇnil�j�v���o�͂����
function MonitData(read,targetData,targetAddr)
  last = current or memory[read](targetAddr)
  current = memory[read](targetAddr)
 if last ~= current then
  local DATA = string.format("%x",current)
  print(DATA,targetData[current])
 end
end