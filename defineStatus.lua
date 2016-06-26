Character={}
Character={
          [0x00]="Mario",
          [0x01]="Fox",
          [0x02]="D.K.",
          [0x03]="Samus",
          [0x04]="Luigi",
          [0x05]="Link",
          [0x06]="Yoshi",
          [0x07]="C.Falcon",
          [0x08]="Kirby",
          [0x09]="Pikachu",
          [0x0A]="Purin",
          [0x0B]="Ness",
          [0x0C]="Master Hand",
          [0x0D]="Metal Mario",
          [0x0E]="Polygon Mario",
          [0x0F]="Polygon Fox",
          [0x10]="Polygon D.K.",
          [0x11]="Polygon Samus",
          [0x12]="Polygon Luigi",
          [0x13]="Polygon Link",
          [0x14]="Polygon Yoshi",
          [0x15]="Polygon C.Falcon",
          [0x16]="Polygon Kirby",
          [0x17]="Polygon Pikachu",
          [0x18]="Polygon Purin",
          [0x19]="Polygon Ness",
          [0x1A]="Giant D.K."
          }

CharaID ={}
Action = {}
BodySizeMultiplier={[0x0]=1,[0x1]=1,[0x2]=1.25,[0x3]=1,[0x4]=1,[0x5]=1.24,[0x6]=1.1,[0x7]=1.05,[0x8]=0.94,[0x9]=0.95,[0xa]=1.05,[0xb]=1.05}
WalkingSpeedMultiplier={[0x0]=0.3,[0x1]=0.45,[0x2]=0.32,[0x3]=0.34,[0x4]=0.3,[0x5]=0.4,[0x6]=0.38,[0x7]=0.32,[0x8]=0.35,[0x9]=0.42,[0xa]=0.28,[0xb]=0.28}
BrakeForce={[0x0]=1.5,[0x1]=2,[0x2]=1.7,[0x3]=2,[0x4]=0.7,[0x5]=2,[0x6]=1.6,[0x7]=1.8,[0x8]=1.4,[0x9]=2,[0xa]=1.1,[0xb]=2}
InitialDashSpeed={[0x0]=54,[0x1]=81,[0x2]=60,[0x3]=56,[0x4]=50,[0x5]=68,[0x6]=40,[0x7]=80,[0x8]=61,[0x9]=60,[0xa]=50,[0xb]=68}
DashingDeceleration={[0x0]=2.8,[0x1]=10,[0x2]=3.5,[0x3]=3,[0x4]=2.8,[0x5]=5.4,[0x6]=1.5,[0x7]=6,[0x8]=5,[0x9]=4.5,[0xa]=3,[0xb]=5.4}
RunningSpeed={[0x0]=44,[0x1]=60,[0x2]=48,[0x3]=54,[0x4]=40,[0x5]=42,[0x6]=50,[0x7]=70,[0x8]=48,[0x9]=55,[0xa]=42,[0xb]=40}
JumpingHeightMultiplier={[0x0]=0.7,[0x1]=1,[0x2]=0.47,[0x3]=0.5,[0x4]=0.7,[0x5]=0.7,[0x6]=0.7,[0x7]=1,[0x8]=0.6,[0x9]=0.67,[0xa]=0.7,[0xb]=0.7}
BaseJumpHeight={[0x0]=26,[0x1]=23,[0x2]=55,[0x3]=36,[0x4]=30,[0x5]=36,[0x6]=27.5,[0x7]=25,[0x8]=30,[0x9]=37,[0xa]=20,[0xb]=26}
--2段ジャンプの計算式が異なるぺちキャラ（ネスヨッシー）と風船（カビプリン）はエラー回避目的で入れた嘘の値が書いてあるので注意
Multiplierfor2ndJump={[0x0]=0.9,[0x1]=1.1,[0x2]=0.91,[0x3]=0.94,[0x4]=0.9,[0x5]=0.9,[0x6]=1,[0x7]=0.95,[0x8]=0.8,[0x9]=1,[0xa]=0.7,[0xb]=1}
JumpingAnimationF={[0x0]=3,[0x1]=3,[0x2]=6,[0x3]=3,[0x4]=3,[0x5]=7,[0x6]=5,[0x7]=4,[0x8]=3,[0x9]=3,[0xa]=6,[0xb]=3}
XAirAcceleration={[0x0]=0.025,[0x1]=0.03,[0x2]=0.025,[0x3]=0.03,[0x4]=0.025,[0x5]=0.04,[0x6]=0.04,[0x7]=0.04,[0x8]=0.04,[0x9]=0.055,[0xa]=0.07,[0xb]=0.04}
XMaximumAirSpeed={[0x0]=30,[0x1]=36,[0x2]=30,[0x3]=28,[0x4]=26,[0x5]=31,[0x6]=40,[0x7]=31,[0x8]=28,[0x9]=37,[0xa]=35,[0xb]=28}
XAirResistance={[0x0]=0.2,[0x1]=0.3,[0x2]=0.3,[0x3]=0.3,[0x4]=0.15,[0x5]=0,[0x6]=0.4,[0x7]=0.2,[0x8]=0.5,[0x9]=0.45,[0xa]=1,[0xb]=0.4}
YFallAcceleration={[0x0]=2.4,[0x1]=4,[0x2]=3,[0x3]=1.9,[0x4]=2.1,[0x5]=3.2,[0x6]=2.7,[0x7]=3.4,[0x8]=2.4,[0x9]=3,[0xa]=2,[0xb]=2.7}
YMaximumSpeedFall={[0x0]=44,[0x1]=60,[0x2]=56,[0x3]=42,[0x4]=42,[0x5]=64,[0x6]=55,[0x7]=60,[0x8]=48,[0x9]=52,[0xa]=38,[0xb]=55}
YMaximalFastfallSpeed={[0x0]=70,[0x1]=96,[0x2]=89,[0x3]=67,[0x4]=67.5,[0x5]=102,[0x6]=88,[0x7]=100,[0x8]=79,[0x9]=83,[0xa]=60,[0xb]=88.25}
HighestNumberOfJumps={[0x0]=2,[0x1]=2,[0x2]=2,[0x3]=2,[0x4]=2,[0x5]=2,[0x6]=2,[0x7]=2,[0x8]=6,[0x9]=2,[0xa]=6,[0xb]=2}
Weight={[0x0]=1,[0x1]=1,[0x2]=0.84,[0x3]=0.92,[0x4]=1,[0x5]=0.96,[0x6]=0.93,[0x7]=0.96,[0x8]=1.19,[0x9]=1.16,[0xa]=1.3,[0xb]=1.1}
DashToRunConnectionF={[0x0]=14,[0x1]=12,[0x2]=18,[0x3]=14,[0x4]=14,[0x5]=16,[0x6]=16,[0x7]=16,[0x8]=14,[0x9]=13,[0xa]=16,[0xb]=14}
SmallComboConnectionF={[0x0]=24,[0x1]=30,[0x2]=28,[0x3]=30,[0x4]=24,[0x5]=24,[0x6]=24,[0x7]=22,[0x8]=24,[0x9]=24,[0xa]=24,[0xb]=24}
TypeOfSkin={[0x0]="肉",[0x1]="肉",[0x2]="肉",[0x3]="鉄",[0x4]="肉",[0x5]="肉",[0x6]="肉",[0x7]="肉",[0x8]="肉",[0x9]="肉",[0xa]="肉",[0xb]="肉"}
ShieldRadius={[0x0]=260,[0x1]=280,[0x2]=330,[0x3]=330,[0x4]=270,[0x5]=260,[0x6]="特殊",[0x7]=290,[0x8]=270,[0x9]=288,[0xa]=400,[0xb]=320}

