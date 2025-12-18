program SistemVoting;
uses crt;

const
    maxKandidat = 10;

type
    TKandidat = record
        nama : string;
        suara: integer;
    end;

var
    kandidat : array[1..maxKandidat] of TKandidat;
    jumlahKandidat : integer;
    menu, pilihan : integer;

procedure InputKandidat();
var
    i : integer;
begin
    clrscr;
    write('Masukkan jumlah kandidat (max 10): ');
    readln(jumlahKandidat);

    if (jumlahKandidat < 1) or (jumlahKandidat > maxKandidat) then
    begin
        writeln('Jumlah tidak valid!');
        jumlahKandidat := 0;
        readln;
        exit;
    end;

    for i := 1 to jumlahKandidat do
    begin
        writeln;
        write('Nama kandidat ke-', i, ': ');
        readln(kandidat[i].nama);
        kandidat[i].suara := 0;
    end;

    writeln;
    writeln('Kandidat berhasil diinput!');
    readln;
end;
procedure TampilkanKandidat();
var
    i : integer;
begin
    clrscr;
    writeln('=== DAFTAR KANDIDAT ===');
    if jumlahKandidat = 0 then
    begin
        writeln('Belum ada kandidat.');
        readln;
        exit;
    end;

    for i := 1 to jumlahKandidat do
        writeln(i, '. ', kandidat[i].nama, ' (Suara: ', kandidat[i].suara, ')');

    readln;
end;
procedure Voting();
begin
    clrscr;
    if jumlahKandidat = 0 then
    begin
        writeln('Belum ada kandidat.');
        readln;
        exit;
    end;

    writeln('=== VOTING ===');
    TampilkanKandidat();

    write('Pilih nomor kandidat yang ingin dipilih: ');
    readln(pilihan);

    if (pilihan < 1) or (pilihan > jumlahKandidat) then
    begin
        writeln('Pilihan tidak valid');
        readln;
        exit;
    end;

    kandidat[pilihan].suara := kandidat[pilihan].suara + 1;
    writeln('Terima kasih, suara Anda sudah diterima');
    readln;
end;
procedure HasilVoting();
var
    i, maxSuara, idxMax : integer;
begin
    clrscr;

    if jumlahKandidat = 0 then
    begin
        writeln('Belum ada kandidat.');
        readln;
        exit;
    end;

    writeln('=== HASIL VOTING ===');
    for i := 1 to jumlahKandidat do
        writeln(kandidat[i].nama, ' : ', kandidat[i].suara, ' suara');

    maxSuara := kandidat[1].suara;
    idxMax := 1;

    for i := 2 to jumlahKandidat do
    begin
        if kandidat[i].suara > maxSuara then
        begin
            maxSuara := kandidat[i].suara;
            idxMax := i;
        end;
    end;

    writeln;
    writeln('Pemenang: ', kandidat[idxMax].nama, 
            ' dengan ', maxSuara, ' suara!');
    readln;
end;
begin
    jumlahKandidat := 0;
    repeat
        clrscr;
        writeln('=== SISTEM VOTING SEDERHANA ===');
        writeln('1. Input kandidat');
        writeln('2. Lihat daftar kandidat');
        writeln('3. Voting');
        writeln('4. Lihat hasil voting & pemenang');
        writeln('0. Keluar');
        write('Pilih menu: '); readln(menu);

        case menu of
            1: InputKandidat();
            2: TampilkanKandidat();
            3: Voting();
            4: HasilVoting();
            0: writeln('Terima kasih telah menggunakan program.');
        else
            writeln('Pilihan tidak valid!');
            readln;
        end;
    until menu = 0;
end.
