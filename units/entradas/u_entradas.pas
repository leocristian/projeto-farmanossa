unit u_entradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TPagEntradas = class(TForm)
    Panel1: TPanel;
    PopupEntradas: TPopupMenu;
    NovaEntrada: TMenuItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    procedure NovaEntradaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagEntradas: TPagEntradas;

implementation

{$R *.dfm}

uses u_infoEntrada;

procedure TPagEntradas.NovaEntradaClick(Sender: TObject);
begin
//  FormEntrada.FramModoEdit.Text := 'N';
  FormEntrada.ShowModal;
end;

end.