function defineStats(num)
CharaID[num]=memory.readbyte(CharaIDAddr[num])
Action[num]={
        [0x0]="Dying(Down)",[0x1]="Dying(Side)",[0x2]="Dying(Up far)",[0x3]="Dying(Up near)",[0x5]="Appearing",
        [0x7]="Reviving",[0x8]="Spawning",[0x9]="Standing on Spawning Platform",
        [0xa]="Standing",[0xb]="Walking slowly",[0xc]="Walking",[0xd]="Walking quickly",
        [0xf]="InitialDash",[0x10]="Running",[0x11]="End of Running",
        [0x12]="Switching direction",[0x13]="Switching Running direction",
        [0x14]="Start of Jumping",[0x15]="Shield Jumping",[0x16]="Jumping while Y Velocity is Positive",
        [0x17]="Jumping Backwards",[0x18]="Air Jumping",[0x19]="Air Jumping Backwards",
        [0x1a]="Jumping while Y Velocity is Negative",[0x1b]="Air Jumping while Y Velocity is Negative",
        [0x1c]="Start of Crouching",[0x1d]="Middle of Crouching",[0x1e]="End of Crouching",
        [0x1f]="Landing",[0x20]="Landing hardly",
        [0x21]="Dropping through platform",[0x22]="ShieldDropping through platform",
        [0x23]="Ottotto",[0x24]="Start of Ottotto",
        [0x25]="No Down Damaged",[0x26]="No Down Damaged",[0x27]="No Down Damaged",
        [0x28]="No Down Damaged",[0x29]="No Down Damaged",[0x2a]="No Down Damaged",
        [0x2b]="Damaged",[0x2c]="Damaged",[0x2d]="Damaged",[0x2e]="Damaged",[0x2f]="Damaged",
        [0x30]="Damaged",[0x31]="Damaged",[0x32]="Damaged",[0x33]="Damaged",
        [0x34]="Damaged",[0x35]="Damaged",[0x36]="Damaged",[0x37]="Damaged",
        [0x39]="End of Stun",
        [0x3a]="Falling After Up-Special(Airial)",[0x3b]="Landing after Up-Special(Airial)",
        [0x3c]="Damaged through the Tornado",[0x3d]="Getting into the Barrel",
        [0x3e]="Entering the Pipe",[0x3f]="Moving inside the Pipe",[0x40]="Coming out of the Pipe",[0x41]="Coming out of the Abyth",
        [0x43]="Facedown N Down",[0x44]="Faceup N Down",[0x45]="Facedown Downing",[0x46]="Faceup Downing",
        [0x47]="Getting Recovery from Facedown Down",[0x48]="Getting Recovery from Faceup Down",
        [0x49]="Frontwards Teching",[0x4a]="Backwards Teching",
        [0x4b]="Rolling Forwards from Facedown Down",[0x4c]="Rolling Forwards from Faceup Down",
        [0x4d]="Rolling Backwards from Faceup Down",[0x4e]="Rolling Backwards from Faceup Down",
        [0x4f]="Attack from Facedown Down",[0x50]="Attack from Faceup Down",[0x51]="Teching",
        [0x54]="Start of Grabbing Edge",[0x55]="Grabbing Edge",
        [0x56]="Start of Rising Edge",[0x57]="Rising Edge",[0x58]="End of Rising Edge",
        [0x59]="Start of Rising Edge(100%)",[0x5a]="Rising Edge(100%)",[0x5b]="End of Rising Edge(100%)",
        [0x5c]="Start of Edge Attack",[0x5d]="Edge Attack",
        [0x5e]="Start of Edge Attack(100%)",[0x5f]="Edge Attack(100%)",
        [0x60]="Start of Edge Rolling",[0x61]="Edge Rolling",
        [0x62]="Start of Edge Rolling(100%)",[0x63]="Edge Rolling(100%)",[0x64]="Getting an Item",
        [0x65]="Picking up an Item",[0x66]="Holding an Item",[0x67]="Switching Direction During Holding an Item",
        [0x68]="Throw",[0x69]="Dash Throw",[0x6a]="Forward Throw",[0x6b]="Back Throw",[0x6c]="Up Throw",[0x6d]="Down Throw",
        [0x6e]="Forward Throw(Smash)",[0x6f]="Back Throw(Smash)",[0x70]="Up Throw(Smash)",[0x71]="Down Throw(Smash)",
        [0x72]="Throw-Air",[0x73]="Back Throw-Air",[0x74]="Up Throw-Air",[0x75]="Down Throw-Air",
        [0x76]="Throw-Air(Smash)",[0x77]="Back Throw-Air(Smash)",[0x78]="Up Throw-Air(Smash)",[0x79]="Down Throw-Air(Smash)",
        [0x7e]="BeamSword(Jab)",[0x7f]="BeamSword(Tilt)",[0x80]="BeamSword(Smash)",[0x81]="BeamSword(Dash)",
        [0x7a]="Crate Throw",[0x7b]="Reverse Crate Throw",[0x7c]="Crate Throw(Smash)",[0x7d]="Reverse Crate Throw(Smash)",
        [0x82]="Home-RunBat(Jab)",[0x83]="Home-RunBat(Tilt)",[0x84]="Home-RunBat(Smash)",[0x85]="Home-RunBat(Dash)",
        [0x86]="Harisen(Jab)",[0x87]="Harisen(Tilt)",[0x88]="Harisen(Smash)",[0x89]="Harisen(Dash)",
        [0x8a]="StarRod(Jab)",[0x8b]="StarRod(Tilt)",[0x8c]="StarRod(Smash)",[0x8d]="StarRod(Dash)",
        [0x8e]="LayGun",[0x8f]="LayGun(Aerial)",[0x90]="FireFlower",[0x91]="FireFlower(Aerial)",
        [0x92]="Hammer(Stand)",[0x93]="Hammer(Walk)",[0x94]="Hammer(Switch)",
        [0x95]="Hammer(Jump)",[0x96]="Hammer(Air)",[0x97]="Hammer(Land)",
        [0x98]="Start of Shielding",[0x99]="Shielding",[0x9a]="End of Shielding",
        [0x9b]="Stunning During Shielding",
        [0x9c]="Rolling Frontwards",[0x9d]="Rolling Backwards",
        [0x9e]="ShieldBreaking",
        [0xa1]="SB Downing",[0xa3]="Start of SB Stuning",[0xa4]="SB Stuning",[0xa5]="Sleep Stuning",
        [0xa6]="Grab",[0xa7]="Start of Grabing",[0xa8]="Grabing",[0xa9]="Throwing",[0xaa]="Back Throwing",
        [0xab]="Start of Getting Grabbed",[0xac]="Getting Grabbed",
        [0xad]="Getting Vacuumed",[0xae]="Getting Stuffed",[0xaf]="Getting spitted",[0xb0]="Getting Copied",
        [0xb1]="Getting Tongue",[0xb2]="Being Egg",
        [0xb3]="Getting FalconDive",
        [0xb5]="Start of Getting Mounted",[0xb8]="Getting Mounted",
        [0xba]="End of Getting Grabbed",
        [0xbd]="Taut",[0xbe]="Jab1",[0xbf]="Jab2",
        [0xc0]="Dash Attack",
        [0xc1]="Forward Tilt(high)",[0xc2]="Forward Tilt(mid-high)",[0xc3]="Forward Tilt",[0xc4]="Forward Tilt(mid-low)",[0xc5]="Forward Tilt(low)",
        [0xc7]="Up Tilt",[0xc9]="Down Tilt",
        [0xca]="Forward Smash(high)",[0xcb]="Forward Smash(mid-high)",[0xcc]="Forward Smash",[0xcd]="Forward Smash(mid-low)",[0xce]="Forward Smash(low)",
        [0xcf]="Up Smash",[0xd0]="Down Smash",
        [0xd1]="Neutral Air",[0xd2]="Forward Air",[0xd3]="Back Air",[0xd4]="Up Air",[0xd5]="Down Air",
        [0xd7]="Forward Air Landing",[0xd8]="Backward Air Landing",[0xd9]="Miss Landing",
        [0xda]="Miss Landing hardly",[0xdb]="Miss Landing softly",
        }
