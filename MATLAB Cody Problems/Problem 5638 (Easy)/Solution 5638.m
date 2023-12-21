function WindChill_F = getWindChill_F(T_F,V_mph)
    ans = (35.74 + 0.6215*(T_F) - 35.75*(V_mph.^(0.16)) + 0.4275.*T_F.*(V_mph.^(0.16)))
    WindChill_F = round(ans)
end
