% Program ini berdasarkan sumber yang saya dapatkan di website

% 1. Inisialisasi vektor koofisien dan mengatur dua baris pertama 
coeffVector = input('Input koofisien pertama: \n i.e. [an an-1 an-2 ... K] = ');
ceoffLength = length(coeffVector);
rhTableColumn = round(ceoffLength/2);
%  2.Inisialisasi tabel Routh-Hurwitz (array nol)
rhTable = zeros(ceoffLength,rhTableColumn);
%  Menghitung baris pertama tabel
rhTable(1,:) = coeffVector(1,1:2:ceoffLength);
%  Tentukan panjang koef ganjil atau genap
if (rem(ceoffLength,2) ~= 0)
    % Ganjil
    rhTable(2,1:rhTableColumn - 1) = coeffVector(1,2:2:ceoffLength);
else
    % Genap
    rhTable(2,:) = coeffVector(1,2:2:ceoffLength);
end
%% Menghitung baris tabel Routh-Hurwitz 
epss = 0.01;
for i = 3:ceoffLength
    %  special case: row of all zeros
    if rhTable(i-1,:) == 0
        order = (ceoffLength - i);
        cnt1 = 0;
        cnt2 = 1;
        for j = 1:rhTableColumn - 1
            rhTable(i-1,j) = (order - cnt1) * rhTable(i-2,cnt2);
            cnt2 = cnt2 + 1;
            cnt1 = cnt1 + 2;
        end
    end   
    for j = 1:rhTableColumn - 1
        %  Elemen pertama baris atas
        firstElemUpperRow = rhTable(i-1,1);
        
        %  Menghitung tiap komponen di tabel
        rhTable(i,j) = ((rhTable(i-1,1) * rhTable(i-2,j+1)) - ....
            (rhTable(i-2,1) * rhTable(i-1,j+1))) / firstElemUpperRow;
    end
   
    if rhTable(i,1) == 0
        rhTable(i,1) = epss;
    end
end
%%  Unstable poles
unstablePoles = 0;
for i = 1:ceoffLength - 1
    if sign(rhTable(i,1)) * sign(rhTable(i+1,1)) == -1
        unstablePoles = unstablePoles + 1;
    end
end
%   Print hasil perhitungan
fprintf('\n Routh-Hurwitz Table: ')
rhTable
%   Print the stability result on screen
if unstablePoles == 0
    fprintf('~~~~~> Sistem stabil <~~~~~\n')
else
    fprintf('~~~~~> Sistem tidak stabil <~~~~~\n')
end