end

CharaAction ={}
--MARIO
CharaAction[0x00] = {
                     [0xdc]="Jab3",
                     [0xde]="Appearing1",
                     [0xdf]="FireBall",[0xe0]="FireBall(Airial)",
                     [0xe1]="Up-Special",[0xe2]="Up-Special(Airial)",
                     [0xe3]="Down-Special",[0xe4]="Down-Special(Airial)",
                    }
--FOX
CharaAction[0x01] = {
                     [0xe0]="Arwing",
                     [0xe1]="Laser",[0xe2]="Laser(Airial)",
                     [0xe3]="Start of Up-Special",[0xe4]="Start of Up-Special(Airial)",
                     [0xe5]="Readying Up-Special",[0xe6]="Readying Up-Special(Airial)",
                     [0xe7]="Up-Special",[0xe8]="Up-Special(Airial)",
                     [0xe9]="End of Up-Special",[0xea]="End of Up-Special(Airial)",
                     [0xeb]="Landing while Up-Special(Airial)",
                     [0xec]="Start of Down-Special",[0xed]="Reflecting",[0xee]="End of Down-Special",[0xef]="Down-Special",
                     [0xf0]="Switching Direction while Down-Special",
                     [0xf1]="Start of Down-Special(Airial)",[0xf3]="End of Down-Special(Airial)",[0xf4]="Down-Special(Airial)",
                     [0xf5]="Switching Direction while Down-Special(Airial)",
                    }
