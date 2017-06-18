
%%%Decoding LZV 

%%
% wb = Wörterbuch
% ef = Empfangsfolge
% dec = decodierte Ausgabe

init = {'a','b','c'};
ef = [1 2 4 3 6 8 9];



%Initialisiere das Wörterbuch mit den K Symbolen des Quellalphabets 
wb = init;

%Setze Index := erster Index der Empfangsfolge
idx = ef(1);
%display(wb(idx))
dec = [wb(idx)]


%Schleife geht so lange bis kein weitere Index mehr folgt 
for i=1:length(ef) -1
    oldidx = idx;
    idx = ef(i +1);
    %idx = ef(i)
    i
    %Setze S := Wörterbuch
    S = wb(oldidx);
    %Falls das Wörterbuch an der Stelle Index gefüllt ist, dann:
    if idx <= length(wb)
       %Setze P := erstes Quellensymbol vom Wörterbuch[index]
       P_ = wb(idx);
       P = {P_{1}(1)} %hack um an die erste stelle des String zu gelangen       
    else
       %Falls nicht, setze P:= Erstes Quellensymbol vom Wörterbuch
       %[oldindex]
       P_ = wb(oldidx);
       P = {P_{1}(1)} %hack um an die erste stelle des String zu gelangen
    end
    
    
    %erweitere das Wörterbuch um S+P
    wb = horzcat(wb,strcat(S{1:length(S)},P{1:length(P)}));
    dec = [dec wb(idx)];
end
