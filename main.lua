--[[MupenLua
�C���N���[�h����t�@�C���͓����K�w�ɓ���ĂˁB
�v�v�v�����h�őΐ�n�߂Ă���N�����ĂˁB


�ł��邱��
�E2P�̑��쐧��
�E�}�E�X�ňړ���������A�q�b�g����܂ŌŒ肳��������W����
�E�R���{�A�V�[���h�֘A�̃e�L�X�g�f�[�^�o��


�ł��Ȃ�����
�E��������`�[�g���͋N���^�C�~���O�ɐ��񂪂��邽�߁A�K�v�ɉ����Ōʂ܂��͑��d�N�����Ă�������
�E�q�b�g�X�g�b�v����������A�󂯐g����state��load���Ă��܂��ƃG���[�f����������܂���

]]
--�V���[�g�J�b�g�L�[�̐ݒ�----------------------------------

--����OFF(���̃L�[�Ɓu2�v�𓯎�����)
StopKEY="S"
--����ON(���̃L�[�Ɓu2�v�𓯎�����)
RemoteKEY="R"
--�q�b�g����܂ō��W���Œ�(2P����)
FreezeUntillHitKEY="H"
--���W���Œ�(���̃L�[�Ɓu2�v�𓯎�����)
FreezeKEY="F"
--���W�Œ�̉���(���̃L�[�Ɓu2�v�𓯎�����)
ChingKEY="C"
--�`��ON/OFF(���̃L�[�Ɓu1or2�v�𓯎������AOFF�������Ƃ��͂��̃L�[�Ɓu0�v�𓯎�����)
DrawKEY="D"
--�V�[���h���[�hON/OFF(���̃L�[�Ɓu2�v�𓯎������AOFF�������Ƃ��͂��̃L�[�Ɓu0�v�𓯎�����)
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

--initialize�i�������j-----------------------------------
--����n
latency=2--1P�̑���x���t���[��
setLatency()
refleshinput(300)
ControlFlag = {[1]=false,[2]=false,[3]=false,[4]=false}--2P��ON/OFF�؂�ւ���R+2/S+2�A�����l
PN = 2 --AI�����삷��|�[�g�ԍ�
OPN = 1 --AI���Λ�����v���C���[�̃|�[�g�ԍ�
AGFlag[PN]=false--�I�[�g�K�[�h�̐ݒ�AON/OFF��G+num/G+0(�[��)�L�[�Ő؂�ւ�
TechD = nil--�󂯐g�����Bnil�Ń����_���A"R"�ŉE�A"L"�ō��A"S"�ł��̏�A"D"�Ń_�E���A�������A���t�@�x�b�g�͕K���h�i�_�u���N�H�[�g�j�ň͂ނ���
--�`��֌W
StageID=memory.readbyte(StageIDAddr)
drawFlag = false--�}�b�v�`��̐ݒ�AON/OFF��D+num/D+0(�[��)�L�[�Ő؂�ւ�
if drawFlag then
wgui.resize(wnd.width+width, wnd.height+height)
--mapmode = 1
end

--�Q�[���̊�{�����擾�����肷�邠��
defineStats(PN)--�Q�[�����Ŏg����A�j���[�V����ID�̏��e�[�u�����`
defineStats(OPN)
AddCharactersAction(PN)--Action�e�[�u���iAction[]={}�j�ɃL�����ŗL�̏�ԃe�[�u����ǉ�
AddCharactersAction(OPN)

GetInitialDashSpeeds(CharaID[PN])--50F�ڂ܂ł̃X�e�b�v�̑������v�Z���Ă���
GetInitialDashSpeeds(CharaID[OPN])
GetInitialJumpVelocity(PN)--�S��ނ̒n��W�����v�y��2�i�W�����v��Y�����x���v�Z���Ă���
GetInitialJumpVelocity(OPN)
GetInitialGrabDistance(PN)--�X�e�b�v�����x���������n�߂�O�Ƀu���[�L�s�����N���������̈ړ��������v�Z���Ă���
GetInitialGrabDistance(OPN)

--mainloop-------------------------------------------------
emu.atvi(function()--60F/s�œ���
TurnFlag(PN)--�L�[�{�[�hS�L�[�{PN(AI�����삷��|�[�g�ԍ�)�ő��쐧��OFF�AR�L�[�{1�`4�ő��쐧��ON�AD�L�[�{0�`1�ŕ`��ON�A3��OFF
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
Combokun()--�R���{���q���������Ƃ���F�d�����Ƃ��󂯐g��ꂽ�Ƃ��̏����R���\�[���E�B���h�E�ɏo��
--print(ActFC[PN])
--print(memory.readbyte(StunAddr[2]))
--BrakeForcePred(OPN,VelocityX["P"..PN])
--changeprint(GetJumpLeft(PN))
--print("VX"..math.round(VelocityX["P"..OPN],3))
--AirForcePred(PN,VelocityX["P"..PN])
--print("Pred"..VelocityX["Air-Pred"][PN][-1])
--print("Vx"..VelocityX["P"..PN])
--print("Vy"..VelocityY["P"..PN])

--print("2P X���W�@�F�@"..math.round(PositionX["P2"]))
--print("2P Y���W�@�F�@"..math.round(PositionY["P2"]))
--���쐶��---------------------------------------
--print(BlastLine[memory.readbyte(StageIDAddr)]["-X"])
--changeprint(VelocityY["P1"])
--print(memory.readbyte(StageIDAddr))
--Diet(2)
--MonitData("readdword",Action[PN],ActionAddr[PN])--���݂ǂ̃��[�V�����Ȃ̂���ύX�����莟��o��
--MonitData("readdword",Action[OPN],ActionAddr[OPN])--
if Act[OPN]=="Damaged" then--�U������������
--GeneralCombo(PN,OPN)
else
 if Act[PN]==Action[PN][0x09] then --������ɂ���
  refleshinput(300)
  framecount=0
  Inputs[1]={L=true,Y=0}
  Inputs[2]={Y=-127}
  Inputs[3]={Y=-127}
  Inputs[4]={A=true,Y=0}
  Inputs[5]={Z=true}
  Inputs[6]={Z=false}
 end
 if Occasion[PN]=="Right-Side" or Occasion[PN]=="Left-Side" or Occasion[PN]=="Down-Side" then--��O�ɂ���
  Recovery(PN)
 else
  if Occasion[PN]=="Ground" then--�n��ɂ���
   refleshinput(300)
   --DashRisingElbowMan(PN,OPN)
   --Jumping(PN,"StillShortHop")
  -- JumpingCordination(PN,"CJump","backward","FA","ASA","UA")
  elseif Occasion[PN]=="RPlat" or Occasion[PN]=="LPlat" or Occasion[PN]=="CPlat" then--���ɂ���
  refleshinput(300)
  --DropPlat(PN)
  end
 end
end

ShieldMODE(PN)--�I�[�g�K�[�h�A�V�[���h�����񕜁A�K�[�h�֘A�̏����R���\�[���E�B���h�E�ɏo��
Teching(PN,TechD)--AI�Ɏ󂯐g����点����_�E���������肷��
DI(PN,OPN,"Away",math.random(5)+5)--���炷�B�����͏��ɁA���炷���̃|�[�g�ԍ��A�U�����̃|�[�g�ԍ��A����("U","D","R","L","Inside","Outside","Close","Away")�A���炵��(0~80)
Reversal(PN)
framecount=framecount+1-CheckHitLag(PN)
--print(framecount)
if framecount >299 then framecount=0 end


--�`��----------------------------------
if drawFlag then
 drawMap()
 changePosition()--�}�b�v�����N���b�N�A�E�N���b�N���邱�ƂŃL�������ړ�������
 --drawCalcRect(PositionX["P"..PN]-DistanceX[PN][OPN],PositionY["P"..PN],DistanceX[PN][OPN]*2,30)
 --LandingPred(PN)
 end
--���W���������n
Echoes(PN)--�Œ肷��
Echoes(OPN)
--Portal(PN)--���[�v������
--Portal(OPN)
end)

--���ʊ�-----------------------------------------
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