--DK
CharaAction[0x02] = {
                     [0xdd]="Appearing1",
                     [0xde]="Start of Charge",[0xdf]="Start of Charge(Airial)",
                     [0xe0]="Charging",[0xe1]="Charging(Airial)",
                     [0xe2]="Punching",[0xe3]="Punching(Airial)",
                     [0xe4]="Maximum Punching",[0xe5]="Maxmum Punching(Airial)",
                     [0xe6]="Up-Special",[0xe7]="Up-Special(Airial)",
                     [0xe8]="Start of Down-Special",[0xe9]="Down-Special",[0xea]="End of Down-Special",
                     [0xeb]="Standing(Mounting)",[0xec]="Walking slowly(Mounting)",[0xed]="Walking(Mounting)",
                     [0xee]="Walking quickly(Mounting)",[0xef]="Switching direction(Mounting)",
                     [0xf0]="Start of Jump(Mounting)",[0xf1]="Jumping(Mounting)",[0xf2]="Landing(Mounting)",
                     [0xf4]="After Throw(Mounting)",[0xf5]="Throw(Mounting)",
                    }
--SAMUS
CharaAction[0x03] = {
                     [0xdd]="Appearing1",
                     [0xde]="Start of Charge Shoot",[0xdf]="Charging",[0xe0]="Shooting",
                     [0xe1]="Start of Charge Shoot(Airial)",[0xe2]="Shooting(Airial)",
                     [0xe3]="Up-Special",[0xe4]="Up-Special(Airial)",
                     [0xe5]="Down-Special",[0xe6]="Down-Special(Airial)",
                    }
