function alpha = GetSlopeAngle(x, iSlope, iDataSet)
if iDataSet == 1                      % Training
    if iSlope == 1
        alpha = 6.3317 - 0.6021 * cos(0.0082 * x + 0.6585) - 2.4867 * sin(0.0167 * x + 2.6092) - 0.0018 * x;
    elseif iSlope == 2
        alpha = 0.8035 - 0.3089 * cos(0.0067 * x + 2.1782) - 0.3541 * sin(0.0082 * x + 0.2262) - 0.0003 * x;
    elseif iSlope == 3
        alpha = 7.3933 - 0.4487 * cos(0.0059 * x + 0.8237) - 2.0662 * sin(0.0065 * x + 6.0677) - 0.0015 * x;
    elseif iSlope == 4
        alpha = 0.0002 * x + 0.2492 * cos(0.0186 * x + 2.0318) + 0.0343 * sin(0.0082 * x + 3.8034) + 8.1855;
    elseif iSlope == 5
        alpha = 8.3884 - 0.3151 * cos(0.0090 * x + 4.8718) - 0.7357 * sin(0.0137 * x + 2.9106) - 0.0003 * x;
    elseif iSlope == 6
        alpha = 1.9991 * cos(0.0002*x + 6.2149) - 0.0012 * x + 0.1368 * sin(0.0046 * x + 0.9947) + 7.3822;
    elseif iSlope == 7
        alpha = 0.0002 * x + 0.2231 * sin(0.0051 * x + 1.2833) + 0.0096 * cos(0.0071 * x + 3.3696) + 7.7116;
    elseif iSlope == 8
        alpha = 0.0005 * x + 0.1309 * cos(0.0047 * x + 0.2317) + 0.1667 * sin(0.0050 * x + 1.7467) + 2.6138;
    elseif iSlope == 9
        alpha = 0.0010 * x + 0.1818 * cos(0.0098 * x + 0.7922) + 0.0758 * sin(0.0061 * x + 4.9756) + 2.8261;
    elseif iSlope == 10
        alpha = 1.0769 - 0.3520 * cos(0.0091 * x + 2.0329) - 0.3396 * sin(0.0088 * x + 0.1049) - 0.0001 * x;  
    end 
elseif (iDataSet == 2)                            % Validation
    if iSlope == 1
        alpha = 0.0026 * x - cos(0.0003 * x + 1.8755) - 0.0018 * sin(0.0076 * x + 1.426) + 7.3256;
    elseif iSlope == 2
        alpha = 0.0002 * x + 0.2007 * cos(0.0102 * x + 2.4754) + 1.4177 * sin(0.0076 * x + 5.8764) + 6.5543;
    elseif iSlope == 3
        alpha = 0.0004 * x + 0.1786 * cos(0.0063 * x + 2.5529) + 0.0976 * sin(0.0063 * x + 5.8982) + 1.2202;
    elseif iSlope == 4
        alpha = 1.5059 * sin(0.0199 * x + 4.1595) - 0.0015 * x + 0.3654 * cos(0.0107 * x + 0.3742) + 1.9227;
    elseif iSlope == 5
        alpha = 0.0001 * x + 0.0327 * sin(0.0081 * x + 2.5689) + 0.0134 * cos(0.0054 * x + 5.6324) + 8.0182;    
    end 
elseif (iDataSet == 3)                           % Test
    if iSlope == 1
        alpha = 0.0022 * x - 0.1125 * cos(0.0127 * x + 4.2981) - 0.1131 * sin(0.0488 * x + 1.6771) + 3.7992;
    elseif iSlope == 2
        alpha = 0.0015 * x - 0.5627 * sin(0.0093 * x + 5.3367) - 0.2113 * cos(0.0045 * x + 3.6087) + 3.7865;
    elseif iSlope == 3
        alpha = 0.6179 * cos(0.0471 * x + 2.0126) - 0.0011 * x + 1.4428 * sin(0.0291 * x + 1.8835) + 7.6522;
    elseif iSlope == 4
        alpha = 2.0165 * cos(0.0051 * x + 1.0127) - 0.0006 * x + 0.3751 * sin(0.0052 * x + 2.5076) + 6.9297;
    elseif iSlope == 5
        alpha = 0.0004 * x - 0.2219 * sin(0.0084 * x + 4.5401) - 0.8762 * cos(0.0099 * x + 5.0657) + 2.7667;
    end
end
