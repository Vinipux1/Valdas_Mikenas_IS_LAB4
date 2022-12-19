close all
clear all
clc
%%Studentas:	    Valdas Mikenas		
%%Kryptis (grupė):	Dirbtinio intelekto sistemos (DISfm-22)		



%% raidziu pavyzdzio nuskaitymas ir pozmiu skaiciavimas MOKYMUI
% read the image with hand-written characters
pavadinimas = 'Ok_foto_9_simboliu_4eilutes.jpg';  %pakeista funckija su rotate 90 laipsniu

pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 4);  %pakeistas eilucius skaicius

%% Atpazintuvo kurimas
%% Development of character recognizer
% pozymiai is celiu masyvo perkeliami i matrica
% take the features from cell-type variable and save into a matrix-type variable
P = cell2mat(pozymiai_tinklo_mokymui); %Konvertuoti langelių masyvą į įprastą pagrindinio duomenų tipo masyvą

% sukuriama teisingu atsakymu matrica: 9 raidziu, 4 eilutes mokymui
% create the matrices of correct answers for each line (number of matrices = number of symbol lines)
T = [eye(9), eye(9), eye(9), eye(9)];      %pakeista vienetinemis matricomis pagal simboliu sk. eiluteje
% sukuriamas SBF tinklas duotiems P ir T sarysiams
% create an RBF network for classification with 13 neurons, and sigma = 1
% (Radialinės bazinės funkcijos tinklas)
tinklas = newrb(P,T,0,1,13);

%% Tinklo patikra | Test of the network (recognizer)
% skaiciuojamas tinklo isejimas nezinomiems pozymiams
% estimate output of the network for unknown symbols (row, that were not used during training)
P2 = P(:,10:18);   %PASIRENKAME KURIUOS SIMBOLISU APSIMOKINA
Y2 = sim(tinklas, P2);
% ieskoma, kuriame isejime gauta didziausia reiksme
% find which neural network output gives maximum value
[a2, b2] = max(Y2);
%% 1 Rezultato atvaizdavimas "ABCDUTIH"
%% Visualize result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculate the total number of symbols in the row
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
% we will save the result in variable 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk;
    switch b2(k);
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, 'A'];
        case 2
            atsakymas = [atsakymas, 'B'];
        case 3
            atsakymas = [atsakymas, 'C'];
        case 4
            atsakymas = [atsakymas, 'K'];
        case 5
            atsakymas = [atsakymas, 'D'];
        case 6
            atsakymas = [atsakymas, 'U'];
        case 7
            atsakymas = [atsakymas, 'T'];
        case 8
            atsakymas = [atsakymas, 'I'];
        case 9
            atsakymas = [atsakymas, 'H'];

    end
end
% pateikime rezultatà komandiniame lange
% show the result in command window
disp(atsakymas)

% % figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
%% Simboliu "TUKU DUKU" pozymiu isskyrimas TESTAVIMAS
%% Extract features of the test image
pavadinimas = 'Zodis_TUKU_DUKU_90.jpg';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raidziu atpazinimas "TUKU DUKU""
% Perform letter/symbol recognition
% poþymiai ið celiø masyvo perkeliami á matricà
% features from cell-variable are stored to matrix-variable
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% estimating neuran network output for newly estimated features
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% searching which output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas | Visualization of result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculating number of symbols - number of columns
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, 'A'];
        case 2
            atsakymas = [atsakymas, 'B'];
        case 3
            atsakymas = [atsakymas, 'C'];
        case 4
            atsakymas = [atsakymas, 'K'];
        case 5
            atsakymas = [atsakymas, 'D'];
        case 6
            atsakymas = [atsakymas, 'U'];
        case 7
            atsakymas = [atsakymas, 'T'];
        case 8
            atsakymas = [atsakymas, 'I'];
        case 9
            atsakymas = [atsakymas, 'H'];
    end
end
% pateikime rezultatà komandiniame lange
% disp(atsakymas)
figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off

%% 3 Simboliu  "BO KO TU DUOK" pozymiu isskyrimas 
% extract features for next/another test image
pavadinimas = 'Zodis_su_ne_visom_turimom_raidem_BO_KO_TU_DUOK.jpg';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

% Raidziu atpazinimas
% poþymiai is celiu masyvo perkeliami i matrica
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo isejimas nezinomiems pozymiams
Y2 = sim(tinklas, P2);
% ieskoma, kuriame isejime gauta didziausia reiksme
[a2, b2] = max(Y2);
% Rezultato atvaizdavimas
% apskaiciuosime raidziu skaiciu - pozymio P2 stulpeliu skaiciu
raidziu_sk = size(P2,2);
% rezultata saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, 'A'];
        case 2
            atsakymas = [atsakymas, 'B'];
        case 3
            atsakymas = [atsakymas, 'C'];
        case 4
            atsakymas = [atsakymas, 'K'];
        case 5
            atsakymas = [atsakymas, 'D'];
        case 6
            atsakymas = [atsakymas, 'U'];
        case 7
            atsakymas = [atsakymas, 'T'];
        case 8
            atsakymas = [atsakymas, 'I'];
        case 9
            atsakymas = [atsakymas, 'H'];

    end
