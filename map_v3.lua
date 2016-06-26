--[[
TODO
�Q�[����ʂ̕`��͈͂��}�b�v�̕��ɕ`�悷��

]]



 -- XY���W���������p----
  -- �e�A�h���X�̃|�C���^�w��
  ptp1xdAddr, ptp1ydAddr = pointAddr+0x0-0x8,pointAddr+0x0-0x8
  ptp2xdAddr, ptp2ydAddr = pointAddr+0xB50-0x8,pointAddr+0xB50-0x8
  -- �|�C���^�w��2
  p1xdpt = memory.readdword(ptp1xdAddr)
  p1ydpt = memory.readdword(ptp1xdAddr) + 4
  p2xdpt = memory.readdword(ptp2xdAddr)
  p2ydpt = memory.readdword(ptp2xdAddr) + 4
  -- �|�C���^����A�h���X�w��
  WritePosXAddr={}
  WritePosYAddr={}
  WritePosXAddr[1] = "0x"..string.sub( string.format( "%x", p1xdpt ), 3 , 8  )
  WritePosYAddr[1] = "0x"..string.sub( string.format( "%x", p1ydpt ), 3 , 8  )
  WritePosXAddr[2] = "0x"..string.sub( string.format( "%x", p2xdpt ), 3 , 8  )
  WritePosYAddr[2] = "0x"..string.sub( string.format( "%x", p2ydpt ), 3 , 8  )


function drawMap()
BLmX = BlastZone[StageID]["-X"]
BLpX = BlastZone[StageID]["X"]
BLmY = BlastZone[StageID]["-Y"]
BLpY = BlastZone[StageID]["Y"]
if mapmode==0 then  MS=1 
 scale = 0.65*1/(BLpX-BLmX)*wnd.width
end
if mapmode==1 then  MS=1/3
 scale = 3/27500*wnd.width
end
  fontsize = 12
  local p1x,p1y,p1z = PositionX["P1"],PositionY["P1"],PositionZ["P1"]
  local p2x,p2y,p2z = PositionX["P2"],PositionY["P2"],PositionZ["P2"]  
  --local vx = memory.readfloat(velxAddr)
  --local vy = memory.readfloat(velyAddr)
  --local vz = memory.readfloat(velzAddr)
  wgui.setcolor("blue")
  wgui.setbk("null")
  --�O�g
  wgui.setpen("#555")
  wgui.setbrush("#111")
  drawCalcRect(BLmX*MS,BLpY*MS,(BLpX-BLmX)*MS,(BLpY-BLmY)*MS)
  --Stage
  fontsize = 8
  wgui.setpen("white")
  wgui.setbrush("#111")
  wgui.setcolor("white")
  wgui.setbk("null")
  --�n��
  drawCalcLine(-2318,0,2318,0)
  --����
  drawCalcLine(-1841,904,-951,904)
  --������
  drawCalcLine(-570,1542,570,1542)
  --�E��
  drawCalcLine(951,907,1892,907)
  --�o�[�X�g���C��
  wgui.setpen("black")
  wgui.setbrush("white")
   drawCalcEllipse(BLmX*MS,BLpY*MS)
   drawCalcEllipse(BLmX*MS,BLmY*MS)
   drawCalcEllipse(BLpX*MS,BLpY*MS)
   drawCalcEllipse(BLpX*MS,BLmY*MS)
  --�L����
  wgui.setbrush("red")
  drawCalcEllipse(p1x,p1y)
  drawCalcRect(p1x-150,p1y,300,-500)
  wgui.setbrush("blue")
  drawCalcEllipse(p2x,p2y)
  drawCalcRect(p2x-150,p2y,300,-500)
end


function changePosition ()
if mapmode==0 then  MS=1 
 scale = 0.65*1/(BLpX-BLmX)*wnd.width
end
if mapmode==1 then  MS=1/3
 scale = 3/27500*wnd.width
end
   j=input.get()
   local inp = input.get()
   local dinp = input.diff(inp, oinp)
   calcxmouse = math.round(j.xmouse/scale-xorigin/scale,0)
   calcymouse = math.round(-j.ymouse/scale+yorigin/scale,0)
   if BLmX*MS < calcxmouse and calcxmouse < BLpX*MS and BLmY*MS<calcymouse and calcymouse<BLpY*MS then
    if dinp.leftclick then
     wgui.setbrush("red")
     drawCalcRect(calcxmouse-150,calcymouse,300,-500)
     memory.writefloat(WritePosXAddr[1],calcxmouse)
     memory.writefloat(WritePosYAddr[1],calcymouse)
    end
    if dinp.rightclick then
     wgui.setbrush("blue")
     drawCalcRect(calcxmouse-150,calcymouse,300,-500)
     memory.writefloat(WritePosXAddr[2],calcxmouse)
     memory.writefloat(WritePosYAddr[2],calcymouse)
    end
   end
end

