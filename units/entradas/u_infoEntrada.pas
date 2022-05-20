unit u_infoEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, fm_buttons, System.ImageList, Vcl.ImgList, Vcl.Buttons, Uni,
  dxCameraControl, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdIMAP4;

type
  TFormEntrada = class(TForm)
    pn_form: TPanel;
    CodEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    ImageList1: TImageList;
    CodProdEdit: TEdit;
    DescProdEdit: TEdit;
    DescLocalEdit: TEdit;
    SpeedButton2: TSpeedButton;
    CodLocalEdit: TEdit;
    FrameButtons1: TFrameButtons;
    Label4: TLabel;
    LoteEdit: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DtFabricacaoEdit: TcxDateEdit;
    DtVencimentoEdit: TcxDateEdit;
    QtdProdEdit: TEdit;
    procedure FrameButtons1CancelarBtnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure CodProdEditExit(Sender: TObject);
    procedure CodLocalEditExit(Sender: TObject);
    procedure FrameButtons1SalvarBtnClick(Sender: TObject);
    procedure LoteEditExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEntrada: TFormEntrada;

implementation

{$R *.dfm}

uses u_buscaProduto, u_buscaLocal, u_dm1, u_controleForm, u_entradas,
  u_infoLote;

procedure TFormEntrada.CodLocalEditExit(Sender: TObject);
var
  q1: TUniQuery;

begin

  if CodLocalEdit.Text = '' then exit;

  DescLocalEdit.Clear;

  try
    q1 := TUniQuery.Create(q1);
    q1.Connection := dm1.con1;

    q1.SQL.Text := 'select loc_descricao, loc_status from tb_locais_estoque where loc_codigo = :codigo';
    q1.ParamByName('codigo').Value := CodLocalEdit.Text;

    q1.Open;

    if q1.RecordCount = 1 then
    begin
      if q1.FieldByName('loc_status').Value = 'INATIVO' then
      begin
        Aviso('O local de estoque ' + q1.FieldByName('loc_descricao').Value + ' está INATIVO');
        CodLocalEdit.Clear;
        DescLocalEdit.Clear;
        CodLocalEdit.SetFocus;
      end
      else
      begin
        DescLocalEdit.Text := q1.FieldByName('loc_descricao').Value;
      end;
    end
    else
    begin
      CodLocalEdit.Clear;
      CodLocalEdit.SetFocus;
    end;
  finally
    q1.Close;
    FreeAndNil(q1);
  end;
end;

procedure TFormEntrada.CodProdEditExit(Sender: TObject);
var
  q1: TUniQuery;

begin

  if CodProdEdit.Text = '' then exit;

  DescProdEdit.Clear;

  try
    q1 := TUniQuery.Create(q1);
    q1.Connection := dm1.con1;

    q1.SQL.Text := 'select prod_descricao, prod_status_entrada from tb_produtos where prod_codigo = :codigo';
    q1.ParamByName('codigo').Value := CodProdEdit.Text;

    q1.Open;

    if q1.RecordCount = 1 then
    begin
      if q1.FieldByName('prod_status_entrada').Value = 'INATIVO' then
      begin
        Aviso('O produto ' + q1.FieldByName('prod_descricao').Value + ' não permite entrada!');
        CodProdEdit.Clear;
        DescProdEdit.Clear;
        CodProdEdit.SetFocus;
      end
      else
      begin
        DescProdEdit.Text := q1.FieldByName('prod_descricao').Value;
      end;
    end
    else
    begin
      CodProdEdit.Clear;
      CodProdEdit.SetFocus;
    end;
  finally
    q1.Close;
    FreeAndNil(q1);
  end;
end;

procedure TFormEntrada.FormKeyPress(Sender: TObject; var Key: Char);
begin
  begin
    if Key = #13 then
    begin
      Key := #0;
      Perform(wm_nextdlgctl, 0, 0);
    end
    else if key = #27 then close
  end;
end;

procedure TFormEntrada.FormShow(Sender: TObject);
var
  q1: TUniQuery;
  index, codigo: Integer;

