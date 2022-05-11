unit u_operadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls,
  Vcl.Menus, cxControls;

type
  TFormOperadores = class(TForm)
    Panel1: TPanel;
    gridOperadoresDBTableView1: TcxGridDBTableView;
    gridOperadoresLevel1: TcxGridLevel;
    gridOperadores: TcxGrid;
    PopupOperador: TPopupMenu;
    Detalhar1: TMenuItem;
    N1: TMenuItem;
    N1Incluirnovoregistro1: TMenuItem;
    N2AlterarregistroatualF31: TMenuItem;
    N3ExcluirF41: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOperadores: TFormOperadores;

implementation

{$R *.dfm}

end.
