wnd = wgui.info()
xorigin,yorigin=wnd.width*4/3,wnd.height*2/3--基準座標
headsize=4--描画する円の直径
buffersize=32--このサイズ分のフレーム数前までの座標を円で描画する
scale = 1/27500*wnd.width--ミニマップの倍率
mode =0--mode0遠い,mede1近い,mode2(未実装)カメラ
oinp = input.get()
width, height = wnd.width*2/3, 0

--wgui.resize(wnd.width+width, wnd.height+height)


emu.atstop(function()
 if drawFlag then
  wgui.resize(wnd.width, wnd.height)
 end
end)


function drawLine(x,y,w,h)
  local xx, yy = xorigin+x, yorigin+y
  wgui.line(xx, yy, xx+w, yy+h)
end

function drawRect(x,y,w,h)
  local xx, yy = xorigin+x, yorigin+y
  wgui.rect(xx, yy, xx+w, yy+h)
end

function drawEllipse(x,y,w,h)
  local xx, yy = xorigin+x, yorigin+y
  wgui.ellipse(xx-headsize/2, yy-headsize/2, xx+w+headsize/2, yy+h+headsize/2)
end

function drawCalcLine(x,y,w,h)
  local xx, yy = xorigin+scale*x, yorigin-scale*y
  local ww, hh = xorigin+scale*w-scale*x, yorigin-scale*h+scale*y
  wgui.line(xx, yy, xx+scale*w-scale*x, yy-scale*h+scale*y)
end

function drawCalcRect(x,y,w,h)
  local xx, yy = xorigin+scale*x, yorigin-scale*y
 --local ww, hh = -x+w, y-h
  wgui.rect(xx, yy, xx+scale*w, yy+scale*h)
end

function drawCalcEllipse(x,y)
  local xx, yy = xorigin+scale*x, yorigin-scale*y
--local ww, hh = -x+w, y-h
  wgui.ellipse(xx-headsize/2, yy-headsize/2, xx+headsize/2, yy+headsize/2)
  drawText(xx-30, yy-30, string.format("(".. math.floor(x))..","..string.format(math.floor(y) ..")" ))
end

function drawCalcRiffEllipse(x,y)
  local xx, yy = xorigin+scale*x, yorigin-scale*y
--local ww, hh = -x+w, y-h
  wgui.ellipse(xx-headsize/4, yy-headsize/4, xx+headsize/4, yy+headsize/4)
end

function drawText(x,y,t)
  local xx, yy = xorigin+x, yorigin+y
  wgui.setfont(fontsize, "メイリオ", "")
  wgui.text(xx, yy, t)
end