begin

  if FrameButtons1.ModoEdit.Text = 'N' then
  begin
    pn_form.Enabled := true;
    FrameButtons1.SalvarBtn.Visible := true;
    LimparInputs(self);
    DtFabricacaoEdit.Clear;
    DtVencimentoEdit.Clear;
    CodProdEdit.SetFocus;

    CodEdit.Text := '0000';
    FrameButtons1.ModoEdit.Text := 'N';
  end
  else if FrameButtons1.ModoEdit.Text = 'V' then
  begin
    pn_form.Enabled := false;
    FrameButtons1.SalvarBtn.Visible := false;
    FrameButtons1.SalvarBtn.Caption := 'Confirmar Entrada';

    index := PagEntradas.gridEntradasDBTableView1.DataController.GetSelectedRowIndex(0);
    codigo := PagEntradas.gridEntradasDBTableView1.ViewData.Records[index].Values[0];

    try
      q1 := TUniQuery.Create(q1);
      q1.Connection := dm1.con1;

      q1.SQL.clear;
      q1.SQL.Add('select e.*, p.prod_descricao, l.loc_descricao from tb_produtos as p');
      q1.SQL.Add('inner join tb_entradas as e');
      q1.SQL.Add('on ent_produto = prod_codigo');
      q1.SQL.Add('inner join tb_locais_estoque as l');
      q1.SQL.Add('on loc_codigo = ent_local');
      q1.SQL.Add('where ent_codigo = :codigo');

      q1.ParamByName('codigo').Value := codigo;

      q1.Open;

      CodEdit.Text := q1.FieldByName('ent_codigo').Value;
      CodProdEdit.Text := q1.FieldByName('ent_produto').Value;
      CodLocalEdit.Text := q1.FieldByName('ent_local').Value;

      DescProdEdit.Text := q1.FieldByName('prod_descricao').Value;
      DescLocalEdit.Text := q1.FieldByName('loc_descricao').Value;

      DtFabricacaoEdit.Date :=  q1.FieldByName('ent_dtfabricacao').Value;
      DtVencimentoEdit.Date :=  q1.FieldByName('ent_dtvencimento').Value;

      LoteEdit.Text := q1.FieldByName('ent_lote').Value;
      QtdProdEdit.Text := q1.FieldByName('ent_quantidade').Value;
    finally
      q1.Close;
      FreeAndNil(q1);
    end;
  end
  else if FrameButtons1.ModoEdit.Text = 'A' then
  begin
    pn_form.Enabled := true;
    FrameButtons1.SalvarBtn.Visible := true;
    FrameButtons1.SalvarBtn.Caption := 'Salvar Alterações';
    CodProdEdit.SetFocus;

    index := PagEntradas.gridEntradasDBTableView1.DataController.GetSelectedRowIndex(0);
    codigo := PagEntradas.gridEntradasDBTableView1.ViewData.Records[index].Values[0];

    try
      q1 := TUniQuery.Create(q1);
      q1.Connection := dm1.con1;

      q1.SQL.clear;
      q1.SQL.Add('select e.*, p.prod_descricao, l.loc_descricao from tb_produtos as p');
      q1.SQL.Add('inner join tb_entradas as e');
      q1.SQL.Add('on ent_produto = prod_codigo');
      q1.SQL.Add('inner join tb_locais_estoque as l');
      q1.SQL.Add('on loc_codigo = ent_local');
      q1.SQL.Add('where ent_codigo = :codigo');

      q1.ParamByName('codigo').Value := codigo;

      q1.Open;

      CodEdit.Text := q1.FieldByName('ent_codigo').Value;
      CodProdEdit.Text := q1.FieldByName('ent_produto').Value;
      CodLocalEdit.Text := q1.FieldByName('ent_local').Value;

      DescProdEdit.Text := q1.FieldByName('prod_descricao').Value;
      DescLocalEdit.Text := q1.FieldByName('loc_descricao').Value;

      DtFabricacaoEdit.Date :=  q1.FieldByName('ent_dtfabricacao').Value;
      DtVencimentoEdit.Date :=  q1.FieldByName('ent_dtvencimento').Value;

      LoteEdit.Text := q1.FieldByName('ent_lote').Value;
      QtdProdEdit.Text := q1.FieldByName('ent_quantidade').Value;
    finally
      q1.Close;
      FreeAndNil(q1);
    end;
  end;
end;

procedure TFormEntrada.FrameButtons1CancelarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFormEntrada.FrameButtons1SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  loc_codigo: Variant;

