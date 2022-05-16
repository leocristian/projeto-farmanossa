unit u_buscaLocal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList;

type
  TBuscaLocalForm = class(TForm)
    ImageList1: TImageList;
    pn_buscaProd: TPanel;
    CampoBusca: TComboBox;
    CampoEdit: TEdit;
    BuscaBtn: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuscaLocalForm: TBuscaLocalForm;

implementation

{$R *.dfm}

end.
