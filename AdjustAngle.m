function [ Xadj, Yadj ] = AdjustAngle( X, Y, CenterX, CenterY, Angle )
    
    %   Copyright (C) 2013 Heidelberg University 
    %
    %   Developed at CKM (Computerunterstützte Klinische Medizin),
    %   Medical Faculty Mannheim, Heidelberg University, Mannheim,
    %   Germany
    %
    %
    %   LICENCE
    %
    %   CKM PhM Software Library, Release 1.0 (c) 2013, Heidelberg
    %   University (the "Software")
    %
    %   The Software remains the property of Heidelberg University ("the
    %   University").
    %
    %   The Software is distributed "AS IS" under this Licence solely for
    %   non-commercial use in the hope that it will be useful, but in order
    %   that the University as a charitable foundation protects its assets for
    %   the benefit of its educational and research purposes, the University
    %   makes clear that no condition is made or to be implied, nor is any
    %   warranty given or to be implied, as to the accuracy of the Software,
    %   or that it will be suitable for any particular purpose or for use
    %   under any specific conditions. Furthermore, the University disclaims
    %   all responsibility for the use which is made of the Software. It
    %   further disclaims any liability for the outcomes arising from using
    %   the Software.
    %
    %   The Licensee agrees to indemnify the University and hold the
    %   University harmless from and against any and all claims, damages and
    %   liabilities asserted by third parties (including claims for
    %   negligence) which arise directly or indirectly from the use of the
    %   Software or the sale of any products based on the Software.
    %
    %   No part of the Software may be reproduced, modified, transmitted or
    %   transferred in any form or by any means, electronic or mechanical,
    %   without the express permission of the University. The permission of
    %   the University is not required if the said reproduction, modification,
    %   transmission or transference is done without financial return, the
    %   conditions of this Licence are imposed upon the receiver of the
    %   product, and all original and amended source code is included in any
    %   transmitted product. You may be held legally responsible for any
    %   copyright infringement that is caused or encouraged by your failure to
    %   abide by these terms and conditions.
    %
    %   You are not permitted under this Licence to use this Software
    %   commercially. Use for which any financial return is received shall be
    %   defined as commercial use, and includes (1) integration of all or part
    %   of the source code or the Software into a product for sale or license
    %   by or on behalf of Licensee to third parties or (2) use of the
    %   Software or any derivative of it for research with the final aim of
    %   developing software products for sale or license to a third party or
    %   (3) use of the Software or any derivative of it for research with the
    %   final aim of developing non-software products for sale or license to a
    %   third party, or (4) use of the Software to provide any service to an
    %   external organisation for which payment is received. If you are
    %   interested in using the Software commercially, please contact
    %   Prof. Dr. Lothar Schad (lothar.schad@medma.uni-heidelberg.de).
    
    % ===============================================
    
    %Method Description:
    %-------------------
    %
    % For given points (x,y), a center (CenterX, CenterY) and an angle,
    % perform a rotation of the points round the center by the predefined
    % angle
    
    if numel(X) ~= numel(Y)
       Error('WARNING: Size inconistency!')
       Xadj = nan;
       Yadj = nan;
    else
        
        Xadj = nan(numel(X),1);
        Yadj = nan(numel(Y),1);
        for Index = 1 : numel(X)
            R           = sqrt((X(Index) - CenterX)^2 + (Y(Index) - CenterY)^2);
            OrigAngle   = abs(atan((Y(Index) - CenterY)/(X(Index) - CenterX)));
            Xadj(Index) =  CenterX + MySign(X(Index) - CenterX) * cos((OrigAngle + MySign(X(Index) - CenterX) * MySign(Y(Index) - CenterY) * Angle)) * R;
            Yadj(Index) =  CenterY + MySign(Y(Index) - CenterY) * sin((OrigAngle + MySign(X(Index) - CenterX) * MySign(Y(Index) - CenterY) * Angle)) * R;
        end
    end
    
end