begin
  if ExisteInputVazio(self) then
  begin
    Aviso('Preencha todos os campos!');
    CodProdEdit.SetFocus;
    exit;
  end;

  if DtFabricacaoEdit.Date > Now then
  begin
    Aviso('Data de FABRICAÇÃO não pode ser maior que a data atual!');
    DtFabricacaoEdit.SetFocus;
    exit;
  end;

  if DtVencimentoEdit.Date < Now then
  begin
    Aviso('Data de VENCIMENTO não pode ser menor que a data atual!');
    DtVencimentoEdit.SetFocus;
    exit;
  end;

  if DtVencimentoEdit.Date <= DtFabricacaoEdit.Date then
  begin
    Aviso('Data de vencimento deve ser MAIOR que a data de fabricação!');
    DtVencimentoEdit.SetFocus;
    exit;
  end;

  try
    q1 := TUniQuery.Create(q1);
    q1.Connection := dm1.con1;

    if FrameButtons1.ModoEdit.Text = 'N' then
    begin
      q1.SQL.Text := 'select nextval(''tb_locais_cod_seq'') as loc_codigo';

      q1.Open;
      loc_codigo := q1.FieldByName('loc_codigo').Value;

      q1.Close;
      q1.SQL.Clear;
      q1.SQL.Add('insert into tb_entradas ');
      q1.SQL.Add('(ent_codigo, ent_produto, ent_local, ent_lote, ent_dtfabricacao, ent_dtvencimento, ent_quantidade) ');
      q1.SQL.Add('values (:codigo, :produto, :local, :lote, :dtfabricacao, :dtvencimento, :quantidade)');
    end
    else if FrameButtons1.ModoEdit.Text = 'A' then
    begin
      q1.SQL.Clear;
      loc_codigo := CodEdit.Text;
      q1.SQL.Add('update tb_entradas set ');
      q1.SQL.Add('ent_produto = :produto, ent_local = :local, ent_lote = :lote, ');
      q1.SQL.Add('ent_dtfabricacao = :dtfabricacao, ent_dtvencimento = :dtvencimento, ent_quantidade = :quantidade');
      q1.SQl.Add('where ent_codigo = :codigo')
    end;

    q1.ParamByName('codigo').Value := loc_codigo;
    q1.ParamByName('produto').Value := CodProdEdit.Text;
    q1.ParamByName('local').Value := CodLocalEdit.Text;
    q1.ParamByName('lote').Value := LoteEdit.Text;
    q1.ParamByName('dtfabricacao').Value := DtFabricacaoEdit.Date;
    q1.ParamByName('dtvencimento').Value := DtVencimentoEdit.Date;
    q1.ParamByName('quantidade').Value := QtdProdEdit.Text;

    if Confirma('Confirmar operação?') then
    begin
      try
        q1.ExecSQL;
        Mensagem('Operação realizada com sucesso!');
        PagEntradas.gridEntradasDBTableView1.DataController.RefreshExternalData;
        Close;
      except on e:exception do
        Erro('Erro!' + #13 + e.Message);
      end;

    end;
  finally
    q1.Close;
    FreeAndNil(q1);
  end;
end;

procedure TFormEntrada.LoteEditExit(Sender: TObject);
var
  q1: TUniQuery;

begin

  if LoteEdit.Text = '' then exit;

  try
    q1 := TUniQuery.Create(q1);
    q1.Connection := dm1.con1;

    q1.SQL.Clear;
    q1.SQL.Add('select exists(select e.ent_dtfabricacao, e.ent_dtvencimento from tb_entradas as e');
    q1.SQL.Add('where ent_lote = :lote)');

    q1.ParamByName('lote').Value := LoteEdit.Text;

    q1.Open;

    if q1.FieldByName('exists').Value then
    begin
      q1.Close;
      q1.SQL.Text := 'select ent_dtfabricacao, ent_dtvencimento from tb_entradas where ent_lote = :lote';
      q1.ParamByName('lote').Value := LoteEdit.Text;

      q1.Open;

      InfoLoteForm.LoteLabel.Caption := LoteEdit.Text;
      InfoLoteForm.DtFabricacaoEdit.Date := q1.FieldByName('ent_dtfabricacao').Value;
      InfoLoteForm.DtVencimentoEdit.Date := q1.FieldByName('ent_dtvencimento').Value;
      InfoLoteForm.ShowModal;

      LoteEdit.Clear;
      LoteEdit.SetFocus;
    end;

  finally
    q1.Close;
    FreeAndNil(q1);
  end;
end;

procedure TFormEntrada.SpeedButton1Click(Sender: TObject);
begin
  BuscaProdutoForm.ShowModal;
end;

procedure TFormEntrada.SpeedButton2Click(Sender: TObject);
begin
  BuscaLocalForm.ShowModal;
end;

end.
