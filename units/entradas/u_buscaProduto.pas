unit u_buscaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TBuscaProdutoForm = class(TForm)
    pn_buscaProd: TPanel;
    CampoBusca: TComboBox;
    CampoEdit: TEdit;
    ImageList1: TImageList;
    BuscaBtn: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuscaProdutoForm: TBuscaProdutoForm;

implementation

{$R *.dfm}

end.
