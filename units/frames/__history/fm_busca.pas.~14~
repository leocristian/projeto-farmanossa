unit fm_busca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrameBusca = class(TFrame)
    BuscaSelect: TComboBox;
    BuscaEdit: TEdit;
    BitBtn1: TBitBtn;
    ImageList1: TImageList;
    procedure BuscaEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses u_controleForm;

procedure TFrameBusca.BuscaEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    BitBtn1.SetFocus;
  end;
end;

end.