end
% pateikime rezultata paveiksliuke 9
figure(9), text(0.1,0.5,atsakymas,'FontSize',38), axis off;

%% NEWFF() ar FFN() panmaudojimas 
% raidziu pavyzdzionuskaitymas ir poþymiø skaièiavimas
% read the image with hand-written characters
pavadinimas = 'Ok_foto_9_simboliu_4eilutes.jpg';
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 4);
%% Atpaþintuvo kûrimas
%% Development of character recognizer
% poþymiai ið celiø masyvo perkeliami á matricà
% take the features from cell-type variable and save into a matrix-type variable
P = cell2mat(pozymiai_tinklo_mokymui);
% sukuriama teisingø atsakymø matrica: 11 raidþiø, 8 eilutës mokymui
% create the matrices of correct answers for each line (number of matrices = number of symbol lines)
T = [eye(9), eye(9), eye(9), eye(9)]; 
% sukuriamas SBF tinklas duotiems P ir T sàryðiams
% create an RBF network for classification with 13 neurons, and sigma = 1
tinklas = feedforwardnet(100);
tinklas = train(tinklas, P, T);
view (tinklas);


%% Tinklo patikra | Test of the network (recognizer)
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% estimate output of the network for unknown symbols (row, that were not used during training)
P2 = P(:,10:18);   %PASIRENKAME KURIUOS SIMBOLISU APSIMOKINA
Y2 = tinklas(P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% find which neural network output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
%% Visualize result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculate the total number of symbols in the row
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
% we will save the result in variable 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, 'A'];
        case 2
            atsakymas = [atsakymas, 'B'];
        case 3
            atsakymas = [atsakymas, 'C'];
        case 4
            atsakymas = [atsakymas, 'K'];
        case 5
            atsakymas = [atsakymas, 'D'];
        case 6
            atsakymas = [atsakymas, 'U'];
        case 7
            atsakymas = [atsakymas, 'T'];
        case 8
            atsakymas = [atsakymas, 'I'];
        case 9
            atsakymas = [atsakymas, 'H'];
    end
end
% pateikime rezultatà komandiniame lange
% show the result in command window
disp(atsakymas)
% % figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
%% Extract features of the test image
pavadinimas = 'Zodis_TUKU_DUKU_90.jpg';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raidþiø atpaþinimas
%% Perform letter/symbol recognition
% poþymiai ið celiø masyvo perkeliami á matricà
% features from cell-variable are stored to matrix-variable
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% estimating neuran network output for newly estimated features
Y2 = tinklas(P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% searching which output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas | Visualization of result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculating number of symbols - number of columns
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, 'A'];
        case 2
            atsakymas = [atsakymas, 'B'];
        case 3
            atsakymas = [atsakymas, 'C'];
        case 4
            atsakymas = [atsakymas, 'K'];
        case 5
            atsakymas = [atsakymas, 'D'];
        case 6
            atsakymas = [atsakymas, 'U'];
        case 7
            atsakymas = [atsakymas, 'T'];
        case 8
            atsakymas = [atsakymas, 'I'];
        case 9
            atsakymas = [atsakymas, 'H'];
    end
end
% pateikime rezultatà komandiniame lange
% disp(atsakymas)
figure(10), text(0.1,0.5,atsakymas,'FontSize',38), axis off





%{

Isvados:
Su RBFN ir 13 neuronu
1. Pavyko apmokyti tinkla tiksliai su 4x9 simboliais ir priskirti raides atsakymams 
2. Testuojant su nauju pav TUKU DUKU - pavyko isgauti ir atvaizduoti 8
simbolius
3. Testuojant su tekstu kuriame nebuvo apmokytų raidžių, neuroninis tinklas
kartais priskirdava "C" kartasi "D" - veitoje "O" raides.


Su RBFN ir 6 neuronais
1. Apsymokymas buvo nesėkmingas su pirmais dveim simboliais, dėl to gauti
klaidingi vėlesni rezultatai.
2. Su 2 simbolių klaidomis. Tikriausiai reikėtų didinti neuronų skaičių arba apmokomų duomenų.
3. Su 4 simbolių klaidomis. Tikriausiai reikėtų didinti neuronų skaičių arba apmokomų duomenų.
-----
4. Su FNN apmokyti pavyko, taciau testuojant rezultatai klaidingi su 7
simboliais is 8. 



%}
