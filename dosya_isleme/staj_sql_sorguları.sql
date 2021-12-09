use odev;

--SELECT * FROM tbl_NewVendorData WHERE ([url] NOT REGEXP '^[-A-Za-z0-9/.]+$');

--select COUNT(*) from tbl_NewVendorData;


--veritaban?na islenecek satir sayisi---------------------------------------
INSERT INTO musteri_bilgileri(veritaban?na_islenecek_satir_sayisi)
select count(*)
from tbl_NewVendorData
----------------------------------------------------------------------

delete from musteri_bilgileri where veritaban?na_islenecek_satir_sayisi =10;


select* from musteri_bilgileri;



-----------Mukerrer sat?r say?s?n? bulduran sorgu---------------------------------
SELECT Musteri_Adi,COUNT(Musteri_Adi)
FROM tbl_NewVendorData
GROUP BY Musteri_Adi
HAVING COUNT(Musteri_Adi)>1
-------------------------------------------------------------


---------tablo olu?turup txt dosyas?ndan okutma sorgusu-------------------------
use [odev];
GO

create table [dbo].[tbl_NewVendorData](
	[Musteri_Adi] [nvarchar](50) not null,
	[Musteri_Soyadi] [nvarchar](30) not null,
	[Musteri_Adresi] [nvarchar](50) not null,
	[Musteri_Telefon] [int] not null
	Constraint [pk_tbl_Deneme] primary key clustered
	(
		[Musteri_Adi] asc
		)with(pad_index = off, statistics_norecompute = off , ignore_dup_key = off,
		allow_row_locks = on, allow_page_locks = on) on [primary]
		)on [primary]
go


bulk insert odev.dbo.tbl_NewVendorData
from 'C:\Users\Faruk\Documents\SQL Server Management Studio\Code Snippets\SQL\My Code Snippets\CustomerFile-2015-07-30T1520.txt'
with(
	
	fieldterminator = ',',
	rowterminator = ';\n',
	codepage = 'ACP'
	
)
go

select * from tbl_NewVendorData;

--------------------------------------------------------------------------------------------------------------

-----Musteri_B?LG?LER? tablosunu olu?turmak
use odev;
create table musteri_bilgileri(
	toplam_satir_sayisi int,
	mukerrer_satir_sayisi int,
	hangi_satir_mukerrer int,
	hatali_satir_sayisi int,
	hangi_satir_hatali int,
	veritaban?na_islenecek_satir_sayisi int
);





-------toplam satir sayisini gösteren sorgu ekran?---------------------

INSERT INTO musteri_bilgileri(toplam_satir_sayisi)
select count(*)
from musteri_bilgileri
---------------------------------------------

alter table Bilgiler
add mukerrer_sayisi int,mukerrer_sayisi_adim int;

----tarihi belirleme sorgu ekran?-----------------------------------
INSERT INTO Bilgiler(tarih)
SELECT * FROM musteri
WHERE 
content  LIKE '%[1-2][0-9][0-9][0-9]-0[0-9]-0[1-9]%'  or
content  LIKE '%[1-2][0-9][0-9][0-9]-0[0-9]-[1-2][0-9]%'  or
content  LIKE '%[1-2][0-9][0-9][0-9]-0[0-9]-3[0-1]%' OR
content  LIKE '%[1-2][0-9][0-9][0-9]-1[0-2]-0[1-9]%'  or
content  LIKE '%[1-2][0-9][0-9][0-9]-1[0-2]-[1-2][0-9]%'  or
content  LIKE '%[1-2][0-9][0-9][0-9]-1[0-2]-3[0-9]%';
------------------------------------------------------------------