--LUIGI
CharaAction[0x04] = {
                     [0xdc]="Jab3",
                     [0xde]="Appearing1",
                     [0xdf]="FireBall",[0xe0]="FireBall(Airial)",
                     [0xe1]="Up-Special",[0xe2]="Up-Special(Airial)",
                     [0xe3]="Down-Special",[0xe4]="Down-Special(Airial)",
                    }
--LINK
CharaAction[0x05] = {
                     [0xdc]="Jab3",[0xdd]="Start of Jab loop",[0xde]="Jab loop",[0xdf]="End of Jab loop",
                     [0xe2]="Up-Special",[0xe3]="End of Up-Special",[0xe4]="Up-Special(Airial)",
                     [0xe5]="Boomerang",[0xe6]="Catching Boomerang",[0xe7]="Missing Boomerang",
                     [0xe8]="Boomerang(Airial)",[0xe9]="Catching Boomerang(Airial)",[0xea]="Missing Boomerang(Airial)",
                     [0xeb]="Down-Special",[0xec]="Down-Special(Airial)",
                    }
--YOSHI
CharaAction[0x06] = {
                     [0xdd]="Appearing1",
                     [0xde]="Up-Special",[0xdf]="Up-Special(Airial)",
                     [0xe0]="Start Down-Special",[0xe1]="Landing while Down-Special",
                     [0xe2]="Start Down-Special(Airial)",[0xe3]="Falling while Down-Special",
                     [0xe4]="N-Special",[0xe5]="Succeeding N-Special",[0xe6]="End of N-Special",
                     [0xe7]="N-Special(Airial)",[0xe8]="Succeeding N-Special(Airial)",[0xe9]="End of N-Special(Airial)",
                    }
--CAPTAIN FALCON
CharaAction[0x07] = {
                     [0xdc]="Jab3",[0xdd]="Start of Jab loop",[0xde]="Jab loop",[0xdf]="End of Jab loop",
                     [0xe1]="Appearing(Airial)",[0xe2]="Blue Falcon",[0xe3]="Blue Falcon",
                     [0xe4]="N-Special",[0xe5]="N-Special(Airial)",
                     [0xe6]="Down-Special",[0xe7]="Velocity X Down-Special(Airial)",
                     [0xe8]="Landing while Down-Special",[0xe9]="Down-Special(Airial)",[0xea]="Bumping while Down-Special",
                     [0xeb]="Falcon Dive",[0xec]="Cathing Enemy while F Dive",[0xed]="End of Falcon Dive",
                     [0xee]="Falcon Dive(Airial)",
                    }
