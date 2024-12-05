getgenv().Tension = {
    ["Aimbot"] = {
        Enabled = true,
        ["Easing"] = {
            Style = "Linear",
            Direction = "InOut"
        },
        Keybind = "C",
        Hitbox = "HumanoidRootPart",
        Distance = 999,
        HitAirshots = false,
        AirshotHitbox = "LowerTorso",
        Prediction = 0.13,
        Smoothing = true,
        Smoothness = 0.1,
        Shake = false,
        SX = 0,
        SY = 0,
        SZ = 0,
        HitboxMethod = "Default" -- < "Default" , "Point" , "Closest" >
    },
    ["Silent"] = {
        Enabled = true,
        Hitboxes = "HumanoidRootPart",
        HitboxMethod = "Default", -- < "Default" , "Point" , "Closest" >
        Prediction = 0.13,
        UseKeybind = true,
        Keybind = "G",
        Notifications = true
    },
    ["FOV"] = {
        ["Silent"] = {
            Visible = true,
            Filled = false,
            Size = 30,
            Transparency = 0.38,
            Thickness = 1,
            Color = Color3.fromRGB(0, 0, 0),
            Sides = 20
        },
        ["Aimbot"] = {
            UseFOV = false,
            Visible = false,
            Filled = false,
            Size = 20,
            Transparency = 0.90,
            Thickness = 1,
            Color = Color3.fromRGB(0, 0, 0),
            Sides = 20
        },
        ["Dynamic"] = {
            Enabled = false,
            Circle = "Silent",
            Close = 150,
            Close_Studs = 10,
            Mid = 60,
            Mid_Studs = 120,
            Far = 15,
            Far_Studs = 500,
            VeryFar =  7,
            VeryFar_Studs = math.huge
        },
    },
    ["Trigger Bot"] = {
        Enabled = false, -- buggy
        Delay = false,
        Delayness = 0.07,
        UseKey = false,
        Keybind = "Y",
        Notifications = false
    },
    ["Checks"] = {
        Wall = true,
        Knock = true,
        NoGroundShots = false -- based on ping
    },
    ["Misc"] = {
        Loader = true,
        LoaderType = "Notifications" -- < "Notifications" , "Image" >
    },
    ["Chat Commands"] = {
        Enabled = false,
        Circle = "Silent", -- < "Silent" , "Aimbot" >
        CircleSize = ".fov",
        Prediction = "Silent", -- < "Silent" , "Aimbot" >
        PredictionAmount = ".prediction",    
    }
}

