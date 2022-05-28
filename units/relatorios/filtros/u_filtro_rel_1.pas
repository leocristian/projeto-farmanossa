unit u_filtro_rel_1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList;

type
  TFormRel1 = class(TForm)
    pn_filtro: TPanel;
    Label2: TLabel;
    CodProdEdit: TEdit;
    SpeedButton1: TSpeedButton;
    LimparProd: TBitBtn;
    DescProdEdit: TEdit;
    Label3: TLabel;
    CodLocalEdit: TEdit;
    SpeedButton2: TSpeedButton;
    LimparLocal: TBitBtn;
    DescLocalEdit: TEdit;
    ImageList1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRel1: TFormRel1;

implementation

{$R *.dfm}

end.