--KIRBY
CharaAction[0x08] = {
                     [0xfa]="Staring",[0xfb]="Staring",
                     [0xdc]="Start of Jab loop",[0xdd]="Jab loop",[0xde]="End of Jab loop",
                     [0xdf]="Jumping(Airial) lefts[4]",[0xe0]="Jumping(Airial) lefts[3]",
                     [0xe1]="Jumping(Airial) lefts[2]",[0xe2]="Jumping(Airial) left[1]",[0xe3]="Jumping(Airial) left[0]",
                     --mario
                     [0xe7]="Red Fireball",[0xe8]="Red Fireball(Airial)",
                     --luigi
                     [0xe9]="Greed Fireball",[0xea]="Green Fireball(Airial)",
                     --fox
                     [0xeb]="Laser",[0xec]="Laser(Airial)",
                     --samus
                     [0xed]="Start of Charge Shoot",[0xee]="Charging",[0xef]="Shooting",
                     [0xf0]="Start of Charge Shoot(Airial)",[0xf1]="Shooting(Airial)",
                     --dk
                     [0xf2]="Start of Charge",[0xf3]="Start of Charge(Airial)",
                     [0xf4]="Charging",[0xf5]="Charging(Airial)",
                     [0xf6]="Punching",[0xf7]="Punching(Airial)",
                     [0xf8]="Maximum Punching",[0xf9]="Maxmum Punching(Airial)",
                     --pikachu
                     [0xfc]="Lightning",[0xfd]="Lightning(Airial)",
                     --ness
                     [0xfe]="PK Fire",[0xff]="PK Fire(Airial)",
                     
                     [0x100]="Up-Special",[0x101]="Landing while Up-Special",
                     [0x102]="Up-Special(Airial)",[0x103]="Falling while Up-Special",
                     [0x104]="Start of Down-Special",
                     [0x106]="Down-Special",[0x107]="Canceling Down-Special",
                     [0x108]="Start of Down-Special(Airial)",[0x109]="Falling while Down-Special(Airial)",
                     [0x10a]="Landing while Down-Special", [0x10b]="Falling while Down-Special",
                     [0x10d]="Start of N-Special",[0x10e]="N-Special",[0x10f]="End of N-Special",
                     [0x110]="Start of Inhaling while N-Special",[0x111]="Inhaling while N-Special",
                     [0x112]="Spitting while N-Special",
                     [0x113]="Stuffing while N-Special",[0x114]="Switching Direction while Stuffing while N-Special",
                     [0x115]="Copying",
                     [0x116]="Start of N-Special(Airial)",[0x117]="N-Special(Airial)",[0x118]="End of N-Special(Airial)",
                     [0x119]="Start of Inhaling while N-Special(Airial)",[0x11a]="Inhaling while N-Special(Airial)",
                     [0x11c]="Spitting while N-Special",[0x11d]="Stuffing while N-Special(Airial)",[0x11e]="Copying(Airial)",
                     
                     --link
                     [0x11f]="Boomerang",[0x120]="Catching Boomerang",[0x121]="Missing Boomerang",
                     [0x122]="Boomerang(Airial)",[0x123]="Catching Boomerang(Airial)",[0x124]="Missing Boomerang(Airial)",
                     --purin
                     [0x125]="Slapping",[0x126]="Slapping(Airial)",
                     --falcon
                     [0x127]="FalconPunching",[0x128]="FalconPunching(Airial)",
                     --yoshi
                     [0x129]="N-Special",[0x12a]="Succeeding N-Special",[0x12b]="End of N-Special",
                     [0x12c]="N-Special(Airial)",[0x12d]="Succeeding N-Special(Airial)",[0x12e]="End of N-Special(Airial)",
                    }
--PIKACHU
CharaAction[0x09] = {
                     [0xdd]="Appearing1",
                     [0xde]="N-Special",[0xdf]="N-Special(Airial)",
                     [0xe0]="Start of Down-Special",[0xe1]="Down-Special",[0xe2]="Getting Thundered",[0xe3]="End of Down-Special",
                     [0xe4]="Start of Down-Special(Airial)",[0xe5]="Down-Special(Airial)",[0xe6]="Getting Thundered(Airial)",[0xe7]="End of Down-Special(Airial)",
                     [0xe8]="Start of Up-Special",[0xe9]="Up-Special",[0xea]="End of Up-Special",
                     [0xeb]="Start of Up-Special(Airial)",[0xec]="Up-Special(Airial)",[0xed]="End of Up-Special(Airial)",
                    }
