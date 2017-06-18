%Encoder for LZW


init = {'a','b','c'};

%%
% wb = Wörterbuch
% sf = Sendefolge, die codiert wird
% ec = encodierte Nachricht


%Initialisiere das Wörterbuch mit K Symbolen  
wb = init;
sf = {'a','b','a','b','c','a','b','c','a','b','c','a','a','b','c','a','a'}

%Setze S:=P erstes Quellsymbol der Eingangsdatenfolge
S = sf(1);
codelength = 1;
for i=2:length(sf)
   breaker = 0;
   P = sf(i)
   SP = strcat(char(S),char(P))
    
   
   %Durchsuche das Wörterbuch
   for k=1:length(wb)
       if strcmp(SP,char(wb(k)))
          %S = strcat(S,SP)
          S = SP
          breaker = 1;
          break;
       end
   end
   
   if breaker == 1
      continue; 
   end
   
   wb{end + 1} = SP
   
   %Durchsuche wörterbuch
   for k=1:length(wb)
       if strcmp(S,char(wb(k)))
          %S = strcat(S,SP)
          ec(codelength) = k;
          codelength = codelength + 1;
          breaker = 1;
          break;
       end
   end

   S = P
   
end


%Durchsuche wörterbuch ein letztes mal
for k=1:length(wb)
   if strcmp(S,char(wb(k)))
      %S = strcat(S,SP)
      ec(codelength) = k;
      codelength = codelength + 1;
      breaker = 1;
      break;
   end
end
