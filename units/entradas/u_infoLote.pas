unit u_infoLote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TInfoLoteForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DtFabricacaoEdit: TcxDateEdit;
    DtVencimentoEdit: TcxDateEdit;
    CloseBtn: TButton;
    Label3: TLabel;
    LoteLabel: TLabel;
    procedure CloseBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InfoLoteForm: TInfoLoteForm;

implementation

{$R *.dfm}

procedure TInfoLoteForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

end.
