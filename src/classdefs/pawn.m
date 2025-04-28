classdef pawn < piece
    %PAWN Class for the pawn piece
    %   Inherits from the piece class. Adds addtional functionality as
    %   pawns capture in a specific way.

    properties
        CaptureIndices (2,2) = [1,1 ; -1,1]
    end

    methods
        function p = pawn(inputArg1,inputArg2)
            %PAWN Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end

        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.CaptureIndices + inputArg;
        end
    end
end