--PURIN
CharaAction[0x0a] = {
                     [0xdf]="Jumping(Airial) lefts[4]",[0xe0]="Jumping(Airial) lefts[3]",
                     [0xe1]="Jumping(Airial) lefts[2]",[0xe2]="Jumping(Airial) left[1]",[0xe3]="Jumping(Airial) left[0]",
                     [0xe5]="Appearing1",
                     [0xe6]="Slapping",[0xe7]="Slapping(Airial)",
                     [0xe8]="Up-Special",[0xe9]="Up-Special(Airial)",
                     [0xea]="Down-Special",[0xeb]="Down-Special(Airial)",
                    }
--NESS
CharaAction[0x0b] = {
                     [0xdc]="Jab3",
                     [0xde]="Appearing1",[0xdf]="Appearing2",[0xe1]="Appearing3",
                     [0xe2]="PK Fire",[0xe3]="PK Fire(Airial)",
                     [0xe4]="Start of Up-Special",[0xe5]="Up-Special",[0xe6]="End of Up-Special",[0xe7]="PKTA",
                     [0xe8]="Start of Up-Special(Airial)",[0xe9]="Up-Special(Airial)",[0xea]="End of Up-Special(Airial)",
                     [0xeb]="Clashing during PKTA",[0xec]="PKTA(Airial)",
                     [0xed]="Start of Down-Special",[0xee]="Down-Special",[0xef]="Cureing",[0xf0]="End of Down-Special",
                     [0xf1]="Start of Down-Special(Airial)",[0xef2]="Down-Special(Airial)",[0xf3]="Cureing(Airial)",[0xf4]="End of Down-Special(Airial)",
                    }

JumpingValueforY={["Still Short Hop"] = 45,["Moving Short Hop"] = 36,["Still C Stick First Jump"] = 77,["Moving First Jump"] = 63,["Tap Jump"] = 80}


Stage = {
         [0x00]="Peach Castle",
         [0x01]="Sector Z",
         [0x02]="Congo Jungle",
         [0x03]="Planet Zebes",
         [0x04]="Hyrule Castle",
         [0x05]="Yoshi Island",
         [0x06]="Dream Land",
         [0x07]="Saffron City",
         [0x08]="Mushroom Kingdom",
         [0x09]="Dream Land Alpha",
         [0x0A]="Dream Land Beta",
         [0x0B]="How to Play",
         [0x0C]="Yoshi Island Beta",
         [0x0D]="Meta Crystal",
         [0x0E]="Duel Zone",
         [0x0F]="Race to the Finish",
         [0x10]="Final Destination"
        }

BlastZone={
           [0x00]={["-X"]=-9000,["X"]=9000,["-Y"]=-4000 ,["Y"]=9500},
           [0x01]={["-X"]=-14000,["X"]=14000,["-Y"]=-6500,["Y"]=11000},
           [0x02]={["-X"]=-8100,["X"]=8100,["-Y"]=-4700,["Y"]=8000},
           [0x03]={["-X"]=-9500,["X"]=9500,["-Y"]=-4200 ,["Y"]=9000},
           [0x04]={["-X"]=-12000,["X"]=12000,["-Y"]=-5000 ,["Y"]=9000},
           [0x05]={["-X"]=-7800,["X"]=10500,["-Y"]=-4000,["Y"]=8200},
           [0x06]={["-X"]=-9000,["X"]=9000,["-Y"]=-3500,["Y"]=8300},
           [0x07]={["-X"]=-10000,["X"]=10000,["-Y"]=-6000 ,["Y"]=9000},
           [0x08]={["-X"]=-7400,["X"]=7400,["-Y"]=-4350 ,["Y"]=9000},
           
           
           
           
           [0x0D]={["-X"]=-10000,["X"]=10000,["-Y"]=-4200 ,["Y"]=9000},
           [0x0E]={["-X"]=-9000,["X"]=9000,["-Y"]=-4200,["Y"]=9000},
           
           [0x10]={["-X"]=-11000,["X"]=11000,["-Y"]=-4200,["Y"]=9000}
          }


function AddCharactersAction(num)
if CharaAction[CharaID[num]] == nil then print(num.."Pが選択された状態で対戦を開始してから起動してください") end
 for i=0x00,0x1ff do
  if CharaAction[CharaID[num]][i] ~= nil then
   Action[num][i] = CharaAction[CharaID[num]][i]
  end
 end
end