local a=game:GetService("StarterGui")local b=game:GetService("Players")local c=b.LocalPlayer;local d=c;local e=c.Character or c.CharacterAdded:Wait()local f=b.GetPlayers;local g=c:GetMouse()local h=game:GetService("RunService")local i=game.Workspace.CurrentCamera;local b=game:GetService("Players")local c=b.LocalPlayer;local j=game:GetService("TeleportService")local f=b.GetPlayers;local g=c:GetMouse()local k=game:GetService("Workspace")local l=game:GetService("GuiService")local m=k.CurrentCamera;local n=game:GetService("TeleportService")local o=l.GetGuiInset;local p=Drawing.new("Circle")local q=Drawing.new("Circle")local r,s,t;function WallCheck(u,v)if Tension["Checks"].Wall then local w=i.CFrame.p;local x=Ray.new(w,u-w)local y=game:GetService("Workspace"):FindPartOnRayWithIgnoreList(x,v)return y==nil else return true end end;local z=function(A)local B=m:WorldToScreenPoint(A.Position)return Vector2.new(B.X,B.Y)end;local C=function(D)if D:IsA('BasePart')then return true end end;local E=function()return Vector2.new(g.X,g.Y)end;if Tension["Misc"].Loader and Tension["Misc"].LoaderType=="Notifications"then wait(0.3)a:SetCore("SendNotification",{Title="tension.max",Text="Loaded"})wait(0.5)elseif Tension["Misc"].Loader and Tension["Misc"].LoaderType=="Image"then wait(0.3)wait(0.5)end;function AimbotFOV()if not p then return end;p.Visible=Tension["FOV"]["Aimbot"].Visible;p.Radius=Tension["FOV"]["Aimbot"].Size*2.1;p.Position=Vector2.new(g.X,g.Y+o(l).Y)p.Filled=Tension["FOV"]["Aimbot"].Filled;p.Transparency=Tension["FOV"]["Aimbot"].Transparency;p.Thickness=Tension["FOV"]["Aimbot"].Thickness;p.NumSides=Tension["FOV"]["Aimbot"].Sides;p.Color=Tension["FOV"]["Aimbot"].Color;return p end;local F=true;function SilentFOV()if not q then return end;q.Visible=Tension["FOV"]["Silent"].Visible;q.Radius=Tension["FOV"]["Silent"].Size*2.1;q.Position=Vector2.new(g.X,g.Y+o(l).Y)q.Filled=Tension["FOV"]["Silent"].Filled;q.Transparency=Tension["FOV"]["Silent"].Transparency;q.Thickness=Tension["FOV"]["Silent"].Thickness;q.NumSides=Tension["FOV"]["Silent"].Sides;q.Color=Tension["FOV"]["Silent"].Color;return q end;h.Heartbeat:Connect(function()AimbotFOV()SilentFOV()end)if Tension["FOV"]["Aimbot"].UseFOV==true then function NearestPerson()local G;local H=Tension["FOV"]["Aimbot"].Size;for I,J in ipairs(game.Players:GetPlayers())do pcall(function()if J~=game.Players.LocalPlayer and J.Character and J.Character:FindFirstChild("Humanoid")and WallCheck(J.Character.HumanoidRootPart.Position,{d,J.Character})then local K=m:WorldToViewportPoint(J.Character.PrimaryPart.Position)local L=(Vector2.new(K.X,K.Y)-Vector2.new(g.X,g.Y)).magnitude;if(Vector2.new(K.X,K.Y)-Vector2.new(g.X,g.Y)).magnitude<H then G=J;H=L end end end)end;return G end elseif Tension["FOV"]["Aimbot"].UseFOV==false then function NearestPerson()local G;local H=Tension["Aimbot"].Distance;for I,J in ipairs(game.Players:GetPlayers())do pcall(function()if J~=game.Players.LocalPlayer and J.Character and J.Character:FindFirstChild("Humanoid")and WallCheck(J.Character.HumanoidRootPart.Position,{d,J.Character})then local K=m:WorldToViewportPoint(J.Character.PrimaryPart.Position)local L=(Vector2.new(K.X,K.Y)-Vector2.new(g.X,g.Y)).magnitude;if(Vector2.new(K.X,K.Y)-Vector2.new(g.X,g.Y)).magnitude<H then G=J;H=L end end end)end;return G end end;local M=function()local N=nil;Closest=1/0;for O,J in ipairs(b:GetPlayers())do if J.Character and J~=d and J.Character:FindFirstChild("HumanoidRootPart")and WallCheck(J.Character.HumanoidRootPart.Position,{d,J.Character})then local P,Q=i:WorldToScreenPoint(J.Character.HumanoidRootPart.Position)local R=(Vector2.new(P.X,P.Y)-Vector2.new(g.X,g.Y)).Magnitude;if q.Radius>R and R<Closest and Q and P then Closest=R;N=J end end end;return N end;local S=function()local T=math.huge;local U=nil;for O,J in next,game.Players:GetPlayers()do if J~=d and J.Character and J.Character:FindFirstChild("Humanoid")then for V,W in next,J.Character:GetChildren()do if C(W)then local R=(z(W)-E()).magnitude;if R<T then T=R;U=W end end end end end;return U end;task.spawn(function()while task.wait()do if r then if Tension["Aimbot"].Enabled==true and Tension["Aimbot"].HitboxMethod=="Closest"then Tension["Aimbot"].Hitbox=tostring(S(r.Character))elseif Tension["Aimbot"].Enabled==true and Tension["Aimbot"].HitboxMethod=="Default"then Tension["Aimbot"].Hitbox=Tension["Aimbot"].Hitbox elseif Tension["Aimbot"].Enabled==true and Tension["Aimbot"].HitboxMethod=="Point"then Tension["Aimbot"].Hitbox=tostring(ClosestPoint(r.Character))end;if s then if Tension["Silent"].Enabled==true and Tension["Silent"].HitboxMethod=="Closest"then Tension["Silent"].Hitboxes=tostring(S(s.Character))elseif Tension["Silent"].Enabled==true and Tension["Silent"].HitboxMethod=="Default"then Tension["Silent"].Hitboxes=Tension["Silent"].Hitboxes elseif Tension["Silent"].Enabled==true and Tension["Silent"].HitboxMethod=="Point"then Tension["Silent"].Hitboxes=tostring(ClosestPoint(s.Character))end end end end end)if Tension["Aimbot"].HitAirshots==true then if r.Character.Humanoid.Jump==true and r.Character.Humanoid.FloorMaterial==Enum.Material.Air then Tension["Aimbot"].Hitbox=Tension["Aimbot"].AirshotHitbox else r.Character:WaitForChild("Humanoid").StateChanged:Connect(function(X,Y)if Y==Enum.HumanoidStateType.Freefall then Tension["Aimbot"].Hitbox=Tension["Aimbot"].AirshotHitbox else Tension["Aimbot"].Hitbox=Tension["Aimbot"].Hitbox end end)end end;if F==true then g.KeyDown:Connect(function(Z)local _=Tension["Aimbot"].Keybind:lower()if Z==_ then if Tension["Aimbot"].Enabled==true then t=not t;if t then r=NearestPerson()else if r~=nil then r=nil end end end end end)end;h.RenderStepped:Connect(function()if Tension["Aimbot"].Enabled==true and r and r.Character~=nil then if Tension["Aimbot"].Shake then local a0=CFrame.new(i.CFrame.p,r.Character[Tension["Aimbot"].Hitbox].Position+r.Character[Tension["Aimbot"].Hitbox].Velocity*Tension["Aimbot"].Prediction+Vector3.new(math.random(-Tension["Aimbot"].SX,Tension["Aimbot"].SX),math.random(-Tension["Aimbot"].SY,Tension["Aimbot"].SZ),math.random(-Tension["Aimbot"].SZ,Tension["Aimbot"].SZ))*1)i.CFrame=i.CFrame:Lerp(a0,Tension["Aimbot"].Smoothness,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,Enum.EasingStyle.Bounce,Enum.EasingDirection.Out,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)else local a0=CFrame.new(i.CFrame.p,r.Character[Tension["Aimbot"].Hitbox].Position+r.Character[Tension["Aimbot"].Hitbox].Velocity*Tension["Aimbot"].Prediction)i.CFrame=i.CFrame:Lerp(a0,Tension["Aimbot"].Smoothness,Enum.EasingStyle[Tension["Aimbot"]["Easing"].Style],Enum.EasingDirection[Tension["Aimbot"]["Easing"].Direction])end end end)h.Heartbeat:Connect(function()if Tension["Aimbot"].Enabled==true and r and r.Character~=nil then if Tension["Checks"].Knock then if r.Character.BodyEffects["K.O"].Value then r=nil end end end end)h.Heartbeat:Connect(function()if Tension["FOV"]["Dynamic"].Enabled and Tension["FOV"]["Dynamic"].Circle=="Silent"and d~=nil and d.Character and s and s.Character then if(d.Character.HumanoidRootPart.Position-s.Character.HumanoidRootPart.Position).Magnitude<Tension["FOV"]["Dynamic"].Close_Studs then Tension["FOV"]["Silent"].Size=Tension["FOV"]["Dynamic"].Close elseif(d.Character.HumanoidRootPart.Position-s.Character.HumanoidRootPart.Position).Magnitude<Tension["FOV"]["Dynamic"].Mid_Studs then Tension["FOV"]["Silent"].Size=Tension["FOV"]["Dynamic"].Mid elseif(d.Character.HumanoidRootPart.Position-s.Character.HumanoidRootPart.Position).Magnitude<Tension["FOV"]["Dynamic"].Far_Studs then Tension["FOV"]["Silent"].Size=Tension["FOV"]["Dynamic"].Far elseif(d.Character.HumanoidRootPart.Position-s.Character.HumanoidRootPart.Position).Magnitude<Tension["FOV"]["Dynamic"].VeryFar_Studs then Tension["FOV"]["Silent"].Size=Tension["FOV"]["Dynamic"].VeryFar end end end)h.RenderStepped:Connect(function()if Tension["Aimbot"].Smoothing and Tension["Aimbot"].Enabled==true then local a0=CFrame.new(workspace.CurrentCamera.CFrame.p,r.Character[Tension["Aimbot"].Hitbox].Position+r.Character[Tension["Aimbot"].Hitbox].Velocity*Tension["Aimbot"].Prediction)workspace.CurrentCamera.CFrame=workspace.CurrentCamera.CFrame:Lerp(a0,Tension["Aimbot"].Smoothness,Enum.EasingStyle[Tension["Aimbot"]["Easing"].Style],Enum.EasingDirection[Tension["Aimbot"]["Easing"].Direction])elseif Tension["Aimbot"].Smoothing==false and Tension["Aimbot"].Enabled==true then workspace.CurrentCamera.CFrame=CFrame.new(workspace.CurrentCamera.CFrame.Position,r.Character[Tension["Aimbot"].Hitbox].Position+r.Character[Tension["Aimbot"].Hitbox].Velocity*Tension["Aimbot"].Prediction)end end)h.Heartbeat:Connect(function()if Tension["Silent"].Enabled==true and s and s.Character~=nil then if Tension["Checks"].Knock then if s.Character.BodyEffects["K.O"].Value then s=nil end end end end)local a1=getrawmetatable(game)local a2=a1.__index;setreadonly(a1,false)a1.__index=newcclosure(function(a3,a4)if Tension["Silent"].Enabled and g and tostring(a4)=="Hit"then s=M()if s then local a5=game.Players[tostring(s)].Character[Tension["Silent"]["Hitboxes"]].CFrame+game.Players[tostring(s)].Character[Tension["Silent"]["Hitboxes"]].Velocity*Tension["Silent"].Prediction;return tostring(a4)=="Hit"and a5 end end;return a2(a3,a4)end)h.RenderStepped:Connect(function()if Tension["Trigger Bot"].Enabled then if g.Target then if g.Target.Parent:FindFirstChild('Humanoid')and g.Target.Parent:FindFirstChild('Head')and g.Target.Parent:FindFirstChild('LowerTorso')and g.Target.Parent:FindFirstChild('UpperTorso')then if Tension["Trigger Bot"].Delay then wait(Tension["Trigger Bot"].Delayness)mouse1click()mouse1release()else mouse1click()mouse1release()end end end end end)g.KeyDown:Connect(function(a6)if Tension["Trigger Bot"].UseKeybind then if a6==Tension["Trigger Bot"].Keybind:lower()then if Tension["Trigger Bot"].Enabled==true then Tension["Trigger Bot"].Enabled=false;a:SetCore("SendNotification",{Title="tension.max Triggerbot",Text="Disabled"})else Tension["Trigger Bot"].Enabled=true;a:SetCore("SendNotification",{Title="tension.max Triggerbot",Text="Enabled"})end end end end)task.spawn(function()if Tension["Checks"].NoGroundShots and s.Character[Tension["Silent"].Hitboxes].Velocity.Y<-15 then pcall(function()local N=s.Character[Tension["Silent"].Hitboxes]N.Velocity=Vector3.new(N.Velocity.X,N.Velocity.Y/5,N.Velocity.Z)N.AssemblyLinearVelocity=Vector3.new(N.Velocity.X,N.Velocity.Y/5,N.Velocity.Z)end)end end)d.Chatted:Connect(function(UEFTVEVSIERFVEVDVEVE)if Tension["Chat Commands"].Enabled then local a8=string.split(UEFTVEVSIERFVEVDVEVE," ")if a8[1]==Tension["Chat Commands"].CircleSize and Tension["Chat Commands"].Circle=="Silent"and a8[2]~=nil then Tension["FOV"]["Silent"].Size=tonumber(a8[2])elseif a8[1]==Tension["Chat Commands"].CircleSize and Tension["Chat Commands"].Circle=="Aimbot"and a8[2]~=nil then Tension["FOV"]["Aimbot"].Size=tonumber(a8[2])end end;if Tension["Chat Commands"].Enabled then local a8=string.split(UEFTVEVSIERFVEVDVEVE," ")if a8[1]==Tension["Chat Commands"].PredictionAmount and Tension["Chat Commands"].Prediction=="Silent"and a8[2]~=nil then Tension["Silent"].Prediction=tonumber(a8[2])elseif a8[1]==Tension["Chat Commands"].PredictionAmount and Tension["Chat Commands"].Prediction=="Aimbot"and a8[2]~=nil then Tension["Aimbot"].Prediction=tonumber(a8[2])end end end)g.KeyDown:Connect(function(a6)if Tension["Silent"].UseKeybind then if a6==Tension["Silent"].Keybind:lower()then if Tension["Silent"].Enabled==true then Tension["Silent"].Enabled=false;a:SetCore("SendNotification",{Title="tension.max Silent",Text="Disabled"})else Tension["Silent"].Enabled=true;a:SetCore("SendNotification",{Title="tension.max Silent",Text="Enabled"})end